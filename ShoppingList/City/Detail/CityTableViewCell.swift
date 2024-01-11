//
//  CityTableViewCell.swift
//  ShoppingList
//
//  Created by SangRae Kim on 1/11/24.
//

import UIKit
import Kingfisher

protocol tableViewCellDesign {
    func commonDesignCell()
    func configureCell(_ item: Travel)
}

class CityTableViewCell: UITableViewCell, tableViewCellDesign {
    
    static let id = "CityTableViewCell"

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var gradeLabel: UILabel!
    @IBOutlet var saveLabel: UILabel!
    @IBOutlet var travelImageView: UIImageView!
    @IBOutlet var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        commonDesignCell()
    }
    
    func commonDesignCell() {
        titleLabel.font = .boldSystemFont(ofSize: 16)
        titleLabel.textColor = .black
        
        descriptionLabel.font = .systemFont(ofSize: 14)
        descriptionLabel.textColor = .systemGray
        descriptionLabel.numberOfLines = 0
        
        gradeLabel.font = .systemFont(ofSize: 13)
        gradeLabel.textColor = .systemGray4
        
        saveLabel.font = .systemFont(ofSize: 13)
        saveLabel.textColor = .systemGray4
        
        travelImageView.clipsToBounds = true
        travelImageView.layer.cornerRadius = 20
        travelImageView.contentMode = .scaleAspectFill
        
        likeButton.tintColor = .white
    }
    
    func configureCell(_ item: Travel) {
        let url = URL(string: item.travel_image!)
        let image = item.like! ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
        
        titleLabel.text = item.title
        descriptionLabel.text = item.description
        gradeLabel.text = "\(item.grade!)"
        saveLabel.text = "저장 \(item.save!.formatted())"
        travelImageView.kf.setImage(with: url)
        likeButton.setImage(image, for: .normal)
    }
}

