//
//  NUITableViewCellItem.swift
//  TableViewManager
//
//  Created by Nikita on 07/08/16.
//  Copyright © 2016 Nikita. All rights reserved.
//

import UIKit

class NUITableViewCellItem<CellType: NUIViewModelBindingProtocol, ViewModelType where CellType: UITableViewCell, CellType.ViewModelType == ViewModelType> : NSObject, NUITableViewCellItemProtocol {
    
    private var fromNib: Bool
    var viewModel: ViewModelType
    
    private var heightConfigurator: (UITableView, NSIndexPath, ViewModelType) -> (CGFloat)
    
    //MARK: Initialize
    
    convenience init<HeightConfiguratorType: NUICellItemHeightProtocol where HeightConfiguratorType.T == ViewModelType>
        (cellHeightConfigurator: HeightConfiguratorType.Type, viewModel: ViewModelType, fromNib: Bool = false) {
        
        self.init(viewModel, fromNib, { tableView, indexPath, viewModel -> CGFloat in
            cellHeightConfigurator.configureHeightBy(tableView: tableView, indexPath: indexPath, viewModel: viewModel)
        })
    }
    
    convenience init(height: CGFloat, viewModel: ViewModelType, fromNib: Bool = false) {
        
        self.init(viewModel, fromNib, { _,_,_ in height })
    }
    
    init(_ viewModel: ViewModelType, _ fromNib: Bool, _ heightConfigurator: (UITableView, NSIndexPath, ViewModelType) -> (CGFloat)) {
        
        self.heightConfigurator = heightConfigurator
        self.viewModel = viewModel
        self.fromNib = fromNib
    }
    
    //MARK: NUITableViewCellItemProtocol
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(CellType.self), for: indexPath) as! CellType
        cell.configureBy(viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return heightConfigurator(tableView, indexPath, viewModel)
    }
    
    func registerCellForTableView(_ tableView: UITableView) {
        
        let identifier = String(CellType.self)
        if fromNib {
            tableView.register(UINib.init(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
        } else {
            tableView.register(CellType.self, forCellReuseIdentifier: identifier)
        }
    }
}