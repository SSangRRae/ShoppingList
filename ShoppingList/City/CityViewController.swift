//
//  CityViewController.swift
//  ShoppingList
//
//  Created by SangRae Kim on 1/9/24.
//

import UIKit

class CityViewController: UIViewController {
    @IBOutlet var cityCollectionView: UICollectionView!
    @IBOutlet var segment: UISegmentedControl!
    
    var segmentIndex = 0
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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "인기 도시"
        setSegmented()
        configureCell()
        setCollectionViewLayout()
        
        divideDomestic()
    }
    
    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        segmentIndex = sender.selectedSegmentIndex
        cityCollectionView.reloadData()
    }
    
    func divideDomestic() {
        for c in city[0] {
            c.domestic_travel ? city[1].append(c) : city[2].append(c)
        }
    }
}

extension CityViewController {
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
        return city[segmentIndex].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cityCollectionView.dequeueReusableCell(withReuseIdentifier: "CityCollectionViewCell", for: indexPath) as! CityCollectionViewCell
        
        cell.designCell(city[segmentIndex][indexPath.item])
        
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
