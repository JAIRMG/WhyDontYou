//
//  ArticlesCellController.swift
//  WhyDontYou
//
//  Created by Jair Moreno Gaspar on 09/11/18.
//  Copyright © 2018 Jair Moreno Gaspar. All rights reserved.
//

import UIKit

class ArticlesCellController: UICollectionViewCell {
    
    let title: UIButton = UIButton()
    var collectionView: UICollectionView!
    let articlesCellId = "articlesCellId"
    var valorScroll: CGFloat = 0
    let headerId = "headerId"
    var previousScrollOffset: CGFloat = 0;
    var isScrollingDown = false
    var isScrollingUp = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews(){
        
        self.backgroundColor = UIColor.white
        
        title.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height * 0.2)
        title.setTitle("Articles  🦍", for: .normal)
        title.titleLabel?.font = UIFont(name: fontMonoton, size: 25)
        title.setTitleColor(UIColor.black, for: .normal)
        title.contentHorizontalAlignment = .center
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        let posicionGrid: CGRect = CGRect(x: 0, y: self.frame.height * 0.2, width: self.frame.width, height: self.frame.height * 0.8)
        collectionView = UICollectionView(frame: posicionGrid, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ArticlesCell.self, forCellWithReuseIdentifier: articlesCellId)
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
        
        addSubview(self.title)
        addSubview(collectionView)
        
    }
    
}


extension ArticlesCellController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: articlesCellId, for: indexPath) as! ArticlesCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: self.frame.height * 0.3)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var reusableView: UICollectionReusableView!
        
        let headerView : UICollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId, for: indexPath)
        
        let boton: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: headerView.frame.width, height: headerView.frame.height))
        boton.backgroundColor = UIColor.green
        headerView.addSubview(boton)
        
        reusableView = headerView
        
        return reusableView
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.frame.width, height: self.frame.height * 0)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        //print(targetContentOffset.pointee.y / self.frame.height)
        print(targetContentOffset.pointee.y)
        valorScroll = targetContentOffset.pointee.y
        
        
        
//        if targetContentOffset.pointee.y > 100 {
//            print("ocultar titulo")
//        }
    }

    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("begin")
    }

    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let scrollDiff = scrollView.contentOffset.y - self.previousScrollOffset
        
        let absoluteTop: CGFloat = 0;
        let absoluteBottom: CGFloat = scrollView.contentSize.height - scrollView.frame.size.height;
        
        let isScrollingDown = scrollDiff > 0 && scrollView.contentOffset.y > absoluteTop
        let isScrollingUp = scrollDiff < 0 && scrollView.contentOffset.y < absoluteBottom
        
        
        if valorScroll > 100 && isScrollingDown{
            
                    UIView.animate(withDuration: 0.5, animations: {
                        //self.title.frame.origin.y = self.frame.origin.y - self.frame.height * 0.2
                        
                        self.collectionView.frame.origin.y = 0
                        self.collectionView.frame.size.height = self.frame.height
                    }) { (true) in
                        print("termino de ocultar")
                    }
        } else if isScrollingUp {
            UIView.animate(withDuration: 0.5, animations: {
                //self.title.frame.origin.y = 0
                self.collectionView.frame.origin.y = self.frame.height * 0.2
            }) { (true) in
                print("termino de mostrar")
            }
        }
        
    }
    
    
    
}
