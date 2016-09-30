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
        self.changeAction(true, check2: false, check3: false, check4: false,check5: false)
//        if sumupImageClicked == false
//        {
//            sumupImage.image = UIImage(named: "rightunselected@2x.png")
//        }
//        else
//        {
//           sumupImage.image = UIImage(named: "rightselected@2x.png")
//        }

        
    }

    @IBAction func stripeSigninAction(sender: AnyObject)
    {
        self.changeAction(false, check2: true, check3: false, check4: false,check5: false)
        self.performSegueWithIdentifier("goto_MerchantStripe", sender: self)
//        if stripeSigninImageClicked == false
//        {
//            stripeImage.image = UIImage(named: "rightunselected@2x.png")
//        }
//        else
//        {
//            stripeImage.image = UIImage(named: "rightselected@2x.png")
//        }
    }
    @IBAction func signInLaterAction(sender: AnyObject) {
        self.changeAction(false, check2: false, check3: true, check4: false,check5: false)
        
        self.presentViewController(Alert().alert("Title", message: "Please Associate Stripe Account for further Process"),animated: true,completion: nil)
        exit(0)
        
        //Please Associate Stripe account for further Process
//        if signinImageClicked == false
//        {
//            signIn.image = UIImage(named: "rightunselected@2x.png")
//        }
//        else
//        {
//            signIn.image = UIImage(named: "rightselected@2x.png")
//        }
    }
    @IBAction func changeInfoAction(sender: AnyObject) {
        self.changeAction(false, check2: false, check3: false, check4: true,check5: false)
        //GO TO MERCHANT SIGNUP CLASS
        self.performSegueWithIdentifier("goto_Homepage", sender: self)
        
        
        
//        if changeInfoImageClicked == false
//        {
//            changeInfo.image = UIImage(named: "rightunselected@2x.png")
//        }
//        else
//        {
//            changeInfo.image = UIImage(named: "rightselected@2x.png")
//        }
    }
    @IBAction func removeAccountAction(sender: AnyObject) {
        self.changeAction(false, check2: false, check3: false, check4: false,check5: true)
        
        let UserDefaults = NSUserDefaults.standardUserDefaults()
        UserDefaults.setObject("", forKey: "json")
        self.performSegueWithIdentifier("goto_Initial", sender: self)
        
        //   dbHelpher.deleteuserProfile();
        //String accounttype=dbHelpher.CheckAccountExist();
       
        
        
//        if removeAccountImageClicked == false
//        {
//            removeAccount.image = UIImage(named: "rightunselected@2x.png")
//        }
//        else
//        {
//            removeAccount.image = UIImage(named: "rightselected@2x.png")
//        }
    }
    @IBAction func nextButton(sender: AnyObject)
    {
        self.performSegueWithIdentifier("goto_HomePage", sender: self)
    }
    
    
    func changeAction(check1:Bool,check2:Bool,check3:Bool,check4:Bool,check5: Bool)
    {
        if(check1)
        {
            sumupImage.image = UIImage(named: "rightselected@2x.png")
            stripeImage.image = UIImage(named: "rightunselected@2x.png")
            signIn.image = UIImage(named: "rightunselected@2x.png")
            changeInfo.image = UIImage(named: "rightunselected@2x.png")
            removeAccount.image = UIImage(named: "rightunselected@2x.png")
        }
        if(check2)
        {
            sumupImage.image = UIImage(named: "rightunselected@2x.png")
            stripeImage.image = UIImage(named: "rightselected@2x.png")
            signIn.image =  UIImage(named: "rightunselected@2x.png")
            changeInfo.image = UIImage(named: "rightunselected@2x.png")
            removeAccount.image = UIImage(named: "rightunselected@2x.png")
        }
        if(check3)
        {
            sumupImage.image = UIImage(named: "rightunselected@2x.png")
            stripeImage.image = UIImage(named: "rightunselected@2x.png")
            signIn.image = UIImage(named: "rightselected@2x.png")
            changeInfo.image =  UIImage(named: "rightunselected@2x.png")
            removeAccount.image = UIImage(named: "rightunselected@2x.png")
        }
        if(check4)
        {
            sumupImage.image = UIImage(named: "rightunselected@2x.png")
            stripeImage.image = UIImage(named: "rightunselected@2x.png")
            signIn.image = UIImage(named: "rightunselected@2x.png")
            changeInfo.image = UIImage(named: "rightselected@2x.png")
            removeAccount.image = UIImage(named: "rightunselected@2x.png")
        }
        if(check5)
        {
            sumupImage.image = UIImage(named: "rightunselected@2x.png")
            stripeImage.image = UIImage(named: "rightunselected@2x.png")
            signIn.image = UIImage(named: "rightunselected@2x.png")
            changeInfo.image = UIImage(named: "rightunselected@2x.png")
            removeAccount.image =  UIImage(named: "rightselected@2x.png")
        }
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
