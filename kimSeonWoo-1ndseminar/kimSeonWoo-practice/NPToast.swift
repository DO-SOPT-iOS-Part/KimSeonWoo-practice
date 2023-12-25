//
//  NPToasy.swift
//  kimSeonWoo-practice
//
//  Created by Seonwoo Kim on 12/25/23.
//

import UIKit

import SnapKit

final class NPToast {
    static func show (message: String, duration: TimeInterval = 1, isTabBar: Bool = true, completion: (() -> Void)? = nil) {
        let toastView = NPToastView(message: message)
        guard let window = UIApplication.shared.keyWindow else { return }

        window.subviews
            .filter { $0 is NPToastView }
            .forEach { $0.removeFromSuperview() }
        window.addSubview(toastView)
        
        toastView.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(120)
            
            $0.leading.trailing.equalToSuperview().inset(25)
        }
        
        window.layoutSubviews()
        
        fadeIn(completion: {
            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                fadeOut(completion: {
                    completion?()
                })
            }
        })
        
        func fadeIn(completion: (() -> Void)? = nil) {
            toastView.alpha = 0
            UIView.animate(withDuration: 0.5) {
                toastView.alpha = 1
            } completion: { _ in
                completion?()
            }
            
        }
        
        func fadeOut(completion: (() -> Void)? = nil) {
            toastView.alpha = 1
            UIView.animate(withDuration: 0.5) {
                toastView.alpha = 0
            } completion: { _ in
                toastView.removeFromSuperview()
                completion?()
            }
        }
    }
}
