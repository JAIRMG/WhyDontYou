//
//  SettingCell.swift
//  WhyDontYou
//
//  Created by Jair Moreno Gaspar on 12/11/18.
//  Copyright © 2018 Jair Moreno Gaspar. All rights reserved.
//

import UIKit

class SettingCell: UITableViewCell {
    
    let texto: UIButton = UIButton()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpViews() {
        
        texto.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        texto.backgroundColor = UIColor.clear
        texto.setTitleColor(UIColor.black, for: .normal)
        texto.titleEdgeInsets = UIEdgeInsets(top: 0, left: self.frame.width * 0.05, bottom: 0, right: 0)
        texto.setTitle("Setting", for: .normal)
        texto.contentHorizontalAlignment = .left
        
        
        addSubview(texto)
        
    }
    
}
