//
//  CityViewController.swift
//  ShoppingList
//
//  Created by SangRae Kim on 1/9/24.
//

import UIKit

enum Category: Int, CaseIterable {
    case all
    case domestic
    case foreign
    
    var title: String {
        switch self {
        case .all: "모두"
        case .domestic: "국내"
        case .foreign: "해외"
        }
    }
    
    var isDomestic: Bool {
        switch self {
        case .all: true
        case .domestic: true
        case .foreign: false
        }
    }
}

class CityViewController: UIViewController {
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var segment: UISegmentedControl!
    @IBOutlet var cityCollectionView: UICollectionView!
    
    let originalList = city
    var list: [City] = city {
        didSet {
            cityCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "인기 도시"
        setSearchBar()
        setSegmented()
        configureCell()
        setCollectionViewLayout()
    }
    
    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == Category.all.rawValue {
            list = originalList
        } else {
            var filteredData: [City] = []
            for c in originalList {
                if c.domestic_travel == Category.allCases[sender.selectedSegmentIndex].isDomestic {
                    filteredData.append(c)
                }
            }
            list = filteredData
        }
    }
}

extension CityViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        var filteredData: [City] = []
        
        guard let text = searchBar.text?.replacing(" ", with: "") else {
            return
        }
        let upperText = text.uppercased()
        
        if upperText == "" {
            list = originalList
        } else {
            for city in list {
                if city.city_name.contains(text) || city.city_english_name.uppercased().contains(upperText) || city.city_explain.contains(text) {
                    filteredData.append(city)
                }
            }
            list = filteredData
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        var filteredData: [City] = []
        
        guard let text = searchBar.text?.replacing(" ", with: "") else {
            return
        }
        
        let upperText = text.uppercased()
        
        if upperText == "" {
            list = originalList
        } else {
            for city in list {
                if city.city_name.contains(text) || city.city_english_name.uppercased().contains(upperText) || city.city_explain.contains(text) {
                    filteredData.append(city)
                }
            }
            list = filteredData
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
        searchBar.text = ""
        list = originalList
    }
}

extension CityViewController {
    func setSearchBar() {
        searchBar.delegate = self
        searchBar.showsCancelButton = true
    }
    
    func configureCell() {
        cityCollectionView.dataSource = self
        cityCollectionView.delegate = self
        
        let xib = UINib(nibName: "CityCollectionViewCell", bundle: nil)
        cityCollectionView.register(xib, forCellWithReuseIdentifier: "CityCollectionViewCell")
    }
    
    func setCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        let space: CGFloat = 8
        let deviceWidth = UIScreen.main.bounds.width
        let cellWidth = deviceWidth - (space * 3)
        
        layout.itemSize = CGSize(width: cellWidth/2, height: cellWidth/2*1.5)
        layout.sectionInset = UIEdgeInsets(top: space, left: space, bottom: space, right: space)
        layout.minimumLineSpacing = space
        layout.minimumInteritemSpacing = space
        
        cityCollectionView.collectionViewLayout = layout
    }
    
    func setSegmented() {
        for category in Category.allCases {
            segment.setTitle(category.title, forSegmentAt: category.rawValue)
        }
    }
}

extension CityViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cityCollectionView.dequeueReusableCell(withReuseIdentifier: "CityCollectionViewCell", for: indexPath) as! CityCollectionViewCell
        
        cell.designCell(list[indexPath.item])
        
        DispatchQueue.main.async {
            cell.imageView.layer.cornerRadius = cell.imageView.frame.width / 2
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "CityDetail", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "CityDetailViewController") as! CityDetailViewController
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
