//
//  NUITableViewCellItemProtocol.swift
//  TableViewManager
//
//  Created by Nikita on 07/08/16.
//  Copyright © 2016 Nikita. All rights reserved.
//

import Foundation
import UIKit

public protocol NUITableViewCellItemProtocol {

    associatedtype CellType

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    func registerCellForTableView(_ tableView: UITableView)

    func tableView(_ tableView: UITableView, willDisplay cell: CellType, forRowAt indexPath: IndexPath)
    func tableView(_ tableView: UITableView, didEndDisplaying cell: CellType, forRowAt indexPath: IndexPath)
}

extension NUITableViewCellItemProtocol {

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { return UITableViewCell() }
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { return 0 }
    public func registerCellForTableView(_ tableView: UITableView) {}
    
    public func tableView(_ tableView: UITableView, willDisplay cell: CellType, forRowAt indexPath: IndexPath) {}
    public func tableView(_ tableView: UITableView, didEndDisplaying cell: CellType, forRowAt indexPath: IndexPath) {}
}
