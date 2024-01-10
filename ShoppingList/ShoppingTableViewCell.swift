//
//  ShoppingTableViewCell.swift
//  ShoppingList
//
//  Created by SangRae Kim on 1/8/24.
//

import UIKit

class ShoppingTableViewCell: UITableViewCell {
    
    @IBOutlet var checkBoxButton: UIButton!
    @IBOutlet var itemLabel: UILabel!
    @IBOutlet var starButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .systemGray6
        
        checkBoxButton.tintColor = .black
        
        itemLabel.textColor = .black
        itemLabel.font = .systemFont(ofSize: 16)
        
        starButton.tintColor = .black
    }
    
    func designCell(_ item: List, tag: Int) {
        let checkBoxImage = item.isChecked ? "checkmark.square.fill" : "checkmark.square"
        let starButtonImage = item.isStared ? "star.fill" : "star"
        
        checkBoxButton.tag = tag
        checkBoxButton.setImage(UIImage(systemName: checkBoxImage), for: .normal)
        
        itemLabel.text = item.item
        
        starButton.tag = tag
        starButton.setImage(UIImage(systemName: starButtonImage), for: .normal)
    }
}
