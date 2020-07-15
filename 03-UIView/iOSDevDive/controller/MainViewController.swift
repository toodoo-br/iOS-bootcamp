//
//  MainViewController.swift
//  iOSDevDive
//
//  Created by Paulo Antonio Cerávolo on 29/06/20.
//  Copyright © 2020 TooDoo. All rights reserved.


import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var imageViewTooDooLogo: UIImageView!

    @IBOutlet weak var buttonAbout: UIButton!
    @IBOutlet weak var buttonTextStuff: UIButton!
    @IBOutlet weak var buttonImageStuff: UIButton!
    @IBOutlet weak var buttonControlStuff: UIButton!
    
    @IBOutlet weak var switchAnimation: UISwitch!
    
    var messages : NSDictionary!
    var aboutTitle : String!
    var aboutMessage : String!
    var animated: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Hiding the logo and button
        initialize()
    }

    func initialize(){
        self.animated = true
        initializeMessages()
        customButtons()
    }
    
    func customButtons(){
        //Customize TextButton
        self.buttonTextStuff.backgroundColor = UIColor(red: 0.4, green: 1.0, blue: 0.2, alpha: 0.5)
        self.buttonTextStuff.layer.cornerRadius = 5
        self.buttonTextStuff.setTitleColor(.black, for: .normal)
        self.buttonTextStuff.titleEdgeInsets = UIEdgeInsets(top: 10,left: 10,bottom: 10,right: 10)
   
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
        if(self.animated) {
            hideAllComponents()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //Hiding menubar
        navigationController?.setNavigationBarHidden(true, animated: false)
        if(self.animated){
            animation()
        }
    }
    
   
    // Actions
    //Switch change value
     @IBAction func switchValueChanged(_ swc: UISwitch) {
        self.animated = swc.isOn
        
    }
    //Buttons pressed segue
    @IBAction func buttonTextSuff(_ sender: Any) {
        performSegue(withIdentifier: "textComponents", sender: sender)
    }
    
    @IBAction func buttonImageStuff(_ sender: Any) {
        performSegue(withIdentifier: "imageComponents", sender: sender)
    }
    
    @IBAction func buttonControlStuff(_ sender: Any) {
        performSegue(withIdentifier: "controlComponents", sender: sender)
    }
    // About alert
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
                self.buttonTextStuff.alpha = 1.0
            })
            UIView.addKeyframe(withRelativeStartTime: 1.5/duration, relativeDuration: 0.5/duration, animations: {
                self.buttonImageStuff.alpha = 1.0
            })
            UIView.addKeyframe(withRelativeStartTime: 2.0/duration, relativeDuration: 0.5/duration, animations: {
                self.buttonControlStuff.alpha = 1.0
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
        self.buttonTextStuff.alpha = 0.0
        self.buttonImageStuff.alpha = 0.0
        self.buttonControlStuff.alpha = 0.0
        self.buttonAbout.alpha = 0.0
    }
    

}

