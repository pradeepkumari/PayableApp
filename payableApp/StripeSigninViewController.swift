//
//  StripeSigninViewController.swift
//  payableApp
//
//  Created by apple on 15/09/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class StripeSigninViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func stripeSignInAction(sender: AnyObject) {
        self.performSegueWithIdentifier("goto_HomePage", sender: self)
        
    }

    @IBAction func signInLaterAction(sender: AnyObject) {
    }
    @IBAction func changeInfo(sender: AnyObject) {
    }
   
    @IBAction func removeAccount(sender: AnyObject) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
