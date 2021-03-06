//
//   SwipeToPopTableViewController.swift
//  DLSwipeToPopController
//
//  Created by LeNgocDuy on 10/31/21.
//

import UIKit

// MARK: - SwipeToPopTableViewController

open class SwipeToPopTableViewController: UITableViewController, SwipeToPopControllable {
    public var isDragging  = false
    
	public var percentDrivenInteractiveTransition: UIPercentDrivenInteractiveTransition?
	// swiftlint:disable implicitly_unwrapped_optional
	public var panGestureRecognizer: UIPanGestureRecognizer!

	override open func viewDidLoad() {
		super.viewDidLoad()

		addGesture(action: #selector(SwipeToPopTableViewController.handlePanGesture(_:)))
	}
    
    override open func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        // Make sure the view was pop instead of push and not embedded inside a container view
        if view.superview == nil && navigationController == nil {
            didPopViewController()
        }
    }

	@objc
	func handlePanGesture(_ panGesture: UIPanGestureRecognizer) {
		handleStatePanGesture(panGesture)
	}

	override open func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}

	open func didPopViewController() {}
	
	/// Default percent 0.5 and horizontal velocity 1000
	open var swipeToPopConfig: SwipeToPopConfig {
        SwipeToPopConfig(percent: 0.5, velocity: 1000, maximumOfVerticalDistance: 30)
	}
}

// MARK: - UINavigationControllerDelegate

public extension SwipeToPopTableViewController {
	func navigationController(
		_ navigationController: UINavigationController,
		animationControllerFor operation: UINavigationController.Operation,
		from fromVC: UIViewController,
		to toVC: UIViewController
	) -> UIViewControllerAnimatedTransitioning? {
		SlideAnimatedTransitioning()
	}

	func navigationController(
		_ navigationController: UINavigationController,
		interactionControllerFor animationController: UIViewControllerAnimatedTransitioning
	) -> UIViewControllerInteractiveTransitioning? {

		navigationController.delegate = nil

		return update(animationController: animationController)
	}
}

// MARK: - UIGestureRecognizerDelegate

public extension SwipeToPopTableViewController {
	func gestureRecognizer(
		_ gestureRecognizer: UIGestureRecognizer,
		shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer
	) -> Bool {
		return shouldRecognizeSimultaneously(gestureRecognizer, otherGestureRecognizer: otherGestureRecognizer)
	}
}
