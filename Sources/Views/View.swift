//
//  View.swift
//  iOSAppSkeleton
//
//  Created by Omar Albeik on 5.02.2018.
//

import UIKit
import SnapKit

open class View: UIView, Borderable, Animatable {
	
	private lazy var confettiView: ConfettiView = {
		return ConfettiView()
	}()
	
	override public init(frame: CGRect) {
		super.init(frame: frame)
		
		setViews()
		layoutViews()
		
		if showsConfetti {
			addSubview(confettiView)
			confettiView.snp.makeConstraints { $0.edges.equalToSuperview() }
		}
	}
	
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		setViews()
		layoutViews()
		
		if showsConfetti {
			addSubview(confettiView)
			confettiView.snp.makeConstraints { $0.edges.equalToSuperview() }
		}
	}
	
	open func setViews() {
		backgroundColor = .white
	}
	
	open func layoutViews() {}
	
	open var preferredPadding: CGFloat {
		return 20
	}
	
	open var showsConfetti: Bool {
		return false
	}
	
	open func handleKeyboardWillShow(_ sender: Notification) {}
	
	open func handleKeyboardDidShow(_ sender: Notification) {}
	
	open func handleKeyboardWillHide(_ sender: Notification) {}
	
	open func handleKeyboardDidHide(_ sender: Notification) {}
	
	open func handleKeyboardWillChangeFrame(_ sender: Notification) {}
	
	open func handleKeyboardDidChangeFrame(_ sender: Notification) {}
	
	public func startConfetti() {
		guard showsConfetti else {
			debugPrint("iOSAppSkeleton: Set showsConfetti to true before starting confetti!")
			return
		}
		confettiView.isActive = true
	}
	
	public func stopConfetti() {
		confettiView.isActive = false
	}
	
}

