//
//  Case3TableViewController.swift
//  TVC
//
//  Created by SangRae Kim on 1/5/24.
//

import UIKit

struct List {
    var isChecked: Bool = false
    var item: String
    var isStared: Bool = false
}

class ShoppingTableViewController: UITableViewController {
    
    @IBOutlet var itemTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    
    var itemList: [List] = [List(item: "그립톡"),
                            List(item: "사이다"),
                            List(item: "아이패드")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designHeader();
    }
    
    @IBAction func addButtonClicked(_ sender: UIButton) {
        guard let text = itemTextField.text else {
            return
        }
        
        itemList.append(List(item: text))
        
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            itemList.remove(at: indexPath.row)
        }
        
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell", for: indexPath) as! ShoppingTableViewCell
        let item = itemList[indexPath.row]
        
        cell.designCell(item, tag: indexPath.row)
        
        cell.checkBoxButton.addTarget(self, action: #selector(checkBoxButtonClicked), for: .touchUpInside)
        cell.starButton.addTarget(self, action: #selector(starButtonClicked), for: .touchUpInside)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    @objc func checkBoxButtonClicked(_ sender: UIButton) {
        itemList[sender.tag].isChecked.toggle()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
    }
    
    @objc func starButtonClicked(_ sender: UIButton) {
        itemList[sender.tag].isStared.toggle()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
    }
    
    func designHeader() {
        itemTextField.placeholder = "무엇을 구매하실 건가요?"
        itemTextField.borderStyle = .roundedRect
        itemTextField.backgroundColor = .systemGray6
        
        addButton.setTitle("추가", for: .normal)
        addButton.tintColor = .black
        addButton.backgroundColor = .systemGray5
        addButton.titleLabel?.font = .systemFont(ofSize: 16)
        addButton.layer.cornerRadius = 10
    }
}
