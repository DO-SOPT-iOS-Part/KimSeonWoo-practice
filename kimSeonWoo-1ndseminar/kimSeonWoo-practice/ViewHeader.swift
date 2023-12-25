//
//  ViewHeader.swift
//  kimSeonWoo-practice
//
//  Created by Seonwoo Kim on 12/25/23.
//

import UIKit

protocol HomeViewPushDelegate: AnyObject {
    func didTapButton()
}

final class HomePlaceSectionHeaderView: UIView,UIGestureRecognizerDelegate {
    weak var delegate: HomeViewPushDelegate?
    
    static let identifier: String = "HomePlaceSectionHeaderView"
    let homeViewController = PanGestureVC()

    private lazy var viewAllButton: UIButton = {
        var button = UIButton()
        button.setTitle("전체보기", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(onTapButton), for: .touchUpInside)
        button.backgroundColor = .lightGray
                
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        self.backgroundColor = .yellow
    }
    
    private func setLayout() {
            
            self.addSubview(viewAllButton)

            viewAllButton.snp.makeConstraints {
                $0.top.equalToSuperview().offset(77)
                $0.trailing.equalToSuperview()
                $0.width.equalTo(100)
                $0.height.equalTo(30)
            }
        
        }
        
    
    @objc
    func onTapButton() {
        print("tap")
        self.delegate?.didTapButton()
        print("taptap")
       }
    }
