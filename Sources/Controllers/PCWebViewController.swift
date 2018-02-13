//
//  PCWebViewController.swift
//  PieCrust
//
//  Created by Omar Albeik on 6.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit
import SnapKit

/// PCWebViewController.
open class PCWebViewController: PCViewController<PCView> {

    /// Web request type.
    ///
    /// - url: load a url in web view.
    /// - htmlString: load an html string with a base URL in web view.
    public enum WebRequestType {
        case url(_: URL)
        case htmlString(_: String, baseURL: URL?)
    }

    /// Optional web request type.
    public var requestType: WebRequestType?

	/// Create WebViewController.
	///
	/// - Parameter requestType: web request type.
	public convenience init(requestType: WebRequestType) {
		self.init()
		
		self.requestType = requestType
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

        guard let type = requestType else { return }
        switch type {
        case .url(let url):
            let request = URLRequest(url: url)
            webView.loadRequest(request)

        case .htmlString(let htmlString, let baseURL):
            webView.loadHTMLString(htmlString, baseURL: baseURL)
        }
	}

}
