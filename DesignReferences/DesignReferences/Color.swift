//
//  Color.swift
//  DesignReferences
//
//  Created by Lily Pham on 2/4/22.
//

import Foundation
import UIKit

class Color {
    var colorString: String
    var paletteColor: UIColor

    init (colorString: String, paletteColor: UIColor) {
        self.colorString = colorString
        self.paletteColor = paletteColor
    }

//    func getImage() -> UIImage {
//        let imageName = isSelected ? "\(imageName)invert" : imageName
//        guard let image = UIImage(named: imageName) else { return UIImage() }
//        return image
//    }
    
    func getColor() -> UIColor {
        return self.paletteColor
    }
    
    func getColorString() -> String {
        return self.colorString
    }
}
