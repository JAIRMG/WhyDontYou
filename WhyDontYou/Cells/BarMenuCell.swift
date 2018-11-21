//
//  HomeCell.swift
//  WhyDontYou
//
//  Created by Jair Moreno Gaspar on 06/11/18.
//  Copyright © 2018 Jair Moreno Gaspar. All rights reserved.
//

import UIKit

class BarMenu: UICollectionViewCell {
    
    let text: UIButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpViews(){
        
        text.frame = CGRect(x: 0, y: self.frame.height * 0.3, width: self.frame.width, height: self.frame.height * 0.6)
        text.backgroundColor = UIColor.clear
        text.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        text.titleLabel?.numberOfLines = 1
        text.titleLabel?.textAlignment = .center
        text.isUserInteractionEnabled = false
        self.addSubview(text)
        
    }
    
}
