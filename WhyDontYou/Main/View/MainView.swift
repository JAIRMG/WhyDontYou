//
//  MainView.swift
//  WhyDontYou
//
//  Created by Jair Moreno Gaspar on 06/11/18.
//  Copyright © 2018 Jair Moreno Gaspar. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    //View
    var view: UIView = UIView()
    
    //Height and wifth
    var height: CGFloat = CGFloat()
    var width: CGFloat = CGFloat()
    
    var collectionMenu: UICollectionView!
    var collectionSongs: UICollectionView!
    
    
    func initView(mainView: UIView) -> UIView{
        
        self.view = mainView
        self.view.backgroundColor = UIColor.white
        
        setUpViews()
        
        return self.view
    }
    
    
    func setUpViews(){
        
        height = self.view.frame.height
        width = self.view.frame.width
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 1
        layout.scrollDirection = .horizontal
        let posicionGrid:CGRect = CGRect(x: 0, y: statusBarHeight, width: width, height: height * 0.07)
        collectionMenu = UICollectionView(frame: posicionGrid, collectionViewLayout: layout)
        collectionMenu.backgroundColor = UIColor.clear
        
        
        let layoutSongs: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layoutSongs.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layoutSongs.minimumLineSpacing = 1
        layoutSongs.minimumInteritemSpacing = 0
        layoutSongs.scrollDirection = .vertical
        let posicionSongs: CGRect = CGRect(x: 0, y: collectionMenu.frame.origin.y + collectionMenu.frame.height, width: width, height: height - collectionMenu.frame.height - statusBarHeight)
        collectionSongs = UICollectionView(frame: posicionSongs, collectionViewLayout: layoutSongs)
        collectionSongs.backgroundColor = UIColor.blue
        
        
        
        self.view.addSubview(collectionMenu)
        self.view.addSubview(collectionSongs)
        
        
    }
    
    
}
