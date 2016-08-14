//
//  NUITableViewManager.swift
//  TableViewManager
//
//  Created by Nikita on 07/08/16.
//  Copyright © 2016 Nikita. All rights reserved.
//

import UIKit

class NUITableViewManager: NSObject {

    unowned var tableView: UITableView
    var sectionItems:      [NUITableViewSectionItem]? {
        willSet {
            registerSectionItems(newValue!)
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
    
    private func registerSectionItems(_ sectionItems: [NUITableViewSectionItem]) {
        
        for sectionItem in sectionItems {
            registerCellItems(sectionItem.cellItems)
        }
    }
    
    private func registerCellItems(_ cellItems: [NUITableViewCellItemProtocol]) {
        
        for cellItem in cellItems {
            cellItem.registerCellForTableView(tableView)
        }
    }
    
}

extension NUITableViewManager : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let cellItem = sectionItems![indexPath.section].cellItems[indexPath.row]
        return cellItem.tableView(tableView, heightForRowAt: indexPath)
    }
}

extension NUITableViewManager : UITableViewDataSource {
    
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
}
