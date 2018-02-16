//
//  PCGenericTableController.swift
//  PieCrust
//
//  Created by Omar Albeik on 6.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit
import SnapKit

/// Generic PCTableController.
open class PCGenericTableController<T: PCGenericTableViewCell<U>, U>: PCTableViewController {

    /// Create a generic table view controller and set its items.
    ///
    /// - Parameters:
    ///   - style: table view style (default is .grouped)
    ///   - items: array of generic items arrays.
    public convenience init(style: UITableViewStyle = .grouped, items: [[U]]) {
        self.init(style: style)

		self.items = items
    }

	override public init(style: UITableViewStyle) {
		super.init(style: style)

		registerCell()
	}

	override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

		registerCell()
	}

	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)

		registerCell()
	}

	/// Generic items array.
	open var items: [[U]] = [[]]

	private func registerCell() {
		tableView.register(cellWithClass: T.self)
	}

	open override func numberOfSections(in tableView: UITableView) -> Int {
		return items.count
	}

	open override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return items[section].count
	}

	open override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withClass: T.self, for: indexPath)!
		cell.item = items[indexPath.section][indexPath.row]
		return cell
	}

	open override func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
		tableView.cellForRow(at: indexPath)?.isHighlighted = true
	}

	open override func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
		tableView.cellForRow(at: indexPath)?.isHighlighted = false
	}

}
