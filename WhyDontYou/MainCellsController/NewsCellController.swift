//
//  NewsController.swift
//  WhyDontYou
//
//  Created by Jair Moreno Gaspar on 12/11/18.
//  Copyright © 2018 Jair Moreno Gaspar. All rights reserved.
//

import UIKit

class NewsCellController: UICollectionViewCell {
   
    var collectionNews: UICollectionView!
    let cellNewsId = "cellNewsId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews(){
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .vertical
        let posicionGrid: CGRect = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        collectionNews = UICollectionView(frame: posicionGrid, collectionViewLayout: layout)
        collectionNews.delegate = self
        collectionNews.dataSource = self
        collectionNews.register(NewsCell.self, forCellWithReuseIdentifier: cellNewsId)
        
        addSubview(collectionNews)
        
    }
    
}


extension NewsCellController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionNews.dequeueReusableCell(withReuseIdentifier: cellNewsId, for: indexPath) as! NewsCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width * 0.5, height: self.frame.height * 0.3)
    }
    
}
