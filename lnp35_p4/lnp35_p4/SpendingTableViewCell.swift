//
//  SpendingTableViewCell.swift
//  lnp35_p4
//
//  Created by Lily Pham on 10/23/21.
//

import UIKit

class SpendingTableViewCell: UITableViewCell {
    
    var numLabel = UILabel()
    var descLabel = UILabel()
    var priceLabel = UILabel()
    var categoryImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        numLabel.font = .systemFont(ofSize: 14)
        numLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(numLabel)

        descLabel.font = .systemFont(ofSize: 12)
        descLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(descLabel)
        
        priceLabel.font = .systemFont(ofSize: 12)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(priceLabel)

        categoryImage.image = UIImage(named: "food")
        categoryImage.contentMode = .scaleAspectFit
        categoryImage.isHidden = false
        categoryImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(categoryImage)

        setupConstraints()
    }
    
    func configure(purchase: Spending) {
        numLabel.text = "Transaction #\(String(purchase.transactionNum))"
        descLabel.text = "Description: \(purchase.getDescriptionString())"
        priceLabel.text = "$\(String(purchase.amount))"
        categoryImage.image = UIImage(named: purchase.getCategoryString())
        contentView.addSubview(categoryImage)
    }
    
    func setupConstraints() {
        let padding: CGFloat = 8
        let labelHeight: CGFloat = 20

        NSLayoutConstraint.activate([
            numLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            numLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            numLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ])
        NSLayoutConstraint.activate([
            descLabel.leadingAnchor.constraint(equalTo: numLabel.leadingAnchor),
            descLabel.topAnchor.constraint(equalTo: numLabel.bottomAnchor),
            descLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ])
        NSLayoutConstraint.activate([
            priceLabel.leadingAnchor.constraint(equalTo: descLabel.leadingAnchor),
            priceLabel.topAnchor.constraint(equalTo: descLabel.bottomAnchor),
            priceLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ])
        NSLayoutConstraint.activate([
            categoryImage.heightAnchor.constraint(equalToConstant: 80),
            categoryImage.widthAnchor.constraint(equalToConstant: 80),
            categoryImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            categoryImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

protocol UpdateDescriptionDelegate: AnyObject {
    func updateDescription(purchase: Spending, newString: String)
}

extension ViewController: UpdateDescriptionDelegate {
    func updateDescription(purchase: Spending, newString: String) {
        purchase.description = newString
        
    }
}
protocol UpdateImageDelegate: AnyObject {
    func updateImage(newString: String)
}

//extension ViewController: UpdateImageDelegate {
//    func updateImage(newString: String) {
//        categoryImage.image = UIImage(named: newString)
//        view.addSubview(categoryImage)
//    }
//}



