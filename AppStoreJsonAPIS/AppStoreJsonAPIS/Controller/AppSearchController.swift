//
//  AppSearchController.swift
//  AppStoreJsonAPIS
//
//  Created by 宋超 on 2019/7/7.
//  Copyright © 2019 宋超. All rights reserved.
//

import UIKit
import SDWebImage

class AppSearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    fileprivate let cellId = "id1234"
    
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    
    fileprivate let enterSearchTermLabel: UILabel = {
        let label = UILabel()
        label.text = "Please enter search term above ..."
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.addSubview(enterSearchTermLabel)
        enterSearchTermLabel.fillSuperview(padding: .init(top: 100, left: 50, bottom: 0, right: 50))
        setupSearchBar()
    }
    
    fileprivate func setupSearchBar(){
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    var timer: Timer?
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            Service.shared.fetchApps(searchTerm: searchText) { (results, error) in
                if let error = error {
                    print("Fail to fetch data:",error)
                    return
                }
                
                self.appResults = results
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        })
        
    }
    
    fileprivate var appResults = [Result]()
    
    fileprivate func fetchItunesApps() {
        
        Service.shared.fetchApps(searchTerm: "instagram") { (results, error) in
            if let error = error {
                print("Fail to fetch data:",error)
                return
            }
            
            self.appResults = results
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    //实现UICollectionViewDelegateFlowLayout的方法
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.size.width, height: 350)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultCell
        
        cell.appResult = appResults[indexPath.item]
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        enterSearchTermLabel.isHidden = appResults.count != 0
        return appResults.count
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        searchController.searchBar.resignFirstResponder()
    }

    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
