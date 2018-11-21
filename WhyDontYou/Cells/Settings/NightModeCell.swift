//
//  NightCell.swift
//  WhyDontYou
//
//  Created by Jair Moreno Gaspar on 13/11/18.
//  Copyright © 2018 Jair Moreno Gaspar. All rights reserved.
//

import UIKit

protocol NightModeProtocol {
    func nightMode()
}


class NightModeCell: UITableViewCell {
    
    let nightMode: UISwitch = UISwitch()
    let texto: UIButton = UIButton()
    var nightModeProtocol: NightModeProtocol!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews(){
        
        
        texto.frame = CGRect(x: 0, y: 0, width: self.frame.width * 0.4, height: self.frame.height)
        texto.backgroundColor = UIColor.clear
        texto.setTitle("Night Mode", for: .normal)
        texto.contentHorizontalAlignment = .left
        texto.titleEdgeInsets = UIEdgeInsets(top: 0, left: self.frame.width * 0.05, bottom: 0, right: 0)
        
        nightMode.frame.origin.x = self.frame.width * 0.9
        nightMode.frame.origin.y = (self.frame.height - nightMode.frame.height) / 2
        nightMode.addTarget(self, action: #selector(self.changeNightMode), for: .valueChanged)
        
        
        addSubview(nightMode)
        addSubview(texto)
        
    
        
    }
    
    @objc func changeNightMode(sender: UISwitch){
        //NightMode on
        if sender.isOn {
            nightModeProtocol.nightMode()
            
        } else {
           nightModeProtocol.nightMode()
            
        }
        
        
    }
    
}
