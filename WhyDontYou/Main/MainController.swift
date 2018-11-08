//
//  MainController.swift
//  WhyDontYou
//
//  Created by Jair Moreno Gaspar on 05/11/18.
//  Copyright © 2018 Jair Moreno Gaspar. All rights reserved.
//

import UIKit
import Crashlytics

class MainController: UIViewController {
    
    //Height and width
    var height: CGFloat = CGFloat()
    var width: CGFloat = CGFloat()
    
    //let mainView = MainView()
    var collectionMenu: UICollectionView!
    var collectionSongs: UICollectionView!
    let menuElements = ["Home","Others","News","Others"]
    let cellMenuId = "cellMenuId"
    let cellHomeId = "cellHomeId"
    
    
    let horizontalBarView: UIView = UIView()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: init view
        setUpViews()
        
        //self.view = mainView.initView(mainView: self.view)
        //collectionMenu = mainView.collectionMenu
        collectionMenu.isScrollEnabled = false
       // collectionSongs = mainView.collectionSongs
        
        
        
        //Delegates
        self.collectionMenu.delegate = self
        self.collectionMenu.dataSource = self
        self.collectionSongs.delegate = self
        self.collectionSongs.dataSource = self
        
        
        
        //Cells for the menu
        collectionMenu.register(BarMenu.self, forCellWithReuseIdentifier: self.cellMenuId)
        
        //Cells for the mainView
        collectionSongs.register(HomeCellController.self, forCellWithReuseIdentifier: cellHomeId)
        
        self.collectionMenu.reloadData()
        self.collectionSongs.reloadData()
        
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        //Set navBar for the next controller
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        
    }
    
    func setUpViews(){
        
        self.view.backgroundColor = UIColor.white
        
        height = self.view.frame.height
        width = self.view.frame.width
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let posicionGrid:CGRect = CGRect(x: 0, y: statusBarHeight, width: width, height: height * 0.07)
        collectionMenu = UICollectionView(frame: posicionGrid, collectionViewLayout: layout)
        collectionMenu.backgroundColor = UIColor.white
        
        //Page indicator
        horizontalBarView.backgroundColor = UIColor.black
        horizontalBarView.frame = CGRect(x: 0, y: collectionMenu.frame.height * 0.93, width: collectionMenu.frame.width * 0.25, height: collectionMenu.frame.height * 0.07)
        horizontalBarView.isUserInteractionEnabled = false
        collectionMenu.addSubview(horizontalBarView)
        
        let layoutSongs = UICollectionViewFlowLayout()
        layoutSongs.scrollDirection = .horizontal
        layoutSongs.minimumLineSpacing = 0
        let positionGrid: CGRect = CGRect(x: 0, y: collectionMenu.frame.origin.y + collectionMenu.frame.height, width: width, height: height - collectionMenu.frame.height - statusBarHeight)
        collectionSongs = UICollectionView(frame: positionGrid, collectionViewLayout: layoutSongs)
        collectionSongs.backgroundColor = UIColor.white
        collectionSongs.isPagingEnabled = true
        
        
        self.view.addSubview(collectionMenu)
        self.view.addSubview(collectionSongs)
        
        
    }
    
}


extension MainController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //Always the same of the top menu
        return 4
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case collectionMenu:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellMenuId, for: indexPath as IndexPath) as! BarMenu
            cell.text.setTitle(menuElements[indexPath.row], for: .normal)
            return cell
        case collectionSongs:
            
            let identifier: String
            //if indexPath.row == 0{
                identifier = cellHomeId
            //} else {
             //   identifier = cellHomeId
            //}
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! HomeCellController
            cell.songDelegate = self
            
            return cell
 
        default:
            break
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellMenuId, for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView {
        case collectionMenu:
            return CGSize(width: self.view.frame.width * 0.25, height: collectionMenu.frame.height)
        case collectionSongs:
            return CGSize(width: self.view.frame.width, height: collectionSongs.frame.height)
        default:
            break
        }
        
        
        return CGSize(width: CGFloat(0), height: CGFloat(0))
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //Moving the indicator view
        horizontalBarView.frame.origin.x = scrollView.contentOffset.x / 4
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch collectionView {
        case collectionMenu:
            collectionSongs.scrollToItem(at: indexPath, at: [], animated: true)
        default:
            break
        }
        
    }
    
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        print(targetContentOffset.pointee.x / view.frame.width)
        
        let index = targetContentOffset.pointee.x / view.frame.width
        let indexPath = NSIndexPath(item: Int(index), section: 0)
        collectionMenu.selectItem(at: indexPath as IndexPath, animated: true, scrollPosition: [])
    }
    
    
}


extension MainController: SongDelegate {
    func goToDetailSong(song: Video) {
        let detailSong = SongDetailController()
        detailSong.song = song
        navigationController?.pushViewController(detailSong, animated: true)
        print("Datos: \(song)")
    }
    
    
    
}
