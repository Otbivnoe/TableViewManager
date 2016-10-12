//
//  TestCellItem.swift
//  TableViewManager
//
//  Created by Nikita on 14/08/16.
//  Copyright © 2016 Nikita. All rights reserved.
//

import UIKit

class TestCellItem: TableViewCellItemType {
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func registerCellForTableView(_ tableView: UITableView) {
        tableView.register(TestTableViewCell.self, forCellReuseIdentifier: "cell")
    }

    
}
