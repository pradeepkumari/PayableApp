//
//  LoginandSignUpPageViewController.swift
//  payableApp
//
//  Created by apple on 13/09/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit
import Security

class LoginandSignUpPageViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    var isRememberUsernameClicked:Bool = true
    var isRememberPasswordClicked:Bool = true
    override func viewDidLoad() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        super.viewDidLoad()
        
        
        
        
    }
    
    @IBAction func rememberUsernameBtn(sender: AnyObject) {
        
        if(isRememberUsernameClicked)
        {
            isRememberUsernameClicked = false
        }
        else
        {
            isRememberUsernameClicked = true
        }
        
    }
    @IBAction func rememberPasswordBtn(sender: AnyObject) {
        if(isRememberPasswordClicked)
        {
            isRememberPasswordClicked = false
        }
        else
        {
            isRememberPasswordClicked = true
        }
    }
  
    override func viewWillAppear(animated: Bool) {
        self.createBottomLineTextField(userNameTextField)
        self.createBottomLineTextField(passwordTextField)
        self.createBorderStylingForButton(loginButton)
        
       
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //TEXTFIELD WITH BOTTOMLINE
    func createBottomLineTextField(textField:UITextField)
    {
        let bottomLine = CALayer()
        bottomLine.frame = CGRectMake(0.0, textField.frame.height - 1 , textField.frame.width, 1.0)
        bottomLine.backgroundColor = UIColor.blackColor().CGColor
        textField.borderStyle = UITextBorderStyle.None
        textField.layer.addSublayer(bottomLine)
    }
    
    //STYLE FOR LOGIN BUTTON
    func createBorderStylingForButton(button:UIButton)
    {
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.whiteColor().CGColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func newUserButtonAction(sender: AnyObject) {
        self.performSegueWithIdentifier("goto_signup", sender: self)
    }
    
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if(segue.identifier == "goto_signUp") {
//            let nextviewcontroller = segue.destinationViewController as! SignUpViewController
//            
//        }
//        
//    }
    
    func loginButtonAction(sender: AnyObject)
    {
        self.AddRememberMe()
        
        if userNameTextField.text!.isEmpty
        {
            self.presentViewController(Alert().alert("Warning", message: "Enter your Username"),animated: true,completion: nil)
        }
        else if passwordTextField.text!.isEmpty
        {
            self.presentViewController(Alert().alert("Warning", message: "Enter your password"),animated: true,completion: nil)
        }
        else
        {
            self.authenticateUser()
        }

    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int){
     
            self.performSegueWithIdentifier("goto_Homepage", sender: self)
    
    }

    
    @IBAction func forgotPasswordBtn(sender: AnyObject) {
        self.displayViewController(.BottomTop)
    }
    
    
    func displayViewController(animationType: SLpopupViewAnimationType) {
        let myPopupViewController:ForgotPasswordPopUpViewController = ForgotPasswordPopUpViewController(nibName:"ForgotPasswordPopUpViewController", bundle: nil)
        //        myPopupViewController.delegate = self
        self.presentpopupViewController(myPopupViewController, animationType: animationType, completion: { () -> Void in
            
        })
    }
    
    func authenticateUser()
    {
//            progressDialog.show();
        
            
            let merchantLoginViewModel = MerchantLoginViewModel.init(Username : userNameTextField.text!, Password : passwordTextField.text!)
            
        let serializedjson  = JSONSerializer.toJson(merchantLoginViewModel!)
        print(serializedjson)
        
        
        let request = NSMutableURLRequest(URL: NSURL(string: Appconstant.WEB_API + Appconstant.API_AuthenticateUser)!)
        request.HTTPMethod = "Post"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.HTTPBody = serializedjson.dataUsingEncoding(NSUTF8StringEncoding)
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request)
            { data, response, error in
                guard error == nil && data != nil else {                                                          // check for fundamental networking error
                    
                    return
                }
                
                if let httpStatus = response as? NSHTTPURLResponse where httpStatus.statusCode != 200 {           // check for http errors
                    print("statusCode should be 200, but is \(httpStatus.statusCode)")
                    print("response = \(response)")
                }
                
                let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
                print("responseString = \(responseString!)")
                let result:NSString = responseString!.stringByTrimmingCharactersInSet(NSCharacterSet.init(charactersInString: "la t, \n \" ':"))
                print(result)
                dispatch_async(dispatch_get_main_queue(), {
                    if result == "\"-2\""
                    {
                        self.presentViewController(Alert().alert("Title", message: "Invalid Username/Password"),animated: true,completion: nil)
                        
                    }
                    else if responseString! == ""
                    {
                        self.presentViewController(Alert().alert("Title", message: "Please Check your Internet connection"),animated: true,completion: nil)
                    }
                    else
                    {
                        let alert:UIAlertView = UIAlertView()
                        alert.delegate = self
                        alert.title = "Alert"
                        alert.message = "Login Sucess"
                        alert.addButtonWithTitle("Done")
                        alert.show()
                    }
                    
                })
                
                //
        }
        task.resume()

    }

    
    func AddRememberMe()
    {
        if (isRememberUsernameClicked && isRememberPasswordClicked)
        {
//            let keyChain:KeychainItemWrapper = KeychainItemWrapper(identifier: "TestAppLoginData", accessGroup: nil)
//            keychain[(kSecAttrAccount as! Any)] = self.userNameTextField.text!
//            keychain[(kSecValueData as! Any)] = self.passwordTextField.text!
            
        }
        else if (isRememberPasswordClicked) {
            let keyChain:KeychainItemWrapper = KeychainItemWrapper(identifier: "TestAppLoginData", accessGroup: nil)
            
//            keychain[(kSecValueData as! Any)] = self.passwordTextField.text!
        }
        else if (isRememberUsernameClicked)
        {
            let keyChain:KeychainItemWrapper = KeychainItemWrapper(identifier: "TestAppLoginData", accessGroup: nil)
//            keychain[(kSecAttrAccount as! Any)] = self.userNameTextField.text!
           
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
