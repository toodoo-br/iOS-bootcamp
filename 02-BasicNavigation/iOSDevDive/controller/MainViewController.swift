//
//  MainViewController.swift
//  iOSDevDive
//
//  Created by Paulo Antonio Cerávolo on 29/06/20.
//  Copyright © 2020 TooDoo. All rights reserved.


import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var imageViewTooDooLogo: UIImageView!

    @IBOutlet weak var buttonSegueVC: UIButton!
    @IBOutlet weak var buttonSegueButton: UIButton!
    @IBOutlet weak var buttonAbout: UIButton!
    
    var messages : NSDictionary!
    var aboutTitle : String!
    var aboutMessage : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Hiding the logo and button
        hideAllComponents()
        initializeMessages()
    }

    func initializeMessages() {
        self.messages = Utils.getPlist(withName: "messages")!
        if(self.messages != nil){
            self.aboutMessage = self.messages.value(forKey: "AboutMessage") as? String
            self.aboutTitle = self.messages.value(forKey: "AboutTitle") as? String
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        //Starting simple animation
        animation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //Hiding menubar
        navigationController?.setNavigationBarHidden(true, animated: true)
        }
   
    // Actions
    @IBAction func buttonSegueVC(_ sender: Any) {
        print("Performing segue VC to Components")
        //Performing Segue
        performSegue(withIdentifier: "components", sender: nil)
    }
    
    @IBAction func buttonAbout(_ sender: Any) {
       
        let alert = UIAlertController(title: self.aboutTitle, message: self.aboutMessage, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    //Animations Stuff
    func animation() {
        //Simple animation of logo
        let duration = 3.0
        
        UIView.animateKeyframes(withDuration: 2, delay: 0, options: [.calculationModeCubic], animations:  {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0/duration, animations: {
                 self.imageViewTooDooLogo.alpha = 1.0
              })
            UIView.addKeyframe(withRelativeStartTime: 1.0/duration, relativeDuration: 0.5/duration, animations: {
                self.buttonSegueVC.alpha = 1.0
            })
            UIView.addKeyframe(withRelativeStartTime: 1.5/duration, relativeDuration: 0.5/duration, animations: {
                self.buttonSegueButton.alpha = 1.0
            })
            UIView.addKeyframe(withRelativeStartTime: 2.5/duration, relativeDuration: 0.5/duration, animations: {
                self.buttonAbout.alpha = 1.0
            })
           }, completion:{ _ in
                   print("Done with animations")
               })
    }

    func hideAllComponents() {
        self.imageViewTooDooLogo.alpha = 0.0
        self.buttonSegueVC.alpha = 0.0
        self.buttonSegueButton.alpha = 0.0
        self.buttonAbout.alpha = 0.0
    }
    

}

