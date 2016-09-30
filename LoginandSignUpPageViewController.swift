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
    
    @IBOutlet var userNameSwitch: UISwitch!
    @IBOutlet var passwordSwitch: UISwitch!

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var username = ""
    var password = ""
    var userid = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg.png")!)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    @IBAction func rememberUsernameBtn(sender: UISwitch) {
        
        print("username status %@",sender.on);
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setBool(sender.on, forKey: "isUserNameSaved")
        if(sender.on==false){
            defaults.setObject("", forKey: "savedUserName")
        }
    }
    @IBAction func rememberPasswordBtn(sender: UISwitch) {
        
        print("password status %@",sender.on);
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setBool(sender.on, forKey: "isPasswordSaved")
        if(sender.on==false){
            defaults.setObject("", forKey: "savedPassword")
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        
        self.createBottomLineTextField(userNameTextField)
        self.createBottomLineTextField(passwordTextField)
        self.createBorderStylingForButton(loginButton)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        userNameSwitch.setOn(defaults.boolForKey("isUserNameSaved"), animated: true)
        passwordSwitch.setOn(defaults.boolForKey("isPasswordSaved"), animated: true)
        
        if(defaults.boolForKey("isUserNameSaved")){
            let userName = defaults.stringForKey("savedUserName")
            self.userNameTextField.text = userName
        }
        if(defaults.boolForKey("isPasswordSaved")){
            let password = defaults.stringForKey("savedPassword")
            self.passwordTextField.text = password
        }
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
        
        activityIndicator.startAnimating()
        
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
//                let result:NSString = responseString!.stringByTrimmingCharactersInSet(NSCharacterSet.init(charactersInString: "la t, \n \" ':"))
//                print(result)
                let json = JSON(data: data!)
              
                
                print(json["Username"].rawString(NSUTF8StringEncoding, options: .PrettyPrinted))
                print(json["Password"].stringValue)
                print(json["UserId"].stringValue)
                
                
                dispatch_async(dispatch_get_main_queue(), {
                    if responseString == "-2"
                    {
                        self.presentViewController(Alert().alert("Title", message: "Invalid Username/Password"),animated: true,completion: nil)
                        
                    }
                    else if responseString! == ""
                    {
                        self.presentViewController(Alert().alert("Title", message: "Please Check your Internet connection"),animated: true,completion: nil)
                    }
                    else
                    {
                        MerchantDetailsSingleTon.sharedInstance.setUserId(json["UserId"].stringValue)
                        MerchantDetailsSingleTon.sharedInstance.setUsername(json["Username"].stringValue)
                        MerchantDetailsSingleTon.sharedInstance.setUsername(json["Password"].stringValue)
                        MerchantDetailsSingleTon.sharedInstance.setEmail(json["EMail"].stringValue)
                        MerchantDetailsSingleTon.sharedInstance.setPhonenumber(json["PhoneNumber"].stringValue)
                        MerchantDetailsSingleTon.sharedInstance.setAccHoldername(json["AccountHolderName"].stringValue)
                        
                        
                        self.userid = json["UserId"].stringValue
                        self.username = json["Username"].stringValue
                        self.password = json["Password"].stringValue
                        print(json["Username"].stringValue)
                        print(json["Password"].stringValue)
                        print(json["UserId"].stringValue)
                        DBHelper().opensupermarketDB()
                        let databaseURL = NSURL(fileURLWithPath:NSTemporaryDirectory()).URLByAppendingPathComponent("PayableApp.db")
                        let databasePath = databaseURL.absoluteString
                        let supermarketDB = FMDatabase(path: databasePath as String)
                        if supermarketDB.open() {
                            
                            
                            let insertSQL = "INSERT INTO LOGINTABLE2 (USERID,USERNAME,PASSWORD,EMAIL,PHONENUMBER,ACCOUNTHOLDERNAME,ACCOUNTTYPE) VALUES ('\(json["UserId"].stringValue)','\(json["Username"].stringValue)','\(json["password"].stringValue)','\(json["EMail"].stringValue)','\(json["PhoneNumber"].stringValue)','\(json["AccountHolderName"].stringValue)','\(json["AccountType"].stringValue)')"
                            
                            let result = supermarketDB.executeUpdate(insertSQL,
                                withArgumentsInArray: nil)
                            if !result {
                                //   status.text = "Failed to add contact"
                                print("Error: \(supermarketDB.lastErrorMessage())")
                            }
                            else {
                                dispatch_async(dispatch_get_main_queue()) {
                                    let alert:UIAlertView = UIAlertView()
                                    alert.delegate = self
                                    alert.title = "Alert"
                                    alert.message = "Login Sucess"
                                    alert.addButtonWithTitle("Done")
                                    alert.show()
//                                    self.performSegueWithIdentifier("Signin", sender: self)
                                }
                            }
                            
                           
                        }
                        self.activityIndicator.stopAnimating()
                    }
                    
                })
                
                //
        }
        task.resume()
        
    }
    
    
    func AddRememberMe(){
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let userNameText = (userNameSwitch.on ? userNameTextField.text : "")
        defaults.setObject(userNameText, forKey: "savedUserName")
        
        let passwordText = (passwordSwitch.on ? passwordTextField.text : "")
        defaults.setObject(passwordText, forKey: "savedPassword")
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
