//
//  TableViewBaseCellITem.swift
//  TableViewManager
//
//  Created by Nikita on 11/10/2016.
//  Copyright © 2016 Nikita. All rights reserved.
//

import UIKit

open class TableViewBaseCellItem<U> : NUITableViewCellItemProtocol where U: UITableViewCell {
    
    public typealias CellType = U
}
