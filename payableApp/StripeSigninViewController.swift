//
//  StripeSigninViewController.swift
//  payableApp
//
//  Created by apple on 15/09/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class StripeSigninViewController: UIViewController {
    
    @IBOutlet weak var signIn: UIImageView!
    @IBOutlet weak var sumupImage: UIImageView!
    @IBOutlet weak var stripeImage: UIImageView!
    @IBOutlet weak var changeInfo: UIImageView!
    @IBOutlet weak var removeAccount: UIImageView!
    var sumupImageClicked:Bool = false
    var stripeSigninImageClicked:Bool = false
    var signinImageClicked:Bool = false
    var changeInfoImageClicked:Bool = false
    var removeAccountImageClicked:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sumupAction(sender: AnyObject) {
    
        if sumupImageClicked == false
        {
            sumupImage.image = UIImage(named: "icon_username.png")
        }
        else
        {
           sumupImage.image = UIImage(named: "icon_password.png")
        }

        
    }

    @IBAction func stripeSigninAction(sender: AnyObject) {
        if stripeSigninImageClicked == false
        {
            stripeImage.image = UIImage(named: "icon_username.png")
        }
        else
        {
            stripeImage.image = UIImage(named: "icon_password.png")
        }
    }
    @IBAction func signInLaterAction(sender: AnyObject) {
        if signinImageClicked == false
        {
            signIn.image = UIImage(named: "icon_username.png")
        }
        else
        {
            signIn.image = UIImage(named: "icon_password.png")
        }
    }
    @IBAction func changeInfoAction(sender: AnyObject) {
        if changeInfoImageClicked == false
        {
            changeInfo.image = UIImage(named: "icon_username.png")
        }
        else
        {
            changeInfo.image = UIImage(named: "icon_password.png")
        }
    }
    @IBAction func removeAccountAction(sender: AnyObject) {
        if removeAccountImageClicked == false
        {
            removeAccount.image = UIImage(named: "icon_username.png")
        }
        else
        {
            removeAccount.image = UIImage(named: "icon_password.png")
        }
    }
    @IBAction func nextButton(sender: AnyObject)
    {
        self.performSegueWithIdentifier("goto_HomePage", sender: self)
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
