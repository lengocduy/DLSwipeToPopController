//
//  SwipeToPopConfig.swift
//  DLSwipeToPopController
//
//  Created by LeNgocDuy on 10/31/21.
//

import UIKit

public struct SwipeToPopConfig {
	/// Percent of drag distance / screen size
	let percent: CGFloat
	
	/// Velocity for swipe even in horizontal direction
	let velocity: CGFloat
	
	public init(percent: CGFloat, velocity: CGFloat) {
		self.percent = percent
		self.velocity = velocity
	}
}
