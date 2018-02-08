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

	/// Create WebViewController.
	///
	/// - Parameter url: url.
	public convenience init(url: URL) {
		self.init()
		
		self.url = url
	}
	
	/// url.
	open var url: URL?
	
	/// Web view.
	open lazy var webView: UIWebView = {
		let view = UIWebView()
		view.backgroundColor = .white
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
