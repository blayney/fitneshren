import UIKit
import SwiftyUtils

class CardTableViewCell : UITableViewCell {
    @IBOutlet var cardView: UIView!
    @IBOutlet var customLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.layer.cornerRadius = 10
        cardView.backgroundColor = UIColor.gray.lighter()
    }
}
