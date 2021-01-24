//
//  CategoryCell.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 21/1/21.
//

import UIKit

class CategoryCell: UITableViewCell {

    // MARK: - Identifier
    static let IDENTIFIER = "CategoryCell"
    
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var categoryNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func configure(category: Category){
        self.categoryNameLabel.text = category.name
    }

}
