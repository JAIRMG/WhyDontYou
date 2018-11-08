//
//  SongDetailController.swift
//  WhyDontYou
//
//  Created by Jair Moreno Gaspar on 07/11/18.
//  Copyright © 2018 Jair Moreno Gaspar. All rights reserved.
//

import UIKit

class SongDetailController: UIViewController {
    
    var song: Video?
    let imageBackground: CustomImageView = CustomImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        setUpViews()
        
    }
    
    func setUpViews(){
        
        imageBackground.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        
        if let song = song {
            
            if let profileImageURL = song.channel?.profile_image_name{
                self.imageBackground.loadImageUsinUrlString(urlString: profileImageURL)
            }
            
            
        }
        view.addSubview(imageBackground)
        
        
    }
    
    
    
}
