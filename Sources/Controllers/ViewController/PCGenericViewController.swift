//
//  PCGenericViewController.swift
//  PieCrust
//
//  Created by Omar Albeik on 9.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

open class PCGenericViewController<T: PCGenericView<U>, U>: PCViewController {

    public convenience init(item: U) {
        self.init()

        self.item = item
    }

    open var item: U?

    open override func loadView() {
        let genericView = T()
        genericView.item = item
        view = genericView
    }

    open var genericView: T {
        return view as! T
    }

}
