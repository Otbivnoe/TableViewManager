//
//  TableViewSectionItem.swift
//  TableViewManager
//
//  Created by Nikita on 12/10/2016.
//  Copyright © 2016 Nikita. All rights reserved.
//

import Foundation

class TableViewSectionItem: TableViewSectionItemType {
    
    public var cellItems: [TableViewCellItemType]
    
    init() {
        self.cellItems = []
    }
    
    init(_ cellItems: [TableViewCellItemType]) {
        self.cellItems = cellItems
    }
}
