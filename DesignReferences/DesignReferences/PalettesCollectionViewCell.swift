//
//  PalettesTableViewCell.swift
//  DesignReferences
//
//  Created by Lily Pham on 2/4/22.
//

import UIKit

class PalettesCollectionViewCell: UICollectionViewCell {
    
    //var colorLabel = UILabel()
    private var colorImageView = UIImageView()
    private var colorLabel = UILabel()


    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
        contentView.backgroundColor = .red

        colorImageView.contentMode = .scaleAspectFit
        colorImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(colorImageView)
        
        colorLabel.translatesAutoresizingMaskIntoConstraints = false
        colorLabel.textColor = .gray
        colorLabel.text = ""
        addSubview(colorLabel)

        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(for color: Color) {
        colorImageView.backgroundColor = color.getColor()
        colorLabel.text = color.getColorString()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            colorImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            colorImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            colorImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            colorImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        NSLayoutConstraint.activate([
            colorLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            colorLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

}
