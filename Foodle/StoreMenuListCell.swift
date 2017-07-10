//
//  StoreMenuListCell.swift
//  Foodle
//
//  Created by devcraft50 on 06/07/2017.
//  Copyright © 2017 devcraft50. All rights reserved.
//

import UIKit
import LBTAComponents
import SwiftyJSON

class StoreMenuListCell: DatasourceCell {
    
    let templabel: UILabel = {
        let label = UILabel()
        label.text = "Menu List"
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        print("StoreMenuListCell Name : \(myStore?.name)")
        //templabel.text = myStore?.name
        
        addSubview(templabel)
        templabel.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}


class StoreMenuTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    let cellId = "cellId"
    let list = ["Side1", "Side2", "Side3", "Side4"]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: cellId)
        cell.textLabel?.text = list[indexPath.row]
        
        return cell
    }
    
    
}
