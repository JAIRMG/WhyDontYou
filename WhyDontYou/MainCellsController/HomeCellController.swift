//
//  HomeCell.swift
//  WhyDontYou
//
//  Created by Jair Moreno Gaspar on 06/11/18.
//  Copyright © 2018 Jair Moreno Gaspar. All rights reserved.
//

import UIKit

protocol SongDelegate {
    func goToDetailSong(song: Video)
}


class HomeCellController: UICollectionViewCell {
    
    var collectionHome: UICollectionView!
    let cellHomeId = "cellHomeId"
    var videos: [Video]?
    var songDelegate: SongDelegate!


    override init(frame: CGRect) {
        super.init(frame: frame)
        //FetchHome <--- dentro de fetch debe de ir setupviews y reload
        setUpViews()
        fetchHome()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fetchHome(){
        
        APiService.sharedInstance.fetchForUrlString(urlString: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json") { (videos: [Video]) in
            self.videos = videos
            self.collectionHome.reloadData()
            
            
        }
        
    }
    
    func setUpViews(){
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0
        //Evita el espacio que queda entre celdas al hacer scroll
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .vertical
        let positionGrid: CGRect = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        collectionHome = UICollectionView(frame: positionGrid, collectionViewLayout: layout)
        collectionHome.dataSource = self
        collectionHome.delegate = self
        collectionHome.backgroundColor = UIColor.white
        collectionHome.register(HomeCell.self, forCellWithReuseIdentifier: cellHomeId)
        addSubview(collectionHome)
        
    }
    
    
    
    
}

extension HomeCellController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellHomeId, for: indexPath) as! HomeCell
        
        cell.setUpViews(indexPath: indexPath.row)
        cell.video = videos?[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: self.frame.height * 0.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Presiono celda \(indexPath.row)")
        
        let video = videos?[indexPath.item]        
        songDelegate.goToDetailSong(song: video!)
        
        
    }
   
    
}
