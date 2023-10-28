//
//  ViewController.swift
//  assignment1
//
//  Created by Seonwoo Kim on 2023/10/28.
//

import UIKit
import Then

import SnapKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(blueView)
        
        blueView.snp.makeConstraints{
            $0.size.equalTo(100)
            $0.center.equalToSuperview()        }

        // Do any additional setup after loading the view.
    }
    
    let blueView = UIView().then {
        $0.backgroundColor = .systemBlue
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
