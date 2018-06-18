//
//  Layouting.swift
//  PieCrust
//
//  Created by Omar Albeik on 6/14/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

public protocol Layouting: AnyObject {

	/// PCView.
	associatedtype View: PCView

	/// view as PCView.
	var pcView: View { get }

}

public extension Layouting where Self: UIViewController {

	/// view as PCView.
	public var pcView: View {
		return view as! View
	}

}
