//
//  NUITableViewManager.swift
//  TableViewManager
//
//  Created by Nikita on 07/08/16.
//  Copyright © 2016 Nikita. All rights reserved.
//

import UIKit

class NUITableViewManager: NSObject, UITableViewDelegate, UITableViewDataSource {

    unowned var tableView: UITableView
    var sectionItems:      [NUITableViewSectionItemProtocol]? {
        willSet {
            registerSectionItems(newValue ?? [])
        }
        didSet {
            tableView.reloadData()
        }
    }
    
    init(tableView: UITableView) {
        
        self.tableView = tableView
        super.init()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func insertCellItems(_ cellItems: [NUITableViewCellItemProtocol], for sectionItem: NUITableViewSectionItem, at indexSet: IndexSet) {
        
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
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let cellItem = sectionItems![indexPath.section].cellItems[indexPath.row]
        cellItem.tableView?(tableView, willDisplay: cell, forRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let cellItem = sectionItems![indexPath.section].cellItems[indexPath.row]
        return cellItem.tableView(tableView, heightForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        return sectionItems![section].tableView?(tableView, heightForHeaderInSection: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return sectionItems![section].tableView?(tableView, heightForFooterInSection: section) ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?  {
        
        return sectionItems![section].tableView?(tableView, viewForHeaderInSection: section)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {

        return sectionItems![section].tableView?(tableView, viewForFooterInSection: section)
    }
    
    
    //MARK: UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return (sectionItems?.count) ??  0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sectionItems![section].cellItems.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellItem = sectionItems![indexPath.section].cellItems[indexPath.row]
        let cell = cellItem.tableView(tableView, cellForRowAt: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return sectionItems![section].tableView?(tableView, titleForHeaderInSection: section)
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        
        return sectionItems![section].tableView?(tableView, titleForFooterInSection: section)
    }
}

