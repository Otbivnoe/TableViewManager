//
//  NUITableViewSectionItem.swift
//  TableViewManager
//
//  Created by Nikita on 12/08/16.
//  Copyright © 2016 Nikita. All rights reserved.
//

import UIKit

public enum NUIAccessoryViewType {
    case NUIAccessoryViewTypeFooter
    case NUIAccessoryViewTypeHeader
}

open class NUITableViewSectionItem: NUITableViewSectionItemProtocol {

    public var cellItems: [NUITableViewCellItemProtocol]
    
    public var title: String?
    public var accessoryView: UIView?
    public var heightConfigurator: NUISectionItemHeightProtocol?
    public var height: CGFloat?
    
    private var configurator = [NUIAccessoryViewType : NUITableViewSectionItem]()
    
    public convenience init() {
        
        self.init([])
    }
    
    init(_ cellItems: [NUITableViewCellItemProtocol]) {
        
        self.cellItems = cellItems
    }
    
    public func configureAccessoryViewType(_ type: NUIAccessoryViewType, configurate:(NUITableViewSectionItem) -> ()) {
        
        let tempSectionItem: NUITableViewSectionItem = NUITableViewSectionItem()
        configurate(tempSectionItem)
        configurator[type] = tempSectionItem
    }
    
    //MARK: NUITableViewSectionItemProtocol
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return configurator[.NUIAccessoryViewTypeHeader]?.title
    }
    
    public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        
        return configurator[.NUIAccessoryViewTypeFooter]?.title
    }
    
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return heightForAccessoryType(.NUIAccessoryViewTypeHeader, forTableView: tableView, atSectionIndex: section)
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return heightForAccessoryType(.NUIAccessoryViewTypeFooter, forTableView: tableView, atSectionIndex: section)
    }
    
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return configurator[.NUIAccessoryViewTypeHeader]?.accessoryView
    }
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        return configurator[.NUIAccessoryViewTypeFooter]?.accessoryView
    }
    
    //MARK: Private
    
    private func heightForAccessoryType(_ type: NUIAccessoryViewType, forTableView tableView: UITableView, atSectionIndex sectionIndex: Int) -> CGFloat {
        
        guard let sectionItem = configurator[type] else {
            return 0
        }
        
        if let height = sectionItem.height {
           return height
        }
        
        if let configurator = sectionItem.heightConfigurator {
            return configurator.configureHeightBy(tableView: tableView, heightForSectionIndex: sectionIndex)
        }
        return 0
    }
}
