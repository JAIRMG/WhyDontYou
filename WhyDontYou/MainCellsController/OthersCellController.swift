//
//  OthersCellController.swift
//  WhyDontYou
//
//  Created by Jair Moreno Gaspar on 12/11/18.
//  Copyright © 2018 Jair Moreno Gaspar. All rights reserved.
//

import UIKit

class OthersCellController: UICollectionViewCell {
    
    var tableView: UITableView!
    let cellSettingId = "cellSettingId"
    
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
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellSettingId)
        
        
        self.addSubview(tableView)
        
    }
    
    
}

extension OthersCellController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return [1,2,4][section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellSettingId, for: indexPath)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
}
