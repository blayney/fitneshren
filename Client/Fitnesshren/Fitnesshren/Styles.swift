import UIKit

extension UIColor {
    
    @nonobjc class var pinkishTan: UIColor {
        return UIColor(red: 233.0 / 255.0, green: 167.0 / 255.0, blue: 159.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var paleRed: UIColor {
        return UIColor(red: 214.0 / 255.0, green: 67.0 / 255.0, blue: 49.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var veryLightPink: UIColor {
        return UIColor(white: 238.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var darkPeach: UIColor {
        return UIColor(red: 221.0 / 255.0, green: 110.0 / 255.0, blue: 97.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var veryPaleGray: UIColor {
        return UIColor(white: 245.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var dirtyPurple: UIColor {
        return UIColor(red: 81.0 / 255.0, green: 58.0 / 255.0, blue: 80.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var paleGold: UIColor {
        return UIColor(red: 254.0 / 255.0, green: 204.0 / 255.0, blue: 110.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var purplishGrey: UIColor {
        return UIColor(red: 105.0 / 255.0, green: 98.0 / 255.0, blue: 109.0 / 255.0, alpha: 1.0)
    }


    
}

// Text styles

extension UIFont {
    
    class var cardioStyle: UIFont {
        return UIFont.systemFont(ofSize: 24.0, weight: .semibold)
    }
    
    class var textStyle: UIFont {
        return UIFont.systemFont(ofSize: 12.0, weight: .regular)
    }
    
}
