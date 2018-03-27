//
//  UITableView+Reuse.swift
//  FBSnapshotTestCase
//
//  Created by Hannes Van den Berghe on 10/03/2018.
//

import UIKit

extension UITableView {
    
    /// Register
    
    /// Register a cell class with the same name as a reusable cell.
    public func register<T: UITableViewCell>(class classType: T.Type) {
        register(classType.nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    /// Register a view class with the same name as a reusable view.
    public func registerHeaderFooter<T: UIView>(class classType: T.Type) {
        register(classType.nib, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    
    /// Dequeue
    
    /// We dequeue the cell and infer the cell to the correct type. This way we don't have to
    /// force cast every time we try to dequeue a cell.
    ///
    /// Example: `tableView.dequeueReusableCell(withIdentifier: String(...), for indexPath: IndexPath(...)) as UITableViewCell`
    public func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as! T
        return cell
    }
    
    /// We dequeue the cell and infer the cell to the correct type. This way we don't have to
    /// force cast every time we try to dequeue a cell.
    ///
    /// Example: `tableView.dequeueReusableCell(withIdentifier: String(...)) as UITableViewCell`
    public func dequeueReusableCell<T: UITableViewCell>(forIdentifier identifier: String) -> T {
        let cell = dequeueReusableCell(withIdentifier: identifier) as! T
        return cell
    }
    
    /// We dequeue the header or footer and infer the header or footer to the correct type. This way we don't have to
    /// force cast every time we try to dequeue a header or a footer.
    ///
    /// Example: `tableView.dequeueReusableHeaderFooterView(withIdentifier: String(...)) as UIView`
    public func dequeueReusableHeaderFooter<T: UIView>(forIdentifier identifier: String) -> T {
        let cell = dequeueReusableHeaderFooterView(withIdentifier: identifier) as! T
        return cell
    }
    
    /// Get
    
    /// We ask the cell at indexpath and infer the cell to the correc type. This way we don't have to
    /// force cast every time we try to get the cell at a certain IndexPath
    ///
    /// Example: `tableView.cellForRow(at indexPath: IndexPath(...)) as UITableViewCell
    public func cellForRow<T: UITableViewCell>(_ indexPath: IndexPath) -> T {
        let cell = cellForRow(at: indexPath) as! T
        return cell
    }
}


