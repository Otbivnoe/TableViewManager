//
//  NUITableViewCellItemProtocol.swift
//  TableViewManager
//
//  Created by Nikita on 07/08/16.
//  Copyright © 2016 Nikita. All rights reserved.
//

import Foundation
import UIKit

protocol NUITableViewCellItemProtocol {

    var fromNib: Bool { get }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    func registerCellForTableView(_ tableView: UITableView)
}
