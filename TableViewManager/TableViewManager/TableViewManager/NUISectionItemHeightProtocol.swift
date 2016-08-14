//
//  NUISectionItemHeightProtocol.swift
//  TableViewManager
//
//  Created by Nikita on 14/08/16.
//  Copyright © 2016 Nikita. All rights reserved.
//

import UIKit

protocol NUISectionItemHeightProtocol {
    
    func tableView(_ tableView: UITableView, heightForSectionIndex index: Int) -> CGFloat
}
