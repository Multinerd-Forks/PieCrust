//
//  GenericTableController.swift
//  iOSAppSkeleton
//
//  Created by Omar Albeik on 6.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

open class GenericTableController<T: GenericTableViewCell<U>, U>: UITableViewController {
	
	public override init(style: UITableViewStyle) {
		super.init(style: style)
		
		registerCell()
	}
	
	public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		
		registerCell()
	}
	
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		registerCell()
	}
	
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
