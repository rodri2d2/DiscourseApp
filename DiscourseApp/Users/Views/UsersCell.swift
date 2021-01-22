//
//  UsersCell.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 21/1/21.
//

import UIKit

class UsersCell: UITableViewCell {

    // MARK: - Identifier
    static let IDENTIFIER = "UsersCell"
    
    //
    var viewModel: UserCellViewModel?{
        didSet{
            self.avatar.image           = viewModel?.userImage
            self.userNameLabel.text     = viewModel?.userName
            self.userNickNameLabel.text = viewModel?.userNickName
        }
    }
    
    
    // MARK: - Outlets
    @IBOutlet weak var avatar:            UIImageView!
    @IBOutlet weak var userNickNameLabel: UILabel!
    @IBOutlet weak var userNameLabel:          UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.avatar.image           = nil
        self.userNickNameLabel.text = nil
        self.userNameLabel.text     = nil
    }
    
}
