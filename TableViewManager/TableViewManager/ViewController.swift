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
        
        var viewModel1 = TestViewModel()
        viewModel1.name = "Test1"

        var viewModel2 = TestViewModel()
        viewModel2.name = "Test2"
        
        let cellItem1 = NUITableViewCellItem<TestTableViewCell, TestViewModel>(height: 50, viewModel: viewModel1, fromNib: false)
        let cellItem2 = NUITableViewCellItem<TestTableViewCell, TestViewModel>(height: 50, viewModel: viewModel2, fromNib: false)
        
        var cellItems = [NUITableViewCellItemProtocol]()
        cellItems.append(cellItem1)
        cellItems.append(cellItem2)
        
        tableViewManager.sectionItems = [NUITableViewSectionItem(cellItems)]
    }

}

