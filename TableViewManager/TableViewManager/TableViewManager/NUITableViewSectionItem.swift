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

class NUITableViewSectionItem: NSObject, NUITableViewSectionItemProtocol {

    var cellItems: [NUITableViewCellItemProtocol]
    
    var title: String?
    var accessoryView: UIView?
    var heightConfigurator: NUISectionItemHeightProtocol?
    var height: CGFloat?
    
    private var configurator = [NUIAccessoryViewType : NUITableViewSectionItem]()
    
    override init() {
        
        self.cellItems = []
    }
    
    init(_ cellItems: [NUITableViewCellItemProtocol]) {
        
        self.cellItems = cellItems
    }
    
    func configureAccessoryViewType(_ type: NUIAccessoryViewType, configurate:(NUITableViewSectionItem) -> ()) {
        
        let tempSectionItem: NUITableViewSectionItem = NUITableViewSectionItem()
        configurate(tempSectionItem)
        configurator[type] = tempSectionItem
    }
    
    //MARK: NUITableViewSectionItemProtocol
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return configurator[.NUIAccessoryViewTypeHeader]?.title
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        
        return configurator[.NUIAccessoryViewTypeFooter]?.title
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return heightForAccessoryType(.NUIAccessoryViewTypeHeader, forTableView: tableView, atSectionIndex: section)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return heightForAccessoryType(.NUIAccessoryViewTypeFooter, forTableView: tableView, atSectionIndex: section)
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return configurator[.NUIAccessoryViewTypeHeader]?.accessoryView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        return configurator[.NUIAccessoryViewTypeFooter]?.accessoryView
    }
    
    //MARK: Private
    
    func heightForAccessoryType(_ type: NUIAccessoryViewType, forTableView tableView: UITableView, atSectionIndex sectionIndex: Int) -> CGFloat {
        
        guard let sectionItem = configurator[type] else {
            return 0
        }
        
        if let height = sectionItem.height {
           return height
        }
        
        if let configurator = sectionItem.heightConfigurator {
            return configurator.tableView(tableView, heightForSectionIndex: sectionIndex)
        }
        return 0
    }
}
