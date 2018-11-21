//
//  OthersCellController.swift
//  WhyDontYou
//
//  Created by Jair Moreno Gaspar on 12/11/18.
//  Copyright © 2018 Jair Moreno Gaspar. All rights reserved.
//

import UIKit

protocol updateMenuProtocol {
    func updateMenu()
}

class SettingsCellController: UICollectionViewCell {
    
    var tableView: UITableView!
    let cellSettingId = "cellSettingId"
    let nighModeCellId = "nighModeCellId"
    let mainController = MainController()
    var updateMenuProtocol: updateMenuProtocol!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews(){
        
        let posicionGrid: CGRect = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        tableView = UITableView(frame: posicionGrid, style: UITableViewStyle.grouped)
        tableView.backgroundColor = colorBackgroundTable
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SettingCell.self, forCellReuseIdentifier: cellSettingId)
        tableView.register(NightModeCell.self, forCellReuseIdentifier: nighModeCellId)
        
        tableView.reloadData()
        
        self.addSubview(tableView)
        
    }
    
    
}

extension SettingsCellController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return [1,2,4][section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: nighModeCellId, for: indexPath) as! NightModeCell
            cell.backgroundColor = colorCell
            cell.texto.setTitleColor(colorTextCell, for: .normal)
            cell.nightModeProtocol = self
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellSettingId, for: indexPath) as! SettingCell
                cell.backgroundColor = colorCell
                cell.texto.setTitleColor(colorTextCell, for: .normal)
            
            return cell
        }
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
}

extension SettingsCellController: NightModeProtocol{
    
  
    
    func nightMode() {

        if !UserDefaults.standard.bool(forKey: "firstTimeNightMode"){
            UserDefaults.standard.set(true, forKey: "firstTimeNightMode")
            UserDefaults.standard.set(true, forKey: "nightMode")
        }
        
        if(UserDefaults.standard.bool(forKey: "nightMode")){
            nightModeFunction(value: true)
            setUpViews()
            updateMenuProtocol.updateMenu()
            UserDefaults.standard.set(false, forKey: "nightMode")
        } else {
            nightModeFunction(value: false)
            setUpViews()
            updateMenuProtocol.updateMenu()
            UserDefaults.standard.set(true, forKey: "nightMode")
        }
        
    }
    
    
}


