//
//  HomeCell.swift
//  WhyDontYou
//
//  Created by Jair Moreno Gaspar on 06/11/18.
//  Copyright © 2018 Jair Moreno Gaspar. All rights reserved.
//

import UIKit

class HomeCell: UICollectionViewCell {
    
    let thumbnailImage: CustomImageView = CustomImageView()
    let text: UIButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    var video: Video? {
        
        didSet {
            text.setTitle(video?.title, for: .normal)
            if let profileImageURL = video?.channel?.profile_image_name{
                self.thumbnailImage.loadImageUsinUrlString(urlString: profileImageURL)
            }
        }
        
    }
    
    func setUpViews(){
        
        self.backgroundColor = UIColor.white
        
        thumbnailImage.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height * 0.8)
        thumbnailImage.backgroundColor = UIColor.white
        
        text.frame = CGRect(x: 0, y: self.frame.height * 0.8, width: self.frame.width, height: self.frame.height * 0.2)
        text.backgroundColor = UIColor.white
        text.setTitleColor(UIColor.black, for: .normal)
        addSubview(thumbnailImage)
        addSubview(text)
        
    }
    
}
