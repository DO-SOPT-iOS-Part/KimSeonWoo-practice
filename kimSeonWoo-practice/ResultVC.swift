//
//  ResultVC.swift
//  kimSeonWoo-practice
//
//  Created by Seonwoo Kim on 2023/10/07.
//

import UIKit

class ResultVC: UIViewController {
    
    //ResultVC
    //ResultVC
    var loginDataCompletion: (([String]) -> Void)? //스트링 타입의 배열을 매개변수로 전달 할거고, 리턴타입은 void다!
    var delegate: GetDataProtocol?
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var passwordLabel: UILabel!

    @IBOutlet weak var switchLabel: UILabel!
    
    var email: String = ""
    var password: String = ""
    var switchStatus: String = ""

    private func bindText() {
            self.emailLabel.text = "email : \(email)"
        self.passwordLabel.text = "password : \(password)"
        self.switchLabel.text = "switch : \(switchStatus)"
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bindText()

        // Do any additional setup after loading the view.
    }
    
    func setLabelText(id: String,
                          password: String,
                      switchStatus: String) {
        self.email = id
        self.password = password
        self.switchStatus = switchStatus
    }
    

    @IBAction func backButtonTap(_ sender: Any) {
            if let navigationController = self.navigationController {
                navigationController.popViewController(animated: true)
            } else {
                self.dismiss(animated: true)
            }
        delegate?.getLoginData(email: self.email,
                               password: self.password, switchStatus: self.switchStatus)
        
        guard let loginDataCompletion else {return}
        loginDataCompletion([self.email, self.password, self.switchStatus])
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
