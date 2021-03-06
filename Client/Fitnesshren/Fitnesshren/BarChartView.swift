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
            
            // draw gray bar
            let grayBarPath = UIBezierPath(roundedRect: CGRect(x: barX, y: barY, width: barWidth, height: barHeight), cornerRadius: barWidth / 2)
            UIColor.veryLightPink.setFill()
            grayBarPath.fill()
            
            // draw sub bars
            let colorDict: [Int: UIColor] = [
                0: .pinkishTan,
                1: .darkPeach,
                2: .paleRed
            ]
            
            for subBar in subBars {
                let subBarPath = UIBezierPath(roundedRect: CGRect(x: barX, y: graphHeight - barHeight * subBar.1.f, width: barWidth, height: barHeight * subBar.1.f), cornerRadius: barWidth / 2)
                colorDict[subBar.0]!.setFill()
                subBarPath.fill()
            }
            
            let textRect = CGRect(x: barX - separator / 2, y: barY + barHeight, width: separator + barWidth, height: 14)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            (weekdays[index] as NSString).draw(in: textRect, withAttributes: [
                NSAttributedString.Key.paragraphStyle: paragraphStyle,
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)
                ])
        }
    }
}

fileprivate func getLast7Weekdays(date: Date) -> [String] {
    let dates = (0..<7).map { date.addingTimeInterval(Double(60 * 60 * 24 * -$0)) }
    let formatter = DateFormatter()
    formatter.dateFormat = "E"
    return dates.map { formatter.string(from: $0) }.reversed()
}
