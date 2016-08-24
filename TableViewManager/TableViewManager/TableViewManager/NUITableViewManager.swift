//
//  NUITableViewManager.swift
//  TableViewManager
//
//  Created by Nikita on 07/08/16.
//  Copyright © 2016 Nikita. All rights reserved.
//

import UIKit

open class NUITableViewManager: NSObject, UITableViewDelegate, UITableViewDataSource, UITableViewDataSourcePrefetching {

    public unowned var tableView: UITableView
    
    public var sectionItems: [NUITableViewSectionItemProtocol]? {
        willSet {
            registerSectionItems(newValue ?? [])
        }
        didSet {
            tableView.reloadData()
        }
    }
    
    public init(tableView: UITableView) {
        
        self.tableView = tableView
        super.init()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.prefetchDataSource = self
    }
    
    open func insertCellItems(_ cellItems: [NUITableViewCellItemProtocol], for sectionItem: NUITableViewSectionItem, at indexSet: IndexSet) {
        
    }
    
    //MARK: Private
    
    private func registerSectionItems(_ sectionItems: [NUITableViewSectionItemProtocol]) {
        
        for sectionItem in sectionItems {
            registerCellItems(sectionItem.cellItems)
        }
    }
    
    private func registerCellItems(_ cellItems: [NUITableViewCellItemProtocol]) {
        
        for cellItem in cellItems {
            cellItem.registerCellForTableView(tableView)
        }
    }
    
    //MARK: UITableViewDelegate
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let cellItem = sectionItems![indexPath.section].cellItems[indexPath.row]
        cellItem.tableView(tableView, willDisplay: cell, forRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let cellItem = sectionItems![indexPath.section].cellItems[indexPath.row]
        return cellItem.tableView(tableView, heightForRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        return sectionItems![section].tableView(tableView, heightForHeaderInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return sectionItems![section].tableView(tableView, heightForFooterInSection: section)
    }
    
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?  {
        
        return sectionItems![section].tableView(tableView, viewForHeaderInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {

        return sectionItems![section].tableView(tableView, viewForFooterInSection: section)
    }
    
    
    //MARK: UITableViewDataSource
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        
        return (sectionItems?.count) ??  0
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sectionItems![section].cellItems.count;
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellItem = sectionItems![indexPath.section].cellItems[indexPath.row]
        let cell = cellItem.tableView(tableView, cellForRowAt: indexPath)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return sectionItems![section].tableView(tableView, titleForHeaderInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        
        return sectionItems![section].tableView(tableView, titleForFooterInSection: section)
    }
    
    //MARK: UITableViewDataSourcePrefetching
    
    public func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        
    }
    

    public func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        
    }
}

