//
//  SwipeViewController.swift
//  DLSwipeToPopController_Example
//
//  Created by LeNgocDuy on 10/31/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import DLSwipeToPopController

class SwipeViewController: SwipeToPopViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		view.backgroundColor = .green
    }

	/// Default percent 0.25 and horizontal velocity 100 for pan's state is ended to continue the action
	override var swipeToPopConfig: SwipeToPopConfig {
        return SwipeToPopConfig(percent: 0.25, velocity: 100, maximumOfVerticalDistance: 30.0)
	}
}
