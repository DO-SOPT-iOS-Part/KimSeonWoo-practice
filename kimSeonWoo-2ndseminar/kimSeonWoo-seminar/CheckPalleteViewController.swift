//
//  CheckPalleteViewController.swift
//  kimSeonWoo-seminar
//
//  Created by Seonwoo Kim on 2023/10/14.
//

import UIKit

class CheckPalleteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setLayout()
        // Do any additional setup after loading the view.
    }
    
    private func setLayout(){
        [left1,right1,left2, right2].forEach {
            [weak self] view in
            guard let self else {return}
            view.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(view)
        }
        
        NSLayoutConstraint.activate([left1.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
                                     left1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
                                     left1.widthAnchor.constraint(equalToConstant: view.bounds.width / 2),
                                     left1.heightAnchor.constraint(equalToConstant: view.bounds.height / 4)])
        NSLayoutConstraint.activate([right1.topAnchor.constraint(equalTo: self.left1.bottomAnchor, constant: 0),
                                     right1.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
                                     right1.widthAnchor.constraint(equalToConstant: view.bounds.width / 2),
                                     right1.heightAnchor.constraint(equalToConstant: view.bounds.height / 4)])
        
        NSLayoutConstraint.activate([left2.topAnchor.constraint(equalTo: self.right1.bottomAnchor, constant: 0),
                                     left2.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
                                     left2.widthAnchor.constraint(equalToConstant: view.bounds.width / 2),
                                     left2.heightAnchor.constraint(equalToConstant: view.bounds.height / 4)])

        
        NSLayoutConstraint.activate([right2.topAnchor.constraint(equalTo: self.left2.bottomAnchor, constant: 0),
                                     right2.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
                                     right2.widthAnchor.constraint(equalToConstant: view.bounds.width / 2),
                                     right2.heightAnchor.constraint(equalToConstant: view.bounds.height / 4)])

        
        
    }

    var left1: UIView = {
        let view = UIView()
        
        view.backgroundColor = .yellow
        view.clipsToBounds = true
        return view
    }()
    
    var right1: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.clipsToBounds = true
        return view
    }()

    var left2: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.clipsToBounds = true
        return view
    }()
    
    var right2: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.clipsToBounds = true
        return view
    }()


}
