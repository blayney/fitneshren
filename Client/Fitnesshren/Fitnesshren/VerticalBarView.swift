import UIKit

@IBDesignable
class VerticalBarView : UIView {
    var titleLabel: UILabel!
    var subtitleLabel: UILabel!
    
    @IBInspectable
    var percentage: Double = 0 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var color: UIColor = .white {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var titleText: String? {
        get { return titleLabel.text }
        set {
            titleLabel.text = newValue
            let font = UIFont(name: "SFProDisplay-Bold", size: 0)!
            let fontSize = fontSizeThatFits(size: titleLabel.bounds.size, text: newValue! as NSString, font: font)
            titleLabel.font = font.withSize(fontSize)
        }
    }
    
}
