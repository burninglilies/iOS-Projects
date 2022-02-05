//
//  PalettesTableViewCell.swift
//  DesignReferences
//
//  Created by Lily Pham on 2/4/22.
//

import UIKit
import Foundation

class PalettesTableViewCell: UITableViewCell {
    
    var color1 = UIButton()
    var colorText = UILabel()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        color1.translatesAutoresizingMaskIntoConstraints = false
        color1.setTitleColor(.black, for: .normal)
        color1.backgroundColor = UIColor.white
        color1.layer.cornerRadius = 4
        //color1.addTarget(self, action: #selector(button1Pressed), for: .touchUpInside)
        contentView.addSubview(color1)
        
        colorText.font = .systemFont(ofSize: 24)
        colorText.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(colorText)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(color: UIColor) {
        color1.backgroundColor = color
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            color1.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            color1.bottomAnchor.constraint(equalTo: contentView.centerYAnchor),
            color1.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -15),
            color1.heightAnchor.constraint(equalToConstant: 48)
        ])
    }

}


extension UIColor {
    var rgbComponents:(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        if getRed(&r, green: &g, blue: &b, alpha: &a) {
            return (r,g,b,a)
        }
        return (0,0,0,0)
    }
    // hue, saturation, brightness and alpha components from UIColor**
    var hsbComponents:(hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) {
        var hue:CGFloat = 0
        var saturation:CGFloat = 0
        var brightness:CGFloat = 0
        var alpha:CGFloat = 0
        if getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha){
            return (hue,saturation,brightness,alpha)
        }
        return (0,0,0,0)
    }
    var htmlRGBColor:String {
        return String(format: "#%02x%02x%02x", Int(rgbComponents.red * 255), Int(rgbComponents.green * 255),Int(rgbComponents.blue * 255))
    }
    var htmlRGBaColor:String {
        return String(format: "#%02x%02x%02x%02x", Int(rgbComponents.red * 255), Int(rgbComponents.green * 255),Int(rgbComponents.blue * 255),Int(rgbComponents.alpha * 255) )
    }
}
