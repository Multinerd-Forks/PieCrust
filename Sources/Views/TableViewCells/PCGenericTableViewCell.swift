//
//  PCGenericTableViewCell.swift
//  PieCrust
//
//  Created by Omar Albeik on 6.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

/// Generic PCTableViewCell.
open class PCGenericTableViewCell<T>: PCTableViewCell {

	/// Generic item, override this to set your UI.
	open var item: T!

}
