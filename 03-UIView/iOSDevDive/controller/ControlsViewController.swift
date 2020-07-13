//
//  ControlsViewController.swift
//  iOSDevDive
//
//  Created by Paulo Antonio Cerávolo on 12/07/20.
//  Copyright © 2020 TooDoo. All rights reserved.
//

import UIKit

class ControlsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //Showing navbar
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        //Hiding navbar
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
      
}
