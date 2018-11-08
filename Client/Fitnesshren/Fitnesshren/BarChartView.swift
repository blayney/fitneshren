import UIKit
import SwiftyUtils

class BarChartView: UIView {
    var percentages: [(Double, Double, Double, Double)]! {
        didSet {
            self.setNeedsDisplay()
        }
    }
}
