//
//  TableViewController.swift
//  DLSwipeToPopController_Example
//
//  Created by LeNgocDuy on 10/31/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import DLSwipeToPopController

class SwipeTableViewController: SwipeToPopTableViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
        
        tableView.backgroundColor = .white
	}

	// MARK: - Table view data source

	override func numberOfSections(in tableView: UITableView) -> Int {
		// #warning Incomplete implementation, return the number of sections
		return 0
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// #warning Incomplete implementation, return the number of rows
		return 0
	}
	
	/// Default percent 0.25 and horizontal velocity 100 for pan's state is ended to continue the action
	override var swipeToPopConfig: SwipeToPopConfig {
        return SwipeToPopConfig(percent: 0.1, velocity: 500, maximumOfVerticalDistance: 20)
	}
    
    override public func didPopViewController() {
        print("do something fire event | callback to delegate to parent")
    }
}
