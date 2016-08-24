//
//  NUITableViewCellItem.swift
//  TableViewManager
//
//  Created by Nikita on 07/08/16.
//  Copyright © 2016 Nikita. All rights reserved.
//

import UIKit

open class NUITableViewCellItem<CellType: NUIViewModelBindingProtocol, ViewModelType> : NUITableViewCellItemProtocol where CellType: UITableViewCell, CellType.ViewModelType == ViewModelType {
    
    public var viewModel: ViewModelType
    
    private var fromNib: Bool
    private var heightConfigurator: (UITableView, IndexPath, ViewModelType) -> (CGFloat)
    
    //MARK: Initialize
    
    public convenience init<HeightConfiguratorType: NUICellItemHeightProtocol>(cellHeightConfigurator: HeightConfiguratorType, viewModel: ViewModelType, fromNib: Bool = false)
        where HeightConfiguratorType.T == ViewModelType {
        
        self.init(viewModel, fromNib, { tableView, indexPath, viewModel -> CGFloat in
            cellHeightConfigurator.configureHeightBy(tableView: tableView, indexPath: indexPath, viewModel: viewModel)
        })
    }
    
    public convenience init(height: CGFloat, viewModel: ViewModelType, fromNib: Bool = false) {
        
        self.init(viewModel, fromNib, { _,_,_ in height })
    }
    
    init(_ viewModel: ViewModelType, _ fromNib: Bool, _ heightConfigurator: @escaping (UITableView, IndexPath, ViewModelType) -> (CGFloat)) {
        
        self.heightConfigurator = heightConfigurator
        self.viewModel = viewModel
        self.fromNib = fromNib
    }
    
    //MARK: NUITableViewCellItemProtocol
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(CellType.self)", for: indexPath) as! CellType
        cell.configureBy(viewModel)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return heightConfigurator(tableView, indexPath, viewModel)
    }
    
    public func registerCellForTableView(_ tableView: UITableView) {
        
        let identifier = "\(CellType.self)"
        if fromNib {
            tableView.register(UINib.init(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
        } else {
            tableView.register(CellType.self, forCellReuseIdentifier: identifier)
        }
    }
}
