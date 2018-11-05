//
//  PageThreeController.swift
//  WhyDontYou
//
//  Created by Jair Moreno Gaspar on 05/11/18.
//  Copyright © 2018 Jair Moreno Gaspar. All rights reserved.
//

import UIKit

class PageThreeController: UIViewController {
    
    let backgroundImage: UIImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clear
        
        self.backgroundImage.frame = CGRect(x: 0, y: statusBarHeight, width: self.view.frame.width, height: self.view.frame.height - statusBarHeight - 50)
        self.backgroundImage.backgroundColor = UIColor.white
        self.backgroundImage.image = UIImage(named: "rc3")
        self.backgroundImage.contentMode = .scaleAspectFit
        self.view.addSubview(backgroundImage)
        
    }
}
