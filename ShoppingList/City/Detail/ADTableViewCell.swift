//
//  ADTableViewCell.swift
//  ShoppingList
//
//  Created by SangRae Kim on 1/11/24.
//

import UIKit

class ADTableViewCell: UITableViewCell, tableViewCellDesign {

    static let id = "ADTableViewCell"
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var adLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        commonDesignCell()
        backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1.0)
    }
    
    func commonDesignCell() {
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0
        titleLabel.font = .boldSystemFont(ofSize: 16)
        titleLabel.textAlignment = .center
        
        adLabel.textColor = .black
        adLabel.text = "AD"
        adLabel.textAlignment = .center
        adLabel.backgroundColor = .white
        adLabel.font = .boldSystemFont(ofSize: 10)
        adLabel.clipsToBounds = true
        adLabel.layer.cornerRadius = 8
    }
    
    func configureCell(_ item: Travel) {
        titleLabel.text = item.title
    }
}
