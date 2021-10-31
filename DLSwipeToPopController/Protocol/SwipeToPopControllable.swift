//
//  SwipeToPopControllable.swift
//  DLSwipeToPopController
//
//  Created by LeNgocDuy on 10/31/21.
//

import UIKit

public protocol SwipeToPopControllable: AnyObject, UINavigationControllerDelegate, UIGestureRecognizerDelegate {
	var percentDrivenInteractiveTransition: UIPercentDrivenInteractiveTransition? { get set }
	
	// swiftlint:disable implicitly_unwrapped_optional
	var panGestureRecognizer: UIPanGestureRecognizer! { get set }
	
	/// Customize for handle even once user end his action panGesture.state == .ended : drag or swipe
	var swipeToPopConfig: SwipeToPopConfig { get }

	/// Callback when ViewController was popped
	func didPopViewController()

	/// Add Gesture to your ViewController
	func addGesture(action: Selector?)

	/// Handle UIViewControllerInteractiveTransitioning
	func update(
		animationController: UIViewControllerAnimatedTransitioning
	) -> UIViewControllerInteractiveTransitioning?

	/// Support multi gestures at a time or not. Exclude swipe right of PanGesture
	/// We need to implement this to come over with warning of @objc
	func shouldRecognizeSimultaneously(
		_ gestureRecognizer: UIGestureRecognizer,
		otherGestureRecognizer: UIGestureRecognizer
	) -> Bool

	/// Handle state of PanGestust
	/// We need to implement this to come over with warning of @objc for #selector
	func handleStatePanGesture(_ panGesture: UIPanGestureRecognizer)
}

// MARK: - SwipeToPopControllable implementation default

public extension SwipeToPopControllable where Self: UIViewController {
	func addGesture(action: Selector?) {
		panGestureRecognizer = UIPanGestureRecognizer(
			target: self,
			action: action
		)
		panGestureRecognizer.delegate = self
		view.addGestureRecognizer(panGestureRecognizer)
	}

	func didPopViewController() {}

	func update(
		animationController: UIViewControllerAnimatedTransitioning
	) -> UIViewControllerInteractiveTransitioning? {
		if panGestureRecognizer.state == .began {
			percentDrivenInteractiveTransition = UIPercentDrivenInteractiveTransition()
			percentDrivenInteractiveTransition?.completionCurve = .easeOut
		} else {
			percentDrivenInteractiveTransition = nil
		}
		return percentDrivenInteractiveTransition
	}

	func shouldRecognizeSimultaneously(
		_ gestureRecognizer: UIGestureRecognizer,
		otherGestureRecognizer: UIGestureRecognizer
	) -> Bool {
		if let panGestureRecognizer = gestureRecognizer as? UIPanGestureRecognizer {
			// Priority for Swipe Right to Pop ViewController
			let velocity = panGestureRecognizer.velocity(in: view)
			return velocity.x < 0
		}

		return true
	}

	func handleStatePanGesture(_ panGesture: UIPanGestureRecognizer) {

		let percent = max(panGesture.translation(in: view).x, 0) / view.frame.width

		switch panGesture.state {

		case .began:
			navigationController?.delegate = self
			_ = navigationController?.popViewController(animated: true)

		case .changed:
			if let percentDrivenInteractiveTransition = percentDrivenInteractiveTransition {
				percentDrivenInteractiveTransition.update(percent)
			}

		case .ended:
			let velocity = panGesture.velocity(in: view).x

			// Continue if drag more than customized percent of screen width or velocity is higher than customized velocity
			if percent > swipeToPopConfig.percent || velocity > swipeToPopConfig.velocity {
				percentDrivenInteractiveTransition?.finish()
				didPopViewController()
			} else {
				percentDrivenInteractiveTransition?.cancel()
			}

		case .cancelled, .failed:
			percentDrivenInteractiveTransition?.cancel()

		default:
			break
		}
	}
}
