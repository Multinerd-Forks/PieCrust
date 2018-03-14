//
//  PCGenericTableController.swift
//  PieCrust
//
//  Created by Omar Albeik on 6.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit
import SnapKit
import SwifterSwift

/// Generic `PCTableController`.
open class PCGenericTableController<T: PCGenericTableViewCell<U>, U>: PCTableViewController {
    
    /// Initializes a table-view controller to manage a table view of a given style and set its items.
    ///
    /// - Parameters:
    ///   - style: A constant that specifies the style of table view that the controller object is to manage _(default is .grouped)_.
    ///   - items: Generic items array of arrays, where each internal array represents a section.
    public convenience init(style: UITableViewStyle = .grouped, items: [[U]]) {
        self.init(style: style)
        
        self.items = items
    }

    /// Initializes a table-view controller to manage a table view of a given style.
    ///
    /// - Parameter style: A constant that specifies the style of table view that the controller object is to manage.
    override public init(style: UITableViewStyle) {
        super.init(style: style)
        
        registerCell()
    }

    /// Returns a newly initialized view controller with the nib file in the specified bundle.
    override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        registerCell()
    }

	/// Returns an object initialized from data in a given unarchiver.
	///
	/// - Parameter aDecoder: An unarchiver object.
	required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        registerCell()
    }
    
    /// Generic items array of arrays, where each internal array represents a section.
    open var items: [[U]] = [[]]
    
    private func registerCell() {
        tableView.register(cellWithClass: T.self)
    }

    /// Asks the data source to return the number of sections in the table view.
    ///
    /// - Parameter tableView: An object representing the table view requesting this information.
    /// - Returns: The number of sections in tableView.
    open override func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    /// Tells the data source to return the number of rows in a given section of a table view.
    ///
    /// - Parameters:
    ///   - tableView: The table-view object requesting this information.
    ///   - section: An index number identifying a section in tableView.
    /// - Returns: The number of rows in section.
    open override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }

    /// Asks the data source for a cell to insert in a particular location of the table view.
    ///
    /// - Parameters:
    ///   - tableView: A table-view object requesting the cell.
    ///   - indexPath: An index path locating a row in tableView.
    /// - Returns: An object inheriting from UITableViewCell that the table view can use for the specified row. An assertion is raised if you return nil.
    open override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: T.self, for: indexPath)!
        cell.item = items[indexPath.section][indexPath.row]
        return cell
    }

    /// Tells the delegate that the specified row was highlighted.
    ///
    /// - Parameters:
    ///   - tableView: The table-view object that highlighted the cell.
    ///   - indexPath: The index path of the row that was highlighted.
    open override func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.isHighlighted = true
    }

    /// Tells the delegate that the highlight was removed from the row at the specified index path.
    ///
    /// - Parameters:
    ///   - tableView: The table-view object that removed the highlight from the cell.
    ///   - indexPath: The index path of the row that had its highlight removed.
    open override func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.isHighlighted = false
    }
    
}
