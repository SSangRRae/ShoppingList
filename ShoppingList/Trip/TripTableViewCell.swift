//
//  TripTableViewCell.swift
//  ShoppingList
//
//  Created by SangRae Kim on 1/8/24.
//

import UIKit
import Kingfisher

struct Date {
    let dateFormatter = DateFormatter()
    var stringDate: String
    
    var result: String {
        dateFormatter.dateFormat = "yyMMdd"
        if let date = dateFormatter.date(from: stringDate) {
            dateFormatter.dateFormat = "yy년 MM월 dd일"
            return dateFormatter.string(from: date)
        }
        return "Fail"
    }
}

class TripTableViewCell: UITableViewCell {
    
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        photoImageView.contentMode = .scaleToFill
        photoImageView.layer.cornerRadius = 20
        
        titleLabel.numberOfLines = 0
        titleLabel.font = .boldSystemFont(ofSize: 20)
        titleLabel.textColor = .black
        
        subTitleLabel.font = .systemFont(ofSize: 16)
        subTitleLabel.textColor = .lightGray
        
        dateLabel.textAlignment = .right
        dateLabel.font = .systemFont(ofSize: 16)
        dateLabel.textColor = .lightGray
    }
    
    func designCell(_ item: Magazine) {
        let url = URL(string: item.photoImage)
        
        photoImageView.kf.setImage(with: url)
        titleLabel.text = item.title
        subTitleLabel.text = item.subTitle
        dateLabel.text = Date(stringDate: item.date).result
    }
}
