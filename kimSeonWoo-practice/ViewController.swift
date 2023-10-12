//
//  ViewController.swift
//  kimSeonWoo-practice
//
//  Created by Seonwoo Kim on 2023/10/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var descriptionAge: UILabel!
    
    @IBOutlet weak var descriptionColor: UILabel!
    @IBOutlet weak var mySwitch: UISwitch!
    
    @IBOutlet weak var mySlider: UISlider!
    
    private var idText: String = ""
    private var passwordText: String = ""
    private var toggleSwitchStatus: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
  
    @IBAction func idChange(_ sender: Any) {
        guard let textField = sender as? UITextField else {return}
        if let idText = textField.text {
            self.idText = idText
        }
    }
    
    @IBAction func passwordChange(_ sender: Any) {
        guard let textField = sender as? UITextField else {return}
        if let passwordText = textField.text {
            self.passwordText = passwordText
        }
    }
    

    @IBAction func switchToggled(_ sender: Any) {
        if mySwitch.isOn {
            descriptionColor.textColor = UIColor.green
            self.toggleSwitchStatus = mySwitch.isOn
            print(toggleSwitchStatus)
        }
        else {
            descriptionColor.textColor = UIColor.white
            self.toggleSwitchStatus =  mySwitch.isOn
            print(toggleSwitchStatus)
        }
    }
    
    @IBAction func sliderSlide(_ sender: Any) {
        let sliderValue = String(Int(mySlider.value))
        descriptionAge.text = "나이: \(sliderValue)"
    }

    
    
    @IBAction func loginButtonTap(_ sender: Any) {
        print("\(idText)\n\(passwordText)")
        pushToResultVC()

    }
    func pushToResultVC() {
        guard let resultVC = self.storyboard?.instantiateViewController(identifier: "ResultVC") as? ResultVC else {return}
        resultVC.email = idText
        resultVC.password = passwordText
        resultVC.switchStatus = String(toggleSwitchStatus)
        resultVC.delegate = self
        resultVC.loginDataCompletion = { data in
            print("클로저로 받아온 email : \(data[0]), 클로저로 받아온 password : \(data[1]),클로저로 받아온 switch : \(data[2])")
        }
        
        self.navigationController?.pushViewController(resultVC, animated: true)
        
    }
        
    func presentToResultVC() {
            guard let resultVC = self.storyboard?.instantiateViewController(withIdentifier: "ResultVC") as? ResultVC else {return}
            resultVC.setLabelText(id: idText,
                                  password: passwordText, switchStatus: String(toggleSwitchStatus))
            self.present(resultVC, animated: true)
        
    }
}

extension ViewController: GetDataProtocol {
    func getLoginData(email: String, password: String, switchStatus: String) {
        print("받아온 email : \(email), 받아온 password : \(password), status: \(switchStatus)")
    }
}

