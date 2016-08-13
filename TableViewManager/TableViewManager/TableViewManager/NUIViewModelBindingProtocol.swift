//
//  NUIViewModelBindingProtocol.swift
//  TableViewManager
//
//  Created by Nikita on 07/08/16.
//  Copyright © 2016 Nikita. All rights reserved.
//

protocol NUIViewModelBindingProtocol {
    
    associatedtype T
    func configureBy(_ viewModel: T);
}
