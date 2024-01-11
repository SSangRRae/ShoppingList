//
//  LandmarkViewController.swift
//  ShoppingList
//
//  Created by SangRae Kim on 1/11/24.
//

import UIKit

class LandmarkViewController: UIViewController {
    @IBOutlet var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "관광지 화면"
        
        mainLabel.text = "관광지"
        mainLabel.textAlignment = .center
        mainLabel.font = .boldSystemFont(ofSize: 30)
    }
}
