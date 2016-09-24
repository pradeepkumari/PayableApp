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
    
    
    var isCompany=false
    var isIndividual=false
    var isEmployee=false
    var isNonprofit=false
    var isNonprofitEmployee=false
    
    var companyNameModeArray:NSMutableArray!
    var ID:String = ""
    var finalId: String!
    var finalCharityId: String!
    var companyId: String!
    var companyCharityId: String!
    
    
    var isAlert:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
//        self.createBottomLineTextField(userNameTextField)
//        self.createBottomLineTextField(emailTextField)
//        self.createBottomLineTextField(passwordTextField)
//        self.createBottomLineTextField(confirmPwdTextField)
////        self.createBottomLineTextField(phoneTextField)
//        let idmodel = Idmodel.init(ID:self.ID)
//        let serializedjson  = JSONSerializer.toJson(idmodel)
//        getCompanyListFromServer(Appconstant.WEB_API+Appconstant.getCompanyList, value: serializedjson)
        
//        let response :String = [{"UserId":8278,"CompanyName":"Vertace Consultants"},{"UserId":8282,"CompanyName":"vertaceandroidcompany"},{"UserId":9290,"CompanyName":"Vertace iOS company "},{"UserId":9291,"CompanyName":"Vertace IOS Devleopment"},{"UserId":9294,"CompanyName":"BMG T Corp"}]
        
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
        self.isAlert = true
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
       
        if(isAlert)
        {
        
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
        else
        {
            self.performSegueWithIdentifier("goto_Login", sender: self)

        }
    }
    
    
    func displayViewController(animationType: SLpopupViewAnimationType) {
        let myPopupViewController:SelectAccountAlertViewController = SelectAccountAlertViewController(nibName:"SelectAccountAlertViewController", bundle: nil)
//        myPopupViewController.delegate = self
        self.presentpopupViewController(myPopupViewController, animationType: animationType, completion: { () -> Void in
        
        })
    }
    
    
   
    
    @IBAction func categoryTypeButtonAction(sender: AnyObject)
    {
        
//        self.displayViewController(.BottomTop)
         print(Appconstant.btnName)
        
       
//        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewControllerWithIdentifier("popOver") 
//        vc.modalPresentationStyle = UIModalPresentationStyle.Popover
//        let popover: UIPopoverPresentationController = vc.popoverPresentationController!
////        popover.barButtonItem = sender as! UIBarButtonItem
//        presentViewController(vc, animated: true, completion:nil)
        
        
        let alertController = UIAlertController()
        let actionTitle = UIAlertAction(title:"Select Account Type", style: .Default) { (action) -> Void in
            self.categoryNameTextField.hidden = true
            self.categoryTypeBtn.setTitle("Select Account Type", forState: .Normal)
            self.bottomView.frame.origin.y = self.selectAccountTypeButton.frame.origin.y + self.selectAccountTypeButton.frame.size.height+80
            
        }
        
        // Initialize Actions
        let action = UIAlertAction(title: categoryType[0] as String, style:.Default) { (action) -> Void in
    
            self.categoryNameTextField.hidden = true
            self.categoryTypeBtn.setTitle("Individual", forState: .Normal)
            self.bottomView.frame.origin.y = self.selectAccountTypeButton.frame.origin.y + self.selectAccountTypeButton.frame.size.height+80
           
            
        }
        
        let action1 = UIAlertAction(title: categoryType[1] as String, style: .Default) { (action) -> Void in
            self.categoryNameTextField.hidden = false
            self.categoryTypeBtn.setTitle("Employee", forState: .Normal)
            self.categoryNameTextField.placeholder = "Company Name"
            self.bottomView.frame.origin.y = self.selectAccountTypeButton.frame.origin.y + self.selectAccountTypeButton.frame.size.height+110
        }
        let action2 = UIAlertAction(title: categoryType[2] as String, style: .Default) { (action) -> Void in
            self.categoryNameTextField.hidden = false
            self.categoryTypeBtn.setTitle("Company", forState: .Normal)
            self.categoryNameTextField.placeholder = "Company Name"
            self.bottomView.frame.origin.y = self.selectAccountTypeButton.frame.origin.y + self.selectAccountTypeButton.frame.size.height+110
        }
        let action3 = UIAlertAction(title: categoryType[3] as String, style: .Default) { (action) -> Void in
            self.categoryNameTextField.hidden = false
            self.categoryTypeBtn.setTitle("Non-Profit Organisation", forState: .Normal)
            self.categoryNameTextField.placeholder = "Non-Profit Organisation"
            self.bottomView.frame.origin.y = self.selectAccountTypeButton.frame.origin.y + self.selectAccountTypeButton.frame.size.height+110
        }
        let action4 = UIAlertAction(title: categoryType[4] as String, style: .Default) { (action) -> Void in
            self.categoryTypeBtn.setTitle("Non-Profit Organisation Employee", forState: .Normal)
            self.categoryNameTextField.placeholder = "Non-Profit Organisation Employee"
            self.categoryNameTextField.hidden = false
            self.bottomView.frame.origin.y = self.selectAccountTypeButton.frame.origin.y + self.selectAccountTypeButton.frame.size.height+110
        }
        // Add Actions
        let image = UIImage(named: "ic_np_individual@2x.png.png")
        action.setValue(image, forKey: "image")
        let image1 = UIImage(named: "ic_np_company@2x.png.png")
        action1.setValue(image1, forKey: "image")
        let image2 = UIImage(named: "ic_np_employee@2x.png")
        action2.setValue(image2, forKey: "image")
        let image3 = UIImage(named: "ic_np_organization@2x.png")
        action3.setValue(image3, forKey: "image")
        let image4 = UIImage(named: "ic_np_organization_employee@2x.png")
        action4.setValue(image4, forKey: "image")
        
        
        alertController.addAction(actionTitle)
        alertController.addAction(action)
        alertController.addAction(action1)
        alertController.addAction(action2)
        alertController.addAction(action3)
        alertController.addAction(action4)

        self.presentViewController(alertController, animated: true, completion: nil)
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
            else if(selectAccountTypeButton.titleLabel?.text == "Select Account Type") {
                self.presentViewController(Alert().alert("Warning", message: "Choose your Account Type"),animated: true,completion: nil)
        }
          

            else {
                
                if (sumUpCheck == true)
                {
              
                    self.performSegueWithIdentifier("goto_Homepage", sender: self)
                    let homeVc:PayableHomePageViewController = PayableHomePageViewController ()
                    self.presentViewController(homeVc, animated: true, completion: nil)
                    
                }
                
                else
                {
                    if categoryTypeBtn.titleLabel?.text == "Select Account Type"
                    {
                        self.presentViewController(Alert().alert("Warning", message: "Choose your Category Type"),animated: true,completion: nil)
                    }
                    else if categoryTypeBtn.titleLabel?.text != "Individual"
                    {
                        if (self.categoryNameTextField.text == "")
                            
                        {
                            self.presentViewController(Alert().alert("Warning", message: "Enter Company Name"),animated: true,completion: nil)
                        }
                        else
                        {
                            print((categoryTypeBtn.titleLabel?.text)!)
                            
                            if (categoryTypeBtn.titleLabel?.text)!  == "Company"
                            {
                                isCompany=true;
                                isIndividual=false;
                                isEmployee=false;
                                isNonprofit=false;
                                isNonprofitEmployee=false;
                                
                                
                                
                            }
                            else if (categoryTypeBtn.titleLabel?.text)!  == "Employee"
                            {
                                
                                
                                
                                //Fetch Company ID
                                let idmodel = Idmodel.init(ID:self.ID)!
                                let serializedjson  = JSONSerializer.toJson(idmodel)
                                print(serializedjson)
                                
                                let request = NSMutableURLRequest(URL: NSURL(string: Appconstant.WEB_API+Appconstant.getCompanyList)!)
                                request.HTTPMethod = "Post"
                                print(serializedjson)
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
                                        print("responseString = \(responseString)")
                                        
                                        let json = JSON(data: data!)
                                        for item in json.arrayValue
                                        {
                                            let compName = item["CompanyName"].stringValue
                                            let btnTitle = "Vertace iOS company"
                                            print(compName)
                                            print(btnTitle)
                                            
                                            let data = compName.dataUsingEncoding(NSUTF8StringEncoding)
                                            let data1 = btnTitle.dataUsingEncoding(NSUTF8StringEncoding)
                                            
                                            if data!.isEqualToData(data1!)
                                            {
                                                print("equals")
                                            }
                                            
//                                            let isEqual = (compName == btnTitle)
//                                            if isEqual
//                                            {
//                                                print("equals")
//                                            }
//                                            if compName.isEqual(btnTitle)
//                                            {
//                                               print("not equal")
//                                            }
                                            else
                                            {
                                                self.finalId = "8282"
//                                                self.finalId = item["UserId"].stringValue
                                            }
                                            
                                        }
                                        
                                self.isCompany=false;
                                self.isIndividual=false;
                                self.isEmployee=true;
                                self.isNonprofit=false;
                                self.isNonprofitEmployee=false;
                                
                                
                                self.companyId = self.finalId
                                let signupViewmodel = Signupviewmodel.init( Username : self.userNameTextField.text!, Password : self.passwordTextField.text!, Email : self.emailTextField.text!, PhoneNumber :  self.phoneTextField.text!,CompanyID:self.finalId,UserDeviceID: "")!
                                let serializedjson1 = JSONSerializer.toJson(signupViewmodel)
                                print(serializedjson1)
                                        
                                 self.employeeSignUp(Appconstant.WEB_API+Appconstant.employeeSignup, value: serializedjson1)
                                       
                                }
                                task.resume()
                                
                            }
                            else if (categoryTypeBtn.titleLabel?.text)!  == "Non-Profit Organisation"
                            {
                                isCompany=false;
                                isIndividual=false;
                                isEmployee=false;
                                isNonprofit=true;
                                isNonprofitEmployee=false;
                                
                            }
                            else if (categoryTypeBtn.titleLabel?.text)! == "Non-Profit Organisation Employee"
                            {
                                
                                
                                let idmodel = Idmodel.init(ID:self.ID)
                                let serializedjson  = JSONSerializer.toJson(idmodel)
                                print(serializedjson)
//                                self.getCharityListFromServer(Appconstant.WEB_API+Appconstant.getCharityNameList, value: serializedjson)
//                                companyCharityId = self.finalCharityId
                                
                                
                                let request = NSMutableURLRequest(URL: NSURL(string: Appconstant.WEB_API+Appconstant.getCharityNameList)!)
                                request.HTTPMethod = "Post"
                                print(serializedjson)
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
                                        print("responseString = \(responseString)")
                                        
                                        let json = JSON(data: data!)
                                        for item in json.arrayValue
                                        {
                                            let compName: String = item["CharityName"].stringValue
                                            let btnTitle : String = (self.categoryNameTextField.text)!
                                            print(compName)
                                            print(btnTitle)
                                            if compName == btnTitle
                                            {
                                                self.finalCharityId = "10009"
                                                self.finalCharityId = item["UserId"].stringValue
                                            }
                                            
                                        }
                                        
                                        self.isCompany=false;
                                        self.isIndividual=false;
                                        self.isEmployee=false;
                                        self.isNonprofit=false;
                                        self.isNonprofitEmployee=true;
                                        
                                        
                                        let signupviewcharitymodel = Signupviewcharitymodel.init( Username : self.userNameTextField.text!, Password : self.passwordTextField.text!, Email : self.emailTextField.text!, PhoneNumber :  self.phoneTextField.text!,CharityCompanyID:self.companyCharityId,UserDeviceID: "")
                                        let serializedjson2 = JSONSerializer.toJson(signupviewcharitymodel)
                                        print(serializedjson2)
                                        self.charitySignUp(Appconstant.WEB_API+Appconstant.charityemployeeSignup, value: serializedjson2)
                                        
                                        
                                }
                                task.resume()
                                
                            }
                            
//                            self.performSegueWithIdentifier("goto_Stripe", sender: self)
                        }
                        
                    }
                    else
                    {
                        self.performSegueWithIdentifier("goto_Stripe", sender: self)
                    }
                }
                
            }
        
    }
    
    func employeeSignUp(url: String,value:String)
    {
        
        let request = NSMutableURLRequest(URL: NSURL(string: url)!)
        request.HTTPMethod = "Post"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
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
                dispatch_async(dispatch_get_main_queue(), {
                    if responseString! == "-2"
                    {
                        self.isAlert=false
                        let alert:UIAlertView = UIAlertView()
                        alert.delegate = self
                        alert.title = "Alert"
                        alert.message = "SignUp Sucess"
                        alert.addButtonWithTitle("Understod")
                        alert.show()
                        //
                    }

                })
                
//
    }
        task.resume()
    }
    
    func charitySignUp(url: String,value:String)
    {
        
        let request = NSMutableURLRequest(URL: NSURL(string: url)!)
        request.HTTPMethod = "Post"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
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
                dispatch_async(dispatch_get_main_queue(), {
                    if responseString! == "-2"
                    {
                        self.isAlert=false
                        let alert:UIAlertView = UIAlertView()
                        alert.delegate = self
                        alert.title = "Alert"
                        alert.message = "SignUp Sucess"
                        alert.addButtonWithTitle("Understod")
                        alert.show()
                        //
                    }
                    
                })
                
                //
        }
        task.resume()
    }

    
    
    
    
    
    
    func getCompanyListFromServer(url: String,value:String)
    {
        let request = NSMutableURLRequest(URL: NSURL(string: "https://cppstaging.azurewebsites.net/Employee/getCompanyList")!)
        request.HTTPMethod = "Post"
        print(value)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
     
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
               for item in json.arrayValue
               {
                let compName: String = item["CompanyName"].stringValue
                let btnTitle : String = (self.categoryNameTextField.text)!
                print(compName)
                print(btnTitle)
                let isEqual = (compName == compName)
                if isEqual
                {
                   self.finalId = item["UserId"].stringValue
                }

                }
                
                
                    
                }
        task.resume()
        
    }
    
    
    func getCharityListFromServer(url: String,value:String)
    {
        let request = NSMutableURLRequest(URL: NSURL(string: url)!)
        request.HTTPMethod = "Post"
        print(value)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
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
                for item in json.arrayValue
                {
                    let compName: String = item["CharityName"].stringValue
                    let btnTitle : String = (self.categoryNameTextField.text)!
                    print(compName)
                    print(btnTitle)
                    if compName == btnTitle
                    {
                        self.finalCharityId = item["UserId"].stringValue
                    }
                    
                }
                
                
                
        }
        task.resume()
        
    }
    
    
    
//    func getCompanyID()
//    {
//    var id=0;
//    for(CompanyNameModel com:companyNameModelArrayList)
//    {
//    if(com.CompanyName.equals(txtcomcharname))
//    {
//    id=com.UserId;
//    }
//    }
//    return  id;
//    }
//    
//    func getCharityID()
//    {
//    var id=0;
//    for(stripeconnectcharity com:charityList)
//    {
//    if(com.CharityName.equals(txtcomcharname))
//    {
//    id=com.UserID;
//    }
//    }
//    return  id;
//    }
//    
    
    
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
