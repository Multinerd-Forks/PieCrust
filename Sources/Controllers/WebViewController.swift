//
//  WebViewController.swift
//  iOSAppSkeleton
//
//  Created by Omar Albeik on 6.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit
import SnapKit

open class WebViewController: ViewController {

	public convenience init(url: URL) {
		self.init()
		
		self.url = url
	}
	
	public var url: URL?
	
	public let webView: UIWebView = {
		let view = UIWebView()
		return view
	}()
	
	override open func viewDidLoad() {
        super.viewDidLoad()
		
		view.addSubview(webView)
		webView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
	
	open override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		if let aUrl = url {
			let request = URLRequest(url: aUrl)
			webView.loadRequest(request)
		}
	}
}
