//
//  DetailViewController.swift
//  lnp35_p4
//
//  Created by Lily Pham on 10/24/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    private var descriptionLabel = UILabel()
    private var costLabel = UILabel()
    private var categoryLabel = UILabel()
    
    private var descriptionText = UITextField()
    private var costText = UITextField()
    private var categoryText = UITextField()
    
    private var button = UIButton()

    var placeholderText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.text = "Change Description:"
        descriptionLabel.font = UIFont.systemFont(ofSize: 18)
        descriptionLabel.textColor = .black
        view.addSubview(descriptionLabel)

        descriptionText.translatesAutoresizingMaskIntoConstraints = false
        descriptionText.font = UIFont.systemFont(ofSize: 18)
        // TODO 10: set placeholder text
        descriptionText.text = placeholderText
        descriptionText.borderStyle = .roundedRect
        descriptionText.textAlignment = .center
        view.addSubview(descriptionText)
        
        costLabel.translatesAutoresizingMaskIntoConstraints = false
        costLabel.text = "Change Cost:"
        costLabel.font = UIFont.systemFont(ofSize: 18)
        costLabel.textColor = .black
        view.addSubview(costLabel)

        costText.translatesAutoresizingMaskIntoConstraints = false
        costText.font = UIFont.systemFont(ofSize: 18)
        // TODO 10: set placeholder text
        costText.text = placeholderText
        costText.borderStyle = .roundedRect
        costText.textAlignment = .center
        view.addSubview(costText)
        
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.text = "Change Category:"
        categoryLabel.font = UIFont.systemFont(ofSize: 18)
        categoryLabel.textColor = .black
        view.addSubview(categoryLabel)

        categoryText.translatesAutoresizingMaskIntoConstraints = false
        categoryText.font = UIFont.systemFont(ofSize: 18)
        // TODO 10: set placeholder text
        categoryText.text = placeholderText
        categoryText.borderStyle = .roundedRect
        categoryText.textAlignment = .center
        view.addSubview(categoryText)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
        view.addSubview(button)

        setUpConstraints()
    }

    func setUpConstraints() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            descriptionText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionText.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
            descriptionText.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24),
            descriptionText.heightAnchor.constraint(equalToConstant: 32)        ])
        
        NSLayoutConstraint.activate([
            costLabel.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: 20),
            costLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            costText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            costText.topAnchor.constraint(equalTo: costLabel.bottomAnchor),
            costText.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24),
            costText.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: costText.bottomAnchor, constant: 20),
            categoryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            categoryText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            categoryText.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor),
            categoryText.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24),
            categoryText.heightAnchor.constraint(equalToConstant: 32)
        ])
    
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -12),
            button.widthAnchor.constraint(equalToConstant: 120),
            button.heightAnchor.constraint(equalToConstant: 32)
        ])
    }

    @objc func dismissViewController() {
        //delegate?.updateDescription(purchase: <#Spending#>, newString: descriptionText.text ?? "Test", newDouble: Double(costText.text) ?? "Test")
        //delegate?.updateImage(purchase:   , newString: categoryText.text)
        dismiss(animated: true, completion: nil)
    }
    
    
    weak var delegate: UpdateDescriptionDelegate?

    init(delegate: UpdateDescriptionDelegate?, placeholderText: String) {
        self.delegate = delegate
        self.placeholderText = placeholderText
        super.init(nibName: nil, bundle: nil)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
