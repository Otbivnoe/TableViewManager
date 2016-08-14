//
//  TestCellItem.swift
//  TableViewManager
//
//  Created by Nikita on 14/08/16.
//  Copyright © 2016 Nikita. All rights reserved.
//

import UIKit

class TestCellItem: NUITableViewCellItem<TestTableViewCell, TestViewModel> {

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
}
