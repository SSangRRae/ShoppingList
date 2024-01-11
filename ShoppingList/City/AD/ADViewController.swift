//
//  ADViewController.swift
//  ShoppingList
//
//  Created by SangRae Kim on 1/11/24.
//

import UIKit

class ADViewController: UIViewController {

    @IBOutlet var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "광고 화면"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(leftBarButtonClicked))
        
        mainLabel.text = "광고"
        mainLabel.textAlignment = .center
        mainLabel.font = .boldSystemFont(ofSize: 30)
    }
    
    @objc func leftBarButtonClicked() {
        dismiss(animated: true)
    }
}
