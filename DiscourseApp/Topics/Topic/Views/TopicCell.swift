//
//  TopicCell.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 14/1/21.
//

import UIKit

class TopicCell: UITableViewCell {
    
    // MARK: - Identifier
    static let identifier = "TopicCell"
    
    var viewModel: TopicCellViewModel? {
        didSet{
            self.topicTextLabel.text = viewModel?.topicTitle
        }
    }
    
    // MARK: - Outlets
    @IBOutlet weak var topicTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
}
