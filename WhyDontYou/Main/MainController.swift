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
    
    var collectionMenu: UICollectionView!
    var collectionSongs: UICollectionView!
    let menuElements = ["Home","Others","News","Others"]
    let cellMenuId = "cellMenuId"
    
    //Main cells
    let cellHomeId = "cellHomeId"
    let cellArticlesId = "cellArticlesId"
    let cellNewsId = "cellNewsId"
    let cellOthersId = "cellOthersId"
    
    //Text Color
    var textColor: UIColor = UIColor.black
    
    private var themedStatusBarStyle: UIStatusBarStyle?
    
    let horizontalBarView: UIView = UIView()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: init view
        setUpViews()
        
        //Delegates
        self.collectionMenu.delegate = self
        self.collectionMenu.dataSource = self
        self.collectionSongs.delegate = self
        self.collectionSongs.dataSource = self
        
        
        
        //Cells for the menu
        collectionMenu.isScrollEnabled = false
        collectionMenu.register(BarMenu.self, forCellWithReuseIdentifier: self.cellMenuId)
        
        //Cells for the mainView
        collectionSongs.register(HomeCellController.self, forCellWithReuseIdentifier: cellHomeId)
        collectionSongs.register(ArticlesCellController.self, forCellWithReuseIdentifier: cellArticlesId)
        collectionSongs.register(NewsCellController.self, forCellWithReuseIdentifier: cellNewsId)
        collectionSongs.register(SettingsCellController.self, forCellWithReuseIdentifier: cellOthersId)
        
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
        horizontalBarView.backgroundColor = textColor
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
           cell.text.setTitleColor(textColor, for: .normal)
            return cell
        case collectionSongs:
            
            if indexPath.row == 0{
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellHomeId, for: indexPath) as! HomeCellController
                cell.songDelegate = self
                return cell
                
            } else if indexPath.row == 1{
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellArticlesId, for: indexPath) as! ArticlesCellController
                return cell
                
            } else if indexPath.row == 2{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellNewsId, for: indexPath) as! NewsCellController
                return cell
            } else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellOthersId, for: indexPath) as! SettingsCellController
                return cell
            }
            
            
 
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

//extension MainController: Themed {
//    
//    func applyTheme(_ theme: AppTheme) {
//        view.backgroundColor = theme.backgroundColor
//        themedStatusBarStyle = theme.statusBarStyle
//        setNeedsStatusBarAppearanceUpdate()
//        self.collectionMenu.backgroundColor = theme.backgroundColor
//        self.textColor = theme.barForegroundColor
//        self.collectionMenu.reloadData()
//        self.horizontalBarView.backgroundColor = textColor
//        
//      
//    }
//    
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return themedStatusBarStyle ?? super.preferredStatusBarStyle
//    }
//}
//

