//
//  NUITableViewSectionItemProtocol.swift
//  TableViewManager
//
//  Created by Nikita on 14/08/16.
//  Copyright © 2016 Nikita. All rights reserved.
//

import Foundation
import UIKit

@objc protocol NUITableViewSectionItemProtocol {

    var cellItems: [NUITableViewCellItemProtocol] { get set}
    
    @objc optional func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    @objc optional func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String?

    @objc optional func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    @objc optional func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat

    @objc optional func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    @objc optional func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView?
}
