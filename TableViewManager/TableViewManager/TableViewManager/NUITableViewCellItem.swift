//
//  NUITableViewCellItem.swift
//  TableViewManager
//
//  Created by Nikita on 07/08/16.
//  Copyright © 2016 Nikita. All rights reserved.
//

import UIKit

class NUITableViewCellItem<CellType: NUIViewModelBindingProtocol, ViewModelType where CellType: UITableViewCell, CellType.T == ViewModelType> : NSObject {
    
    var fromNib: Bool
    var viewModel: ViewModelType
    
    private var heightConfigurator: (UITableView, NSIndexPath, ViewModelType) -> (CGFloat)
    
    convenience init<HeightConfiguratorType: NUIHeightConfiguratorProtocol where HeightConfiguratorType.T == ViewModelType>
        (cellHeightConfigurator: HeightConfiguratorType.Type, viewModel: ViewModelType, fromNib: Bool) {
        
        self.init(viewModel, fromNib, { (tableView, indexPath, viewModel) -> CGFloat in
            cellHeightConfigurator.configureHeightBy(tableView: tableView, indexPath: indexPath, viewModel: viewModel)
        })
    }
    
    convenience init(height: CGFloat, viewModel: ViewModelType, fromNib: Bool) {
        
        self.init(viewModel, fromNib, { _,_,_ in height })
    }
    
    private init(_ viewModel: ViewModelType, _ fromNib: Bool, _ heightConfigurator: (UITableView, NSIndexPath, ViewModelType) -> (CGFloat)) {
        
        self.heightConfigurator = heightConfigurator
        self.viewModel = viewModel
        self.fromNib = fromNib
        
        super.init()
    }
}

extension NUITableViewCellItem : NUITableViewCellItemProtocol {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(CellType.self), for: indexPath) as! CellType
        cell.configureBy(viewModel: self.viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return self.heightConfigurator(tableView, indexPath, self.viewModel)
    }
}
