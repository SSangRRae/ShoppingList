//
//  TripTableViewController.swift
//  ShoppingList
//
//  Created by SangRae Kim on 1/8/24.
//

import UIKit

class TripTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "SeSAC TRAVEL"
        tableView.rowHeight = 500
    }
}

extension TripTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magazine.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TripTableViewCell.identifier, for: indexPath) as! TripTableViewCell
        let item = magazine[indexPath.row]
        
        cell.designCell(item)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "TripWebView", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: TripWebViewController.identifier) as! TripWebViewController
        
        vc.link = magazine[indexPath.row].link
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
