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
    
}
