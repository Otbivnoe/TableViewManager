//
//  NUICellItemHeightProtocol.swift
//  TableViewManager
//
//  Created by Nikita on 07/08/16.
//  Copyright © 2016 Nikita. All rights reserved.
//

import Foundation
import UIKit

protocol NUICellItemHeightProtocol {
    
    associatedtype T
    func configureHeightBy(tableView: UITableView, indexPath: NSIndexPath, viewModel: T?) -> CGFloat
}
