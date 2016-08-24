//
//  NUICellItemHeightProtocol.swift
//  TableViewManager
//
//  Created by Nikita on 07/08/16.
//  Copyright © 2016 Nikita. All rights reserved.
//

import Foundation
import UIKit

public protocol NUICellItemHeightProtocol {
    
    associatedtype ViewModelType
    func configureHeightBy(tableView: UITableView, indexPath: IndexPath, viewModel: ViewModelType?) -> CGFloat
}
