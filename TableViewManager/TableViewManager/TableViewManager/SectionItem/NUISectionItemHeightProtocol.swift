//
//  NUISectionItemHeightProtocol.swift
//  TableViewManager
//
//  Created by Nikita on 14/08/16.
//  Copyright © 2016 Nikita. All rights reserved.
//

import UIKit

public protocol NUISectionItemHeightProtocol {
    
    func configureHeightBy(tableView: UITableView, heightForSectionIndex index: Int) -> CGFloat
}
