//
//  ArticlesCell.swift
//  WhyDontYou
//
//  Created by Jair Moreno Gaspar on 09/11/18.
//  Copyright © 2018 Jair Moreno Gaspar. All rights reserved.
//

import UIKit

class ArticlesCell: UICollectionViewCell {
    
    let imageView: UIImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews(){
        
        self.backgroundColor = UIColor.white
        
        imageView.frame = CGRect(x: self.frame.height * 0.08, y: self.frame.height * 0.08, width: self.frame.height * 0.84, height: self.frame.height * 0.84)
        imageView.backgroundColor = UIColor.black
        
        addSubview(imageView)
        
    }
    
    
}
