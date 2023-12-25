import UIKit
import SnapKit
import Then
import Lottie

class PanGestureTapVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    private let values: [String] = ["A","B","C","D","E","F","G","H","I"]
    private let headerView = HomePlaceSectionHeaderView()
    var textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "hi"
        
        return textLabel
    }()
    
    lazy var pickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.backgroundColor = .white
        picker.delegate = self
        picker.dataSource = self

        return picker
    }()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        values.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return values[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        print("row: \(row)")
        print("value: \(values[row])")
        textLabel.text = values[row]
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLayout()
        print("load")
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        headerView.delegate = self
        
        self.view.addSubview(lottieView)
        self.view.addSubview(imageView)
        self.view.addSubview(pickerView)
        self.view.addSubview(headerView)
        imageView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.height.equalTo(100)
        }
        lottieView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.height.equalTo(200)
        }
        pickerView.snp.makeConstraints {
            $0.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(200)
        }
        headerView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.height.equalTo(300)
            $0.width.equalTo(300)
        }
    }
    
    private func isDraging(state: Bool) {
        if state {
            self.lottieView.isHidden = false
            self.lottieView.play()
        } else {
            self.lottieView.isHidden = true
            self.lottieView.pause()
        }
    }
    
    
    @objc private func didImageViewMoved(_ sender: UIPanGestureRecognizer) {
        let transition = sender.translation(in: imageView)
        let changedX = imageView.center.x + transition.x
        let changedY = imageView.center.y + transition.y
        self.imageView.center = .init(x: changedX,
                                      y: changedY)
        self.lottieView.center = .init(x: changedX,
                                       y: changedY)
        sender.setTranslation(.zero, in: imageView)
        
        if sender.state == .began {
            self.isDraging(state: true)
        }
        else if sender.state == .ended {
            self.isDraging(state: false)
        }
    }
    
    private let lottieView = LottieAnimationView(name: "dragAnimation").then {
        $0.loopMode = .loop
    }
    private lazy var imageView = UIImageView(image: UIImage(named: "event_img_logo_pb")).then {
        $0.isUserInteractionEnabled = true
        let gesture = UIPanGestureRecognizer(target: self,
                                             action: #selector(didImageViewMoved(_:)))
        $0.addGestureRecognizer(gesture)
    }
    
}

extension PanGestureTapVC: HomeViewPushDelegate {
    func didTapButton() {
        let placeViewController = ResultVC()
        self.navigationController?.pushViewController(placeViewController, animated: true)
        NPToast.show(message: "toast")
    }
}
