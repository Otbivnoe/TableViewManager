//
//  NUITableViewManager.swift
//  TableViewManager
//
//  Created by Nikita on 07/08/16.
//  Copyright © 2016 Nikita. All rights reserved.
//

import UIKit

class NUITableViewManager: NSObject {

    init(tableView: UITableView) {
        
        super.init()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension NUITableViewManager : UITableViewDelegate {
    
}

extension NUITableViewManager : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
