//
//  TripTableViewController.swift
//  ShoppingList
//
//  Created by SangRae Kim on 1/8/24.
//

import UIKit

class TripTableViewController: UITableViewController {
    @IBOutlet var mainTitleLabel: UILabel!

    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTitleLabel.text = "SeSAC TRAVEL"
        mainTitleLabel.textAlignment = .center
        mainTitleLabel.font = .boldSystemFont(ofSize: 20)
        
        tableView.rowHeight = 500
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magazine.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TripTableViewCell", for: indexPath) as! TripTableViewCell
        let item = magazine[indexPath.row]
        
        cell.designCell(item)
        
        cell.dateLabel.text = makeStringDate(item)
        
        return cell
    }
    
    func makeStringDate(_ item: Magazine) -> String {
        dateFormatter.dateFormat = "yyMMdd"
        guard let date = dateFormatter.date(from: item.date) else {
            return "Fail: Formatting Date"
        }
        dateFormatter.dateFormat = "yy년 MM월 dd일"
        return dateFormatter.string(from: date)
    }
}
