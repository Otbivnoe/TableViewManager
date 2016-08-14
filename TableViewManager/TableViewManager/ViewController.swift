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
        
        var viewModel3 = TestViewModel()
        viewModel3.name = "Test3"
        
        let cellItem1 = NUITableViewCellItem<TestTableViewCell, TestViewModel>(height: 50, viewModel: viewModel1)
        let cellItem2 = TestCellItem(height: 50, viewModel: viewModel2)
        let cellItem3 = TestCellItem(cellHeightConfigurator: TestHeightConfigurator(), viewModel: viewModel3)

        var cellItems = [NUITableViewCellItemProtocol]()
        cellItems.append(cellItem1)
        cellItems.append(cellItem2)
        cellItems.append(cellItem3)
        
        
        let sectionItem = NUITableViewSectionItem(cellItems)
        
        sectionItem.configureAccessoryViewType(.NUIAccessoryViewTypeHeader, configurate: { section in
            section.height = 20
            section.title = "Header"
        })
        
        sectionItem.configureAccessoryViewType(.NUIAccessoryViewTypeFooter, configurate: { section in
            section.heightConfigurator = TestHeightConfigurator()
            section.title = "Footer"
        })
        
        tableViewManager.sectionItems = [sectionItem]
    }

}

