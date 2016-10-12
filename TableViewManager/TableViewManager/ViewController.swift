//
//  ViewController.swift
//  TableViewManager
//
//  Created by Nikita on 07/08/16.
//  Copyright © 2016 Nikita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tableView:          UITableView = UITableView()
    var tableViewManager:   TableViewDisposer
    
    //MARK: Initialize
    
    required init?(coder aDecoder: NSCoder) {
        
        tableViewManager = TableViewDisposer(tableView: tableView)
        super.init(coder: aDecoder)
    }
    
    //MARK: Layout
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        view.addSubview(tableView)
        configurateSectionItems()
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
    }
    
    //MARK: Configurations

    func configurateSectionItems() {
        
        var cellItems = [TableViewCellItemType]()
        
        for _ in 0...200 {
            let cellItem = TestCellItem()
            cellItems.append(cellItem)
        }

        let sectionItem = TableViewSectionItem(cellItems)
        tableViewManager.sectionItems = [sectionItem]
    }

}

