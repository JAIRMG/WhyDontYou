//
//  PageFourController.swift
//  WhyDontYou
//
//  Created by Jair Moreno Gaspar on 05/11/18.
//  Copyright © 2018 Jair Moreno Gaspar. All rights reserved.
//

import UIKit

class PageFourController: UIViewController {
    
    let backgroundImage: UIImageView = UIImageView()
    let botonStart: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clear
        
        //MARK: IMAGE
        self.backgroundImage.frame = CGRect(x: 0, y: statusBarHeight, width: self.view.frame.width, height: self.view.frame.height - statusBarHeight - 50)
        self.backgroundImage.backgroundColor = UIColor.white
        self.backgroundImage.image = UIImage(named: "rc4")
        self.backgroundImage.contentMode = .scaleAspectFit
        self.backgroundImage.isUserInteractionEnabled = true
        self.view.addSubview(backgroundImage)
        
        
        //MARK: BUTTON
        self.botonStart.frame = CGRect(x: self.backgroundImage.frame.width * 0.2, y: self.backgroundImage.frame.height * 0.9, width: self.backgroundImage.frame.width * 0.6, height: self.backgroundImage.frame.height * 0.1)
        self.botonStart.layer.cornerRadius = 25
        self.botonStart.backgroundColor = UIColor.black
        self.botonStart.setTitle("Start", for: .normal)
        self.botonStart.setTitleColor(UIColor.white, for: .normal)
        self.botonStart.addTarget(self, action: #selector(self.goToMain), for: .touchUpInside)
        self.backgroundImage.addSubview(botonStart)
        print("as")
        
    }
    
    @objc func goToMain(){
        let mainController = MainController()
        UserDefaults.standard.set(true, forKey: "walkthrough")
        present(mainController, animated: true, completion: nil)
        print("gotomain")
    }
    
}
