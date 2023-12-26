//
//  YourViewController.swift
//  kimSeonWoo-practice
//
//  Created by Seonwoo Kim on 12/25/23.
//

import UIKit
import KakaoSDKUser

class YourViewController: UIViewController {
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Kakao 로그인", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 200),
            loginButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc private func loginButtonTapped() {
        print(UserApi.isKakaoTalkLoginAvailable())
        if UserApi.isKakaoTalkLoginAvailable() {
            UserApi.shared.loginWithKakaoTalk { (oauthToken, error) in
                if let error = error {
                    print("Kakao login error: \(error)")
                } else {
                    print("Kakao login success.")
                    if let token = oauthToken {
                        print("Access Token: \(token.accessToken)")
                        // 여기에 필요한 작업 수행
                    }
                }
            }
        }
    }
}
