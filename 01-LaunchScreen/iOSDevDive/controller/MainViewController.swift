//
//  MainViewController.swift
//  iOSDevDive
//
//  Created by Paulo Antonio Cerávolo on 29/06/20.
//  Copyright © 2020 TooDoo. All rights reserved.


import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var imageViewTooDooLogo: UIImageView!
    @IBOutlet weak var buttonComponents: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Hiding the logo and button
        hideAllComponents()
    }

    override func viewWillAppear(_ animated: Bool) {
        animation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //Hiding menubar
        navigationController?.setNavigationBarHidden(true, animated: true)
        }
   
    @IBAction func buttonPressed(_ sender: Any) {
        print("Performing segue to Components")
    }
    
    
    // Animations
    func animation() {
        //Simple animation of logo
        UIView.animateKeyframes(withDuration: 1.5, delay: 0, options: [.calculationModeCubic], animations:  {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0/1.5, animations: {
                 self.imageViewTooDooLogo.alpha = 1.0
              })
            UIView.addKeyframe(withRelativeStartTime: 1.0/1.5, relativeDuration: 0.5/1.5, animations: {
                self.buttonComponents.alpha = 1.0
            })
           }, completion:{ _ in
                   print("Done with animations")
               })
    }

    func hideAllComponents() {
        self.imageViewTooDooLogo.alpha = 0.0
        self.buttonComponents.alpha = 0.0
    }
    

}

