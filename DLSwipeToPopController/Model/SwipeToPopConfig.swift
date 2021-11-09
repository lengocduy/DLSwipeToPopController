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
    
    /// Maximum of Vertical distance to recognize gesture.
    /// If the distance larger than this property's value. Skip handling due to considering it is not a swipe right gesture
    let maximumOfVerticalDistance: CGFloat
	
    public init(percent: CGFloat, velocity: CGFloat, maximumOfVerticalDistance: CGFloat) {
		self.percent = percent
		self.velocity = velocity
        self.maximumOfVerticalDistance = maximumOfVerticalDistance
	}
}
