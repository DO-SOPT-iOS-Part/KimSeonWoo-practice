import UIKit
import SnapKit
import Then

class PanGestureVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLayout()
        
    }
    
    private func setLayout() {
        self.view.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.height.equalTo(100)
        }
    }
    
    
    @objc private func didImageViewMoved(_ sender: UIPanGestureRecognizer) {
        let transition = sender.translation(in: imageView)
        
        print(sender.state)
        let changedX = imageView.center.x + transition.x
        let changedY = imageView.center.y + transition.y
        self.imageView.center = .init(x: changedX,
                                     y: changedY)
        sender.setTranslation(.zero, in: imageView)
        // 좌표의 값을 초기화 해준다
    }
    
    
    private lazy var imageView = UIImageView(image: UIImage(named: "event_img_logo_pb")).then {
        let gesture = UIPanGestureRecognizer(target: self,
                                             action: #selector(didImageViewMoved(_:)))
        $0.addGestureRecognizer(gesture)
        $0.isUserInteractionEnabled = true
    }

}
