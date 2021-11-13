//
//  SwipeToPopControllable.swift
//  DLSwipeToPopController
//
//  Created by LeNgocDuy on 10/31/21.
//

import UIKit

public protocol SwipeToPopControllable: UINavigationControllerDelegate, UIGestureRecognizerDelegate {
	var percentDrivenInteractiveTransition: UIPercentDrivenInteractiveTransition? { get set }
	
	// swiftlint:disable implicitly_unwrapped_optional
	var panGestureRecognizer: UIPanGestureRecognizer! { get set }
	
	/// Customize for handle even once user end his action panGesture.state == .ended : drag or swipe
	var swipeToPopConfig: SwipeToPopConfig { get }
    
    /// Check whether user is dragging or not. If User is dragging just let user continue with the action
    var isDragging: Bool { get set }

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
			// Priority for Swipe Right to Pop ViewController. Skip other gestures
			let velocity = panGestureRecognizer.velocity(in: view)
			return velocity.x < 0
		}

		return true
	}

	func handleStatePanGesture(_ panGesture: UIPanGestureRecognizer) {

		let percent = max(panGesture.translation(in: view).x, 0) / view.frame.width

		switch panGesture.state {

		case .began:
            isDragging = false
			navigationController?.delegate = self
			_ = navigationController?.popViewController(animated: true)

		case .changed:
            let translation = panGesture.translation(in: view)
            let shouldRecognize = abs(translation.x) > abs(translation.y) &&  abs(translation.y) < swipeToPopConfig.maximumOfVerticalDistance || isDragging
            
            if !shouldRecognize {
                percentDrivenInteractiveTransition?.cancel()
                break
            }
            
            isDragging = true
			if let percentDrivenInteractiveTransition = percentDrivenInteractiveTransition {
				percentDrivenInteractiveTransition.update(percent)
			}

		case .ended:
			let velocity = panGesture.velocity(in: view)
            let translation = panGesture.translation(in: view)

            // Continue if drag more than customized percent of screen width or velocity is higher than customized velocity and horizontal direction
            let shouldFinishBaseOnVelocity = abs(translation.x) > abs(translation.y) && velocity.x > swipeToPopConfig.velocity
            if percent > swipeToPopConfig.percent || shouldFinishBaseOnVelocity {
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
