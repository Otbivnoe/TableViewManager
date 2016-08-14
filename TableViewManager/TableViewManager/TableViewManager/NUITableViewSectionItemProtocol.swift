//
//  NUITableViewSectionItemProtocol.swift
//  TableViewManager
//
//  Created by Nikita on 14/08/16.
//  Copyright © 2016 Nikita. All rights reserved.
//

import Foundation
import UIKit

protocol NUITableViewSectionItemProtocol {

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String?

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView?
}
