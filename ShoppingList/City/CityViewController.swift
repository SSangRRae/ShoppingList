//
//  CityViewController.swift
//  ShoppingList
//
//  Created by SangRae Kim on 1/9/24.
//

import UIKit

class CityViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var cityCollectionView: UICollectionView!
    
    var segmentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = "인기 도시"
        titleLabel.font = .boldSystemFont(ofSize: 20)
        titleLabel.textAlignment = .center
        
        setXIB()
        cityCollectionView.dataSource = self
        cityCollectionView.delegate = self
        setCollectionViewLayout()
        
        divideDomestic()
    }
    
    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        segmentIndex = sender.selectedSegmentIndex
        cityCollectionView.reloadData()
    }
    
    func setXIB() {
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
    
    func divideDomestic() {
        for c in city[0] {
            c.domestic_travel ? city[1].append(c) : city[2].append(c)
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
}
