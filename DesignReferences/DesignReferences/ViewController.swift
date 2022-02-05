//
//  ViewController.swift
//  DesignReferences
//
//  Created by Lily Pham on 2/2/22.
//

import UIKit

class ViewController: UIViewController {
    //variables
    private var button1 = UIButton()
    private var button2 = UIButton()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
        title = "Color Palette Generator"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        //button one
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.setTitle("Generate New Palette", for: .normal)
        button1.setTitleColor(.black, for: .normal)
        button1.backgroundColor = UIColor.white
        button1.layer.cornerRadius = 4
        button1.addTarget(self, action: #selector(button1Pressed), for: .touchUpInside)
        view.addSubview(button1)
        
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.setTitle("Pushing", for: .normal)
        button2.setTitleColor(.black, for: .normal)
        button2.backgroundColor = UIColor.white
        button2.layer.cornerRadius = 4
        button2.addTarget(self, action: #selector(botton2Pressed), for: .touchUpInside)
        view.addSubview(button2)
        
        setUpViews()
    }
    
    func setUpViews() {
        NSLayoutConstraint.activate([
            button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button1.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -24),
            button1.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24),
            button1.heightAnchor.constraint(equalToConstant: 48)
        ])
        NSLayoutConstraint.activate([
            button2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 24),
            button2.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24),
            button2.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    // Push
    @objc func button1Pressed() {
        let vc = Test1ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // Present
    @objc func botton2Pressed() {
        //let vc = Test2ViewController(delegate: self, placeholderText: navigationController?.title ?? "view controllers")
        let vc = Test2ViewController()
        present(vc, animated: true, completion: nil)
    }


}

