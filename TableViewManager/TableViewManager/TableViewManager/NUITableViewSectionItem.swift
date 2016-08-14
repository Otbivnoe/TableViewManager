//
//  NUITableViewSectionItem.swift
//  TableViewManager
//
//  Created by Nikita on 12/08/16.
//  Copyright © 2016 Nikita. All rights reserved.
//

import UIKit

enum NUIAccessoryViewType {
    case NUIAccessoryViewTypeFooter
    case NUIAccessoryViewTypeHeader
}

struct NUITableViewSectionItem {

    var cellItems: [NUITableViewCellItemProtocol]
    
    init(_ cellItems: [NUITableViewCellItemProtocol]) {
        
        self.cellItems = cellItems
    }
}
