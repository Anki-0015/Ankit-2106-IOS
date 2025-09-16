//
//  EmojiTableViewCell.swift
//  TableViews
//

import UIKit

class EmojiTableViewCell: UITableViewCell {
    @IBOutlet weak var symbolLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        //updateUI(emoji: Emoji)
        // Initialization code
    }
    
    func updateUI(emoji: Emoji) {
        symbolLabel.text = emoji.symbol
        descriptionLabel.text = emoji.description
        nameLabel.text = emoji.name
    }
    
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
