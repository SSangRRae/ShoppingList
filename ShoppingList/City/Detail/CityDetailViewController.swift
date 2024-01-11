//
//  CityDetailViewController.swift
//  ShoppingList
//
//  Created by SangRae Kim on 1/11/24.
//

import UIKit

class CityDetailViewController: UIViewController {
    @IBOutlet var detailTableView: UITableView!
    
    var travel = TravelInfo().travel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "도시 상세 정보"
        configureTableView()
    }
    
    @objc func likeButtonClicked(_ sender: UIButton) {
        travel[sender.tag].like! = !travel[sender.tag].like!
        detailTableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
    }
}

extension CityDetailViewController {
    func configureTableView() {
        detailTableView.dataSource = self
        detailTableView.delegate = self
        
        let xib = UINib(nibName: CityTableViewCell.id, bundle: nil)
        detailTableView.register(xib, forCellReuseIdentifier: CityTableViewCell.id)
        
        let adXib = UINib(nibName: ADTableViewCell.id, bundle: nil)
        detailTableView.register(adXib, forCellReuseIdentifier: ADTableViewCell.id)
    }
}

extension CityDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if travel[indexPath.row].ad {
            let cell = detailTableView.dequeueReusableCell(withIdentifier: ADTableViewCell.id, for: indexPath) as! ADTableViewCell
            
            cell.configureCell(travel[indexPath.row])
            
            return cell
        } else {
            let cell = detailTableView.dequeueReusableCell(withIdentifier: CityTableViewCell.id, for: indexPath) as! CityTableViewCell
            
            cell.configureCell(travel[indexPath.row])
            cell.likeButton.tag = indexPath.row
            cell.likeButton.addTarget(self, action: #selector(likeButtonClicked), for: .touchUpInside)
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if travel[indexPath.row].ad {
            let sb = UIStoryboard(name: "AD", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "ADViewController") as! ADViewController
            
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            
            present(nav, animated: true)
        } else {
            let sb = UIStoryboard(name: "Landmark", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "LandmarkViewController") as! LandmarkViewController
            
            navigationController?.pushViewController(vc, animated: true)
        }
        
        tableView.reloadRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .fade)
    }
}
