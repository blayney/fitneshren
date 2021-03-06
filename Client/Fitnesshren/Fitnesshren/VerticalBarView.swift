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
    
    @IBInspectable
    var subtitleText: String? {
        get { return subtitleLabel.text }
        set {
            subtitleLabel.text = newValue
            let font = UIFont(name: "SFProDisplay-Thin", size: 0)!
            let fontSize = fontSizeThatFits(size: subtitleLabel.bounds.size, text: newValue! as NSString, font: font)
            subtitleLabel.font = font.withSize(fontSize)
        }
    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(
            roundedRect: CGRect(
                x: 0,
                y: height * (1 - percentage).f,
                width: width,
                height: height * percentage.f),
            cornerRadius: layer.cornerRadius)
        
        color.setFill()
        path.fill()
    }
    
    fileprivate func commonInit() {
        self.layer.cornerRadius = self.width * 3 / 14
        
        self.backgroundColor = UIColor.veryPaleGray
        self.clipsToBounds = true
        titleLabel = UILabel(frame: CGRect(
            x: width / 6,
            y: height * 19 / 32,
            width: width - width / 6,
            height: height * 3 / 16))
        titleLabel.textColor = .white
        self.addSubview(titleLabel)
        subtitleLabel = UILabel(frame: CGRect(
            x: titleLabel.x,
            y: titleLabel.y + titleLabel.height,
            width: titleLabel.width,
            height: titleLabel.height / 2))
        subtitleLabel.textColor = .white
        self.addSubview(subtitleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
}
