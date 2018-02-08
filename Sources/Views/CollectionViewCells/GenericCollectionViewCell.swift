//
//  GenericCollectionViewCell.swift
//  iOSAppSkeleton
//
//  Created by Omar Albeik on 6.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

/// Generic CollectionViewCell.
open class GenericCollectionViewCell<T>: CollectionViewCell {

	/// Generic item, override this to set your UI.
	open var item: T!
	
}
