//
//  GeneralFunctions.swift
//  WhyDontYou
//
//  Created by Jair Moreno Gaspar on 05/11/18.
//  Copyright © 2018 Jair Moreno Gaspar. All rights reserved.
//

import UIKit


//MARK: CONSTANTS

let statusBarHeight = UIApplication.shared.statusBarFrame.height


//MARK: FONTS
let fontYanone = "YanoneKaffeesatz-Regular"
let fontYanoneLight = "YanoneKaffeesatz-Light"
let fontYanoneExtraLight = "YanoneKaffeesatz-ExtraLight"
let fontYanoneBold = "YanoneKaffeesatz-Bold"
let fontMonoton = "Monoton-Regular"


//MARK: COLORS
var colorCell: UIColor = UIColor.black
var colorTextCell: UIColor = UIColor.white
var colorBackgroundTable: UIColor = UIColor(rgba: "#EEEEEE")
var statusBarStyle: UIStatusBarStyle = UIStatusBarStyle.default


func nightModeFunction(value: Bool) {

    if value{        
        colorTextCell = UIColor.black
        colorCell = UIColor.white
        colorBackgroundTable = UIColor(rgba: "#EEEEEE")
        statusBarStyle = .default
        
    } else {
        colorTextCell = UIColor.white
        colorCell = UIColor.black
        colorBackgroundTable = UIColor(rgba: "#333333")
        statusBarStyle = .lightContent
    }
}
