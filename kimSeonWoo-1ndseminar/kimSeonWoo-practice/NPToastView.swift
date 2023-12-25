//
//  NPToastView.swift
//  kimSeonWoo-practice
//
//  Created by Seonwoo Kim on 12/25/23.
//

import UIKit

final class NPToastView: UIView {
    
    private let messageLabel = UILabel()
    
    init(message: String, backgroundColor: UIColor? = UIColor.gray , messageColor: UIColor? = UIColor.white) {
        super.init(frame: .zero)
        self.messageLabel.textColor = messageColor
        self.messageLabel.text = message
        self.backgroundColor = backgroundColor?.withAlphaComponent(0.8)
        self.setUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NPToastView {
    private func setUI() {
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.messageLabel.textAlignment = .center

        self.addSubview(messageLabel)
        self.snp.makeConstraints {
            $0.height.equalTo(50)
            
        }
        self.messageLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
