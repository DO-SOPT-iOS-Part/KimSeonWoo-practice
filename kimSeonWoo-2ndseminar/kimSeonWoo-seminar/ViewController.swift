//
//  ViewController.swift
//  kimSeonWoo-seminar
//
//  Created by Seonwoo Kim on 2023/10/14.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        setLayout()
    }
    
    private func setLayout(){
        [바둑알1, 바둑알2, 방어막].forEach {
            [weak self] view in
            guard let self else {return}
            view.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(view)
        }
        
        NSLayoutConstraint.activate([바둑알1.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40),
                                     바둑알1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40),
                                     바둑알1.widthAnchor.constraint(equalToConstant: 20),
                                     바둑알1.heightAnchor.constraint(equalToConstant: 20),])
        NSLayoutConstraint.activate([바둑알2.topAnchor.constraint(equalTo: self.바둑알1.topAnchor, constant: 40),
                                     바둑알2.leadingAnchor.constraint(equalTo: self.바둑알1.leadingAnchor, constant: 40),
                                     바둑알2.widthAnchor.constraint(equalToConstant: 20),
                                     바둑알2.heightAnchor.constraint(equalToConstant: 20),])
        NSLayoutConstraint.activate([방어막.topAnchor.constraint(equalTo: self.바둑알2.topAnchor, constant: 40),
                                     방어막.leadingAnchor.constraint(equalTo: self.바둑알2.leadingAnchor, constant: 40),
                                     방어막.widthAnchor.constraint(equalToConstant: 80),
                                     방어막.heightAnchor.constraint(equalToConstant: 20),])
        
        
    }

    var 바둑알1: UIView = {
        let view = UIView()
        
        view.backgroundColor = .black
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    var 바둑알2: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    var 방어막: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.layer.cornerRadius = 3
        view.clipsToBounds = true
        return view
    }()


}

