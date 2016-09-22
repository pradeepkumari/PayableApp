//
//  InitialViewController.swift
//  SankarSuperMarket
//
//  Created by Admin on 6/23/16.
//  Copyright © 2016 vertaceapp. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    
 
    @IBOutlet weak var logoimg: UIImageView!
    var timer = NSTimer()
    var a: CGFloat = 1.0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "SplashScreen.png")!)
        
        logoimg.hidden = true
        a = 1.0
        
//        addBackgroundImage()
//        addLogo()
        self.timer = NSTimer.scheduledTimerWithTimeInterval(
            0.01, target: self, selector: Selector("addLogo"), userInfo: nil, repeats: true
        )
      
    }

    func addLogo() {
     
        
        let img = UIImageView(image: UIImage(named: "Splashlogo.png"))

        img.frame = CGRectMake( self.view.frame.size.width/2 - (50 + a/2) , 145 , 100 + a, 100 + a )
        a += 0.5
        
        if(a == 40.0){
            timer.invalidate()
            self.performSegueWithIdentifier("login", sender: self)
        }
        self.view.addSubview(img)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prefersStatusBarHidden() ->Bool {
    return true
    }
   


}
