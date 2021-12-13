//
//  ModalViewController.swift
//  DLSwipeToPopController_Example
//
//  Created by Duy Le Ngoc on 13/12/2021.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit

final class ModalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .gray
    }
    
    @IBAction func didTapToDismiss(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
