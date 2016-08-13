//
//  TestHeightConfigurator.swift
//  TableViewManager
//
//  Created by Nikita on 07/08/16.
//  Copyright © 2016 Nikita. All rights reserved.
//

import Foundation
import UIKit

class TestHeightConfigurator: NSObject, NUIHeightConfiguratorProtocol {

    typealias T = TestViewModel
    
    class func configureHeightBy(tableView: UITableView, indexPath: NSIndexPath, viewModel: TestViewModel) -> CGFloat {
        return 0
    }
    
}