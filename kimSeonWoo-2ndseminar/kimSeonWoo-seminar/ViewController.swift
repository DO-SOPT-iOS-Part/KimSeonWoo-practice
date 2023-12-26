//
//  YourViewController.swift
//  kimSeonWoo-practice
//
//  Created by Seonwoo Kim on 12/25/23.
//

import UIKit
import KakaoSDKUser
import AuthenticationServices

class YourViewController: UIViewController {
    
    func setAppleLoginButton() {
            let authorizationButton = ASAuthorizationAppleIDButton(authorizationButtonType: .signIn, authorizationButtonStyle: .black)
            authorizationButton.addTarget(self, action: #selector(handleAuthorizationAppleIDButtonPress), for: .touchUpInside)
            self.view.addSubview(authorizationButton)
            
            // AutoLayout
            authorizationButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                authorizationButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                authorizationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                authorizationButton.widthAnchor.constraint(equalToConstant: 300),
                authorizationButton.heightAnchor.constraint(equalToConstant: 48)
            ])
        }
        
        // 버튼 클릭시 액션
        @objc
        func handleAuthorizationAppleIDButtonPress() {
            let appleIDProvider = ASAuthorizationAppleIDProvider()
            let request = appleIDProvider.createRequest()
            request.requestedScopes = [.fullName, .email]
            
            let authorizationController = ASAuthorizationController(authorizationRequests: [request])
            authorizationController.delegate = self
            authorizationController.presentationContextProvider = self
            authorizationController.performRequests()
        }
        
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Kakao 로그인", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAppleLoginButton()
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

extension YourViewController: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    
    // 로그인 진행하는 화면 표출
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
    
    // Apple ID 연동 성공 시
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
            // Apple ID
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email
            
            print("User ID : \(userIdentifier)")
            print("User Email : \(email ?? "")")
            print("User Name : \((fullName?.givenName ?? "") + (fullName?.familyName ?? ""))")
            
        default:
            break
        }
    }
    
    // Apple ID 연동 실패 시
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        // Handle error.
    }
}
