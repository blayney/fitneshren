import UIKit
import SwiftyUtils

class BarChartView: UIView {
    var percentages: [(Double, Double, Double, Double)]! {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    let barWidth = 12.f
    
    override func draw(_ rect: CGRect) {
        guard let percentages = self.percentages else { return }
        
        let graphHeight = height * 8.0 / 9.0
        let separator = (width - barWidth * percentages.count.f) / (percentages.count.f + 1)
        let weekdays = getLast7Weekdays(date: Date())
        for (index, bar) in percentages.enumerated() {
            let barX = (index + 1).f * separator + index.f * barWidth
            let barY = graphHeight * (1.0 - bar.0).f
            let barHeight = graphHeight - barY
            let subBars = [(0, bar.1), (1, bar.2), (2, bar.3)].sorted(by: { $0.1 > $1.1 })
        }
    }
}
