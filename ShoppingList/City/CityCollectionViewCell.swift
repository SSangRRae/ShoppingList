//
//  CityCollectionViewCell.swift
//  ShoppingList
//
//  Created by SangRae Kim on 1/9/24.
//

import UIKit
import Kingfisher

class CityCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var explainLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.contentMode = .scaleAspectFill
        
        nameLabel.textColor = .black
        nameLabel.textAlignment = .center
        nameLabel.font = .boldSystemFont(ofSize: 16)
        
        explainLabel.textColor = .systemGray3
        explainLabel.textAlignment = .center
        explainLabel.font = .systemFont(ofSize: 14)
        explainLabel.numberOfLines = 0
    }
    
    func designCell(_ item: City) {
        let url = URL(string: item.city_image)
        imageView.kf.setImage(with: url)
        nameLabel.text = "\(item.city_name) | \(item.city_english_name)"
        explainLabel.text = item.city_explain 
    }
}
