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
    var tableViewManager:   NUITableViewManager
    
    //MARK: Initialize
    
    required init?(coder aDecoder: NSCoder) {
        
        tableViewManager = NUITableViewManager(tableView: tableView)
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
        
        var cellItems = [NUITableViewCellItemProtocol]()
        
        for index in 0...200 {
            var viewModel = TestViewModel()
            viewModel.name = "Test \(index)"

            let cellItem = TestCellItem(height: 50, viewModel: viewModel)
            cellItems.append(cellItem)
        }

        let sectionItem = NUITableViewSectionItem(cellItems)
        tableViewManager.sectionItems = [sectionItem]
    }

}

