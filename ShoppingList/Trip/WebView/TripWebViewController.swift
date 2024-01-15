//
//  TripWebViewController.swift
//  ShoppingList
//
//  Created by SangRae Kim on 1/15/24.
//

import UIKit
import WebKit

class TripWebViewController: UIViewController {
    @IBOutlet var webView: WKWebView!
    
    var link: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: link) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}
