//
//  HomeCell.swift
//  WhyDontYou
//
//  Created by Jair Moreno Gaspar on 06/11/18.
//  Copyright © 2018 Jair Moreno Gaspar. All rights reserved.
//

import UIKit
import Hero

class HomeCell: UICollectionViewCell {
    
    let thumbnailImage: CustomImageView = CustomImageView()
    let labelArtist: UIButton = UIButton()
    let darkLayer: UIButton = UIButton()
    let gradienteBg: UIView = UIView()
    let labelInfo: UIButton = UIButton()
    
    
    var video: Video? {
        
        didSet {
            labelArtist.setTitle(video?.title, for: .normal)
            if let profileImageURL = video?.channel?.profile_image_name{
                self.thumbnailImage.loadImageUsinUrlString(urlString: profileImageURL)
            }
           
        }
        
    }
    
    func setUpViews(indexPath: Int){
        
        self.backgroundColor = UIColor.white
        
        thumbnailImage.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        thumbnailImage.backgroundColor = UIColor.white
        
        labelInfo.frame = CGRect(x: 0, y: self.frame.height * 0.75, width: self.frame.width * 0.5, height: self.frame.height * 0.1)
        labelInfo.backgroundColor = UIColor.clear
        if indexPath == 0{
            labelInfo.setTitle("SONG OF THE DAY 🔥", for: .normal)
        }
        else{
            labelInfo.setTitle("", for: .normal)
        }
        labelInfo.titleLabel?.font = UIFont(name: fontYanoneBold, size: 17)
        labelInfo.setTitleColor(UIColor(rgba: "#fffdf4"), for: .normal)
        labelInfo.contentHorizontalAlignment = .left
        labelInfo.contentVerticalAlignment = .bottom
        labelInfo.titleEdgeInsets = UIEdgeInsets(top: 0, left: self.frame.width * 0.05, bottom: 0, right: 0)
        
        labelArtist.frame = CGRect(x: 0, y: self.frame.height * 0.85, width: self.frame.width, height: self.frame.height * 0.15)
        labelArtist.backgroundColor = UIColor.clear
        labelArtist.setTitleColor(UIColor.white, for: .normal)
        labelArtist.titleLabel?.font = UIFont(name: fontYanone, size: 20)
        labelArtist.contentHorizontalAlignment = .left
        labelArtist.contentVerticalAlignment = .top
        labelArtist.titleEdgeInsets = UIEdgeInsets(top: 0, left: self.frame.width * 0.05, bottom: 0, right: 0)
        
        darkLayer.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        darkLayer.backgroundColor = UIColor.black
        darkLayer.alpha = 0.5
        gradienteBg.frame = CGRect(x: 0, y: self.frame.height * 0.8, width: self.frame.width, height: self.frame.height * 0.2)
        darkLayer.isUserInteractionEnabled = false
        
        let gradient:CAGradientLayer = CAGradientLayer()
        let colorTop = UIColor.clear.cgColor
        let colorBottom = UIColor.black.cgColor
        gradient.colors = [colorTop, colorBottom]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.frame = gradienteBg.bounds
        gradienteBg.layer.addSublayer(gradient)
        
        addSubview(thumbnailImage)
        addSubview(darkLayer)
        addSubview(gradienteBg)
        addSubview(labelInfo)
        addSubview(labelArtist)
        
    }
    
}
