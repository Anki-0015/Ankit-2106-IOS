
import UIKit
protocol ToDoCellDelegate: AnyObject {
func checkmarkTapped (sender: ToDoCell)
}
class ToDoCell: UITableViewCell {
    @IBOutlet weak var iscompletebutton: UIButton!
    @IBOutlet weak var titlelabel: UILabel!
    weak var delegate: ToDoCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func completebuttontapped(_ sender: UIButton) {
        delegate?.checkmarkTapped(sender: self)
    }
}
