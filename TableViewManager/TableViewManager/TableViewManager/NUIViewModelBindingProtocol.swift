//
//  NUIViewModelBindingProtocol.swift
//  TableViewManager
//
//  Created by Nikita on 07/08/16.
//  Copyright © 2016 Nikita. All rights reserved.
//

public protocol NUIViewModelBindingProtocol {
    
    associatedtype ViewModelType
    func configureBy(_ viewModel: ViewModelType);
}
