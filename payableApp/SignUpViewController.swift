//
//  SignUpViewController.swift
//  payableApp
//
//  Created by apple on 13/09/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UIAlertViewDelegate {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var categoryNameTextField: UITextField!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var selectAccountTypeButton: UIButton!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPwdTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var categoryTypeBtn: UIButton!
    var accountType: [NSString]! = []
    var categoryType: [NSString]! = []
    var sumUpCheck: Bool = true
    var screenSize:CGRect!
    var screenWidth:CGFloat!
    var screenHeight:CGFloat!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        self.createBottomLineTextField(userNameTextField)
        self.createBottomLineTextField(emailTextField)
        self.createBottomLineTextField(passwordTextField)
        self.createBottomLineTextField(confirmPwdTextField)
        self.createBottomLineTextField(phoneTextField)
        
        
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        
        accountType = ["Stripe Sign in ","SumUp Sign in"]
        categoryType = ["Individual","Employee","Company","Non-Profit Organisation","Non-Profit Organisation Employee"]
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    @IBAction func selectAccountType(sender: AnyObject) {
        self.alertFunction(accountType)
    }
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    func createBottomLineTextField(textField:UITextField)
    {
        let bottomLine = CALayer()
        bottomLine.frame = CGRectMake(0.0, textField.frame.height - 1 , textField.frame.width, 1.0)
        bottomLine.backgroundColor = UIColor.blackColor().CGColor
        textField.borderStyle = UITextBorderStyle.None
        textField.layer.addSublayer(bottomLine)
    }
    
    func alertFunction(accountType: NSArray){
        let alertView: UIAlertView = UIAlertView()
        alertView.delegate = self
//        alertView.title = "Wish List"
        for(var i = 0; i<accountType.count ; i++){
            alertView.addButtonWithTitle("\(accountType[i])")
            
        }
//        alertView.addButtonWithTitle("Create New Wishlist")
        alertView.addButtonWithTitle("Cancel")
        alertView.show()
    }
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int){
        if buttonIndex == 0
        {
           selectAccountTypeButton.setTitle("   Stripe Sign in", forState:.Normal)
            bottomView.frame.origin.y = selectAccountTypeButton.frame.origin.y + selectAccountTypeButton.frame.size.height+110
            sumUpCheck = false
            
        }
        else if buttonIndex == 1
        {
            selectAccountTypeButton.setTitle("   SumUp Sign in", forState:.Normal)
            bottomView.frame.origin.y = selectAccountTypeButton.frame.origin.y + selectAccountTypeButton.frame.size.height+11
            sumUpCheck = true
        }
        else
        {
           selectAccountTypeButton.setTitle("   Select Account Type", forState:.Normal)
             bottomView.frame.origin.y = selectAccountTypeButton.frame.origin.y + selectAccountTypeButton.frame.size.height+11
            sumUpCheck = true
        }
    }
    
    
    
    
    func addCategory() {
        
//        let popoverContent = (self.storyboard?.instantiateViewControllerWithIdentifier("popOver"))! as! PopOverViewController
////        let nav = UINavigationController(rootViewController: popoverContent)
//        popoverContent.modalPresentationStyle = .Popover
//        let popover = popoverContent.popoverPresentationController
//        popoverContent.preferredContentSize = CGSizeMake(100,150)
//        popover!.delegate = self
//        popover!.sourceView = self.view
//        popover!.sourceRect = CGRectMake(100,100,0,0)
        
//        self.view.addSubview(popoverContent.view)
//        popoverContent.didMoveToParentViewController(self)
//        self.presentViewController(popoverContent, animated: true, completion: nil)
        
      
        
        
        
    }
    
    func displayViewController(animationType: SLpopupViewAnimationType) {
        let myPopupViewController:SelectAccountAlertViewController = SelectAccountAlertViewController(nibName:"SelectAccountAlertViewController", bundle: nil)
//        myPopupViewController.delegate = self
        self.presentpopupViewController(myPopupViewController, animationType: animationType, completion: { () -> Void in
        
        })
    }
    
    
   
    
    @IBAction func categoryTypeButtonAction(sender: AnyObject)
    {
        
        self.displayViewController(.BottomTop)
         print(Appconstant.btnName)
        
       
//        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewControllerWithIdentifier("popOver") 
//        vc.modalPresentationStyle = UIModalPresentationStyle.Popover
//        let popover: UIPopoverPresentationController = vc.popoverPresentationController!
////        popover.barButtonItem = sender as! UIBarButtonItem
//        presentViewController(vc, animated: true, completion:nil)
        
        
//        let alertController = UIAlertController()
//        let actionTitle = UIAlertAction(title:"Select Account Type", style: .Default) { (action) -> Void in
//            self.categoryNameTextField.hidden = true
//            self.categoryTypeBtn.setTitle("   Individual", forState: .Normal)
//            self.bottomView.frame.origin.y = self.selectAccountTypeButton.frame.origin.y + self.selectAccountTypeButton.frame.size.height+80
//            
//        }
//        
//        // Initialize Actions
//        let action = UIAlertAction(title: categoryType[0] as String, style:.Default) { (action) -> Void in
//    
//            self.categoryNameTextField.hidden = true
//            self.categoryTypeBtn.setTitle("   Individual", forState: .Normal)
//            self.bottomView.frame.origin.y = self.selectAccountTypeButton.frame.origin.y + self.selectAccountTypeButton.frame.size.height+80
//           
//            
//        }
//        
//        let action1 = UIAlertAction(title: categoryType[1] as String, style: .Default) { (action) -> Void in
//            self.categoryNameTextField.hidden = false
//            self.categoryTypeBtn.setTitle("   Employee", forState: .Normal)
//            self.categoryNameTextField.placeholder = "Company Name"
//            self.bottomView.frame.origin.y = self.selectAccountTypeButton.frame.origin.y + self.selectAccountTypeButton.frame.size.height+110
//        }
//        let action2 = UIAlertAction(title: categoryType[2] as String, style: .Default) { (action) -> Void in
//            self.categoryNameTextField.hidden = false
//            self.categoryTypeBtn.setTitle("   Company", forState: .Normal)
//            self.categoryNameTextField.placeholder = "Company Name"
//            self.bottomView.frame.origin.y = self.selectAccountTypeButton.frame.origin.y + self.selectAccountTypeButton.frame.size.height+110
//        }
//        let action3 = UIAlertAction(title: categoryType[3] as String, style: .Default) { (action) -> Void in
//            self.categoryNameTextField.hidden = false
//            self.categoryTypeBtn.setTitle("   Non-Profit Organisation", forState: .Normal)
//            self.categoryNameTextField.placeholder = "Non-Profit Organisation"
//            self.bottomView.frame.origin.y = self.selectAccountTypeButton.frame.origin.y + self.selectAccountTypeButton.frame.size.height+110
//        }
//        let action4 = UIAlertAction(title: categoryType[4] as String, style: .Default) { (action) -> Void in
//            self.categoryTypeBtn.setTitle("   Non-Profit Organisation Employee", forState: .Normal)
//            self.categoryNameTextField.placeholder = "Non-Profit Organisation Employee"
//            self.categoryNameTextField.hidden = false
//            self.bottomView.frame.origin.y = self.selectAccountTypeButton.frame.origin.y + self.selectAccountTypeButton.frame.size.height+110
//        }
//        // Add Actions
//        let image = UIImage(named: "icon_password.png")
//        action.setValue(image, forKey: "image")
//        
//        alertController.addAction(actionTitle)
//        alertController.addAction(action)
//        alertController.addAction(action1)
//        alertController.addAction(action2)
//        alertController.addAction(action3)
//        alertController.addAction(action4)
//        
////        let paragraphStyle = NSMutableParagraphStyle()
////        paragraphStyle.alignment = NSTextAlignment.Left
////        
////        let messageText = NSMutableAttributedString(
////            string: kTermsAndConditions,
////            attributes: [
////                NSParagraphStyleAttributeName: paragraphStyle,
////                NSFontAttributeName: UIFont.systemFontOfSize(13.0)
////            ]
//////        )
////        
////        alertController.setValue(messageText, forKey: "attributedMessage")
//        alertController.view.backgroundColor = UIColor.blueColor()
//        // Present Alert Controller
//        self.presentViewController(alertController, animated: true, completion: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


    @IBAction func signUpButtonAction(sender: AnyObject) {
        
            let username: String = self.userNameTextField.text!
            let emailid: String = self.emailTextField.text!
            let mobilenumber: String = self.phoneTextField.text!
            let password: String = self.passwordTextField.text!
            let confirmpassword: String = self.confirmPwdTextField.text!
            if(username.isEmpty || emailid.isEmpty || mobilenumber.isEmpty || password.isEmpty || confirmpassword.isEmpty) {
                self.presentViewController(Alert().alert("Warning", message: "Don't leave empty space"),animated: true,completion: nil)
            }
            else if(password != confirmpassword) {
                self.presentViewController(Alert().alert("Warning", message: "Enter correct password"),animated: true,completion: nil)
            }
            else if(selectAccountTypeButton.titleLabel?.text == "   Select Account Type") {
                self.presentViewController(Alert().alert("Warning", message: "Choose your Account Type"),animated: true,completion: nil)
        }
//            else
//            {
//                
//            }

            else {
                
                if (sumUpCheck == true)
                {
                //init?( Username : String, Password : String, ConfirmPassword : String, email : String, PhoneNumber : String, CPPAccountType: String,IsCompany:Bool,IsEmployee : Bool, IsIndividual : Bool, ISCharity : Bool, IsCharityEmployee: Bool, UserDeviceID : String, stripeCode : String)
                
                let signupViewmodel = Signupviewmodel.init(Username: self.userNameTextField.text!, Password: self.passwordTextField.text!, ConfirmPassword: self.confirmPwdTextField.text!, email: self.emailTextField.text! , PhoneNumber: self.phoneTextField.text!,CPPAccountType: "Stripe",IsCompany: false,IsEmployee : false, IsIndividual : false, ISCharity : false, IsCharityEmployee: false, UserDeviceID : "", stripeCode : "")!
                let serializedjson  = JSONSerializer.toJson(signupViewmodel)
                print(serializedjson)
                    
                    self.performSegueWithIdentifier("goto_Homepage", sender: self)
                    let homeVc:PayableHomePageViewController = PayableHomePageViewController ()
                    self.presentViewController(homeVc, animated: true, completion: nil)
                    
                }
                
                else
                {
                    if categoryTypeBtn.titleLabel?.text == "   Select Account Type"
                    {
                        self.presentViewController(Alert().alert("Warning", message: "Choose your Category Type"),animated: true,completion: nil)
                    }
                    else if categoryTypeBtn.titleLabel?.text != "   Individual"
                    {
                        if (self.categoryNameTextField.text == "")
                            
                        {
                            self.presentViewController(Alert().alert("Warning", message: "Enter Company Name"),animated: true,completion: nil)
                        }
                        else
                        {
                            let signupViewmodel = Signupviewmodel.init(Username: self.userNameTextField.text!, Password: self.passwordTextField.text!, ConfirmPassword: self.confirmPwdTextField.text!, email: self.emailTextField.text! , PhoneNumber: self.phoneTextField.text!,CPPAccountType: "Stripe",IsCompany: false,IsEmployee : false, IsIndividual : true, ISCharity : false, IsCharityEmployee: false, UserDeviceID : "", stripeCode : "")!
                            let serializedjson  = JSONSerializer.toJson(signupViewmodel)
                            print(serializedjson)
                            
                            self.performSegueWithIdentifier("goto_Stripe", sender: self)
//                            let stripeVc = StripeSigninViewController()
//                            self.presentViewController(stripeVc, animated: true, completion: nil)
                            
                        }
                        
                    }
                    else
                    {
                        let signupViewmodel = Signupviewmodel.init(Username: self.userNameTextField.text!, Password: self.passwordTextField.text!, ConfirmPassword: self.confirmPwdTextField.text!, email: self.emailTextField.text! , PhoneNumber: self.phoneTextField.text!,CPPAccountType: "Stripe",IsCompany: false,IsEmployee : false, IsIndividual : true, ISCharity : false, IsCharityEmployee: false, UserDeviceID : "", stripeCode : "")!
                        let serializedjson  = JSONSerializer.toJson(signupViewmodel)
                        print(serializedjson)
                        
                        self.performSegueWithIdentifier("goto_Stripe", sender: self)
//                        let stripeVc = StripeSigninViewController()
//                        self.presentViewController(stripeVc, animated: true, completion: nil)
                    }
                }
                
                
                //                sendrequesttoserver(Appconstant.WEB_API+Appconstant.SIGNUP_URL, value: serializedjson)
            }
        
    }
    
    
   /* func sendrequesttoserver(url : String,value : String)
    {
        let username = "rajagcs08@gmail.com"
        let password = "1234"
        let loginString = NSString(format: "%@:%@", username, password)
        let loginData: NSData = loginString.dataUsingEncoding(NSUTF8StringEncoding)!
        let base64LoginString = "Basic "+loginData.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.Encoding64CharacterLineLength)
        //    let events = EventManager();
        //let request = NSMutableURLRequest(URL: NSURL(string: "https://ttltracker.azurewebsites.net/task/getallwalllist")!)
        
        
       // "rawModeData": "{\n\"Username\":\"cppdineshindividual\",\n\"Password\":\"Cpp@2593\",\n\"ConfirmPassword\":\"Cpp@2593\",\n\"email\":\"dineshkumar02051993@gmail.com\",\n\"PhoneNumber\":\"9551702150\",\n\"CPPAccountType\":\"Bank\",\n\"IsCompany\":false,\n\"IsEmployee\":false,\n\"IsIndividual\":true,\n\"ISCharity\":false,\n\"IsCharityEmployee\":false,\n\"UserDeviceID\":\"GCMID for notification\",\n\"stripeCode\":\"Code from stripe after stripe signup from webview\"\n\n}
        
        
        let request = NSMutableURLRequest(URL: NSURL(string: url)!)
        request.HTTPMethod = "Post"
        // set Content-Type in HTTP header
        
        //         NSURLProtocol.setProperty("application/json", forKey: "Content-Type", inRequest: request)
        //        NSURLProtocol.setProperty(base64LoginString, forKey: "Authorization", inRequest: request)
        //        NSURLProtocol.setProperty(AppConstants.TENANT, forKey: "TENANT", inRequest: request)
        //
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(base64LoginString, forHTTPHeaderField: "Authorization")
        request.addValue(Appconstant.TENANT, forHTTPHeaderField: "TENANT")
        
        //    let postString `= "Username="+self.txtUsername.text!+"&Password="+self.txtPassword.text!
        request.HTTPBody = value.dataUsingEncoding(NSUTF8StringEncoding)
        
        
        
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
                print("responseString = \(responseString)")
                let json = JSON(data: data!)
                var item = json["result"]
                if(item["ID"].intValue < 0){
                    dispatch_async(dispatch_get_main_queue()) {
                        self.presentViewController(Alert().alert("Alert", message: "Signup failed..."),animated: true,completion: nil)
                        self.txtname.text = ""
                        self.txtemail.text = ""
                        self.txtmobileno.text = ""
                        self.txtpwd.text = ""
                        self.txtconfirmpwd.text = ""
                    }
                    
                    
                }
                    
                else{
                    DBHelper().opensupermarketDB()
                    let databaseURL = NSURL(fileURLWithPath:NSTemporaryDirectory()).URLByAppendingPathComponent("supermarket.db")
                    let databasePath = databaseURL.absoluteString
                    let supermarketDB = FMDatabase(path: databasePath as String)
                    
                    if supermarketDB.open() {
                        
                        let insertSQL = "INSERT INTO SIGNUP (NAME,EMAILID,MOBILENUMBER,PASSWORD,CONFIRMPASSWORD) VALUES ('\(self.txtname.text!)','\(self.txtemail.text!)','\(self.txtmobileno.text!)','\(self.txtpwd.text!)','\(self.txtconfirmpwd.text!)' )"
                        
                        let result = supermarketDB.executeUpdate(insertSQL,
                            withArgumentsInArray: nil)
                        if !result {
                            //   status.text = "Failed to add contact"
                            print("Error: \(supermarketDB.lastErrorMessage())")
                        }
                        //                    self.addressdatabasecall()
                        //                    self.performSegueWithIdentifier("goto_homepage", sender: self)
                    }
                    supermarketDB.close()
                    
                    if supermarketDB.open() {
                        
                        let insertSQL = "INSERT INTO LOGIN (USERID,NAME,EMAILID,PASSWORD,PHONENUMBER) VALUES ('\(item["ID"].stringValue)','\(item["Name"].stringValue)','\(self.txtemail.text!)','\(self.txtpwd.text!)','\(self.txtmobileno.text!)')"
                        
                        let result = supermarketDB.executeUpdate(insertSQL,
                            withArgumentsInArray: nil)
                        if !result {
                            //   status.text = "Failed to add contact"
                            print("Error: \(supermarketDB.lastErrorMessage())")
                        }
                        //                    self.performSegueWithIdentifier("goto_homepage", sender: self)
                    }
                }
                dispatch_async(dispatch_get_main_queue()) {
                    self.performSegueWithIdentifier("goto_homepage", sender: self)
                }
        }
        
        task.resume()
        
    }
    
    */
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
