//
//  AccountInfoViewController.swift
//  payableApp
//
//  Created by apple on 15/09/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class AccountInfoViewController: UIViewController, UITextViewDelegate {
    @IBOutlet weak var commentButton: UIButton!
    
    
    @IBOutlet weak var commentTextView: UITextView!
//    var email = ""
//    var phonenumber = ""
    var username: String = ""
    var password: String = ""
    var accountholdername: String = ""
    var accounttype: String = ""
    
    //IMPLICIT VALUE
    var userid = "8282"
    var phonenumber = "9500718227"
    var email = "dinesh@gmail.com"
    
    var btnTitle = ""
    var DateandTime = ""
    var DeviceLocation = ""
    var DeviceName = ""
   var updatedText = ""
    @IBAction func indexButton(sender: AnyObject) {
       
                switch mySegmentedControl.selectedSegmentIndex {
        case 0:
            self.updateInformationView.hidden = false
            self.changePasswordView.hidden = true
            self.supportView.hidden = true
            
        case 1:
            self.updateInformationView.hidden = true
            self.changePasswordView.hidden = false
            self.supportView.hidden = true
            
        case 2:
            self.updateInformationView.hidden = true
            self.changePasswordView.hidden = true
            self.supportView.hidden = false
            
        default:
            break;
        }

    }
    @IBOutlet weak var phonenumberTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var newPwd: UITextField!
    @IBOutlet weak var confirmPwd: UITextField!
    @IBOutlet weak var passwordKeyImage: UIImageView!
    @IBOutlet weak var changePasswordView: UIView!
    @IBOutlet weak var otherButton: UIButton!
    @IBOutlet weak var unableToScan: UIButton!
    @IBOutlet weak var supportView: UIView!
    @IBOutlet weak var updateInformationView: UIView!
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var blurImageView: UIImageView!
    @IBOutlet weak var mySegmentedControl: UISegmentedControl!
    var segmentsLabelName = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.getuserdetails()
       self.navigationController?.navigationBar.backgroundColor = UIColor(red: 107/255.0, green: 178/255.0, blue: 227/255.0, alpha: 1.0)
        
       self.mySegmentedControl.layer.cornerRadius = 45.0
//        self.mySegmentedControl.layer.masksToBounds = true
//        self.mySegmentedControl.tintColor = UIColor.whiteColor()
//
        self.updateInformationView.hidden = false
        self.changePasswordView.hidden = true
        self.supportView.hidden = true
        
        self.emailTextfield.text = email
        self.phonenumberTextfield.text = phonenumber
        
        commentTextView.delegate = self
        commentTextView.hidden = true
        commentTextView.text = "Enter your Comment"
        commentTextView.textColor = UIColor.lightGrayColor()
        
        // Do any additional setup after loading the view.
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        if textView.textColor == UIColor.lightGrayColor() {
            textView.text = nil
            textView.textColor = UIColor.blackColor()
        }
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Enter your Comment"
            textView.textColor = UIColor.lightGrayColor()
        }
    }
    
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        
        // Combine the textView text and the replacement text to
        // create the updated text string
         let currentText:NSString = textView.text
         updatedText = currentText.stringByReplacingCharactersInRange(range, withString:text)
        
        // If updated text view will be empty, add the placeholder
        // and set the cursor to the beginning of the text view
        if updatedText.isEmpty {
            
            textView.text = "Enter your Comment"
            textView.textColor = UIColor.lightGrayColor()
            
            textView.selectedTextRange = textView.textRangeFromPosition(textView.beginningOfDocument, toPosition: textView.beginningOfDocument)
            
            return false
        }
            
            // Else if the text view's placeholder is showing and the
            // length of the replacement string is greater than 0, clear
            // the text view and set its color to black to prepare for
            // the user's entry
        else if textView.textColor == UIColor.lightGrayColor() && !text.isEmpty {
            textView.text = nil
            textView.textColor = UIColor.blackColor()
        }
        
        return true
    }
    
   
    @IBAction func submitBtnAction(sender: AnyObject)
    {
        if commentTextView.text == "" || commentTextView.text == "Enter your Comment"
        {
            self.presentViewController(Alert().alert("Warning", message: "Please Provide your Comments"),animated: true,completion: nil)
            
        }
        else if btnTitle == ""
        {
            self.presentViewController(Alert().alert("Warning", message: "Please Select your reason"),animated: true,completion: nil)
        }
        else
        {
          merchantSupport()
        }
    }
    
    
    func merchantSupport()
    {
        let SupportRequestModel = supportRequestModel.init( UserID : self.userid, MerchantEmail : self.email, Phone : self.phonenumber, SupportMessage : self.updatedText,SupportStatus: btnTitle,DateandTime: self.DateandTime,DeviceLocation : self.DeviceLocation,DeviceName : self.DeviceName)
        let serializedjson  = JSONSerializer.toJson(SupportRequestModel!)
        print(serializedjson)
        
        
        let request = NSMutableURLRequest(URL: NSURL(string: Appconstant.WEB_API + Appconstant.SupportRequest)!)
        
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
                
                dispatch_async(dispatch_get_main_queue(), {
                    if responseString! == "1"
                    {
                        self.presentViewController(Alert().alert("Title", message: "Your request sent successfully.Please be patient while we are looking at your concern."),animated: true,completion: nil)
                        
                    }
                    else if responseString! == ""
                    {
                        self.presentViewController(Alert().alert("Title", message: "Please Check your Internet connection"),animated: true,completion: nil)
                    }
//                    else if responseString! == "-11"
//                    {
//                        self.presentViewController(Alert().alert("Title", message: "Duplicate User"),animated: true,completion: nil)
//                    }
//                    else if responseString! == "-12"
//                    {
//                        self.presentViewController(Alert().alert("Title", message: "Account Exists"),animated: true,completion: nil)
//                    }
                    else
                    {
                        self.presentViewController(Alert().alert("Title", message: "Your request sent successfully.Please be patient while we are looking at your concern."),animated: true,completion: nil)
                        
                    }
                })
        }
        task.resume()
        
        commentTextView.hidden = true
    }
    
    
    @IBAction func unableToScanCardBtn(sender: AnyObject) {
        self.btnTitle = (sender.titleLabel!!.text!)
    }
    
    @IBAction func otherBtn(sender: AnyObject) {
        self.btnTitle = (sender.titleLabel!!.text!)
        commentTextView.hidden = false
    }
    func createBottomLineTextField(textField:UITextField)
    {
        let bottomLine = CALayer()
        bottomLine.frame = CGRectMake(0.0, textField.frame.height - 1 , textField.frame.width, 1.0)
        bottomLine.backgroundColor = UIColor.blackColor().CGColor
        textField.borderStyle = UITextBorderStyle.None
        textField.layer.addSublayer(bottomLine)
    }
    
//    if(AppUtils.LoggedInUser!=null)
//    {
//    txtMerchantEmail.setText(AppUtils.LoggedInUser.EMail);
//    txtMerchantPhone.setText(AppUtils.LoggedInUser.PhoneNumber);
//    
//    }
    
    
    
    @IBAction func updateBtn(sender: AnyObject)
    {
        if emailTextfield.text == ""
        {
            self.presentViewController(Alert().alert("Warning", message: "Enter your Username"),animated: true,completion: nil)
        }
        else if phonenumberTextfield.text == ""
        {
           self.presentViewController(Alert().alert("Warning", message: "Enter your Password"),animated: true,completion: nil)
        }
        else
        {
            UpdateMerchantDetails();
        }
    }
    
    
    
    @IBAction func changePwdUpdateBtn(sender: AnyObject) {
        if newPwd.text == ""
        {
            
            self.presentViewController(Alert().alert("Warning", message: "Please provide password"),animated: true,completion: nil)
        }
        else if (confirmPwd.text  == "") {
            self.presentViewController(Alert().alert("Warning", message: "Please provide Confirm Password"),animated: true,completion: nil)
        } else if (newPwd.text != confirmPwd.text) {
           self.presentViewController(Alert().alert("Warning", message: "Password and Confirmation Password does not match"),animated: true,completion: nil)
        }
        //Network Connection Else if
        else {
            ChangePassword();
        }
    }
    
    func ChangePassword()
    {
        let changePasswordModel = ChangePasswordModel.init(Username: self.username, Password: self.password, newPassword: self.newPwd.text!)
        let serializedjson  = JSONSerializer.toJson(changePasswordModel!)
        print(serializedjson)
        
        
        let request = NSMutableURLRequest(URL: NSURL(string: Appconstant.WEB_API + Appconstant.changepwd)!)
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
                
                dispatch_async(dispatch_get_main_queue(), {
                    if responseString == "-2"
                    {
                        self.presentViewController(Alert().alert("Title", message: "Invalid Password"),animated: true,completion: nil)
                        
                    }
                    else if responseString! == ""
                    {
                        self.presentViewController(Alert().alert("Title", message: "Please Check your Internet connection"),animated: true,completion: nil)
                    }
                    else if responseString! == "-11"
                    {
                        self.presentViewController(Alert().alert("Title", message: "Duplicate User"),animated: true,completion: nil)
                    }
                    else if responseString! == "-12"
                    {
                        self.presentViewController(Alert().alert("Title", message: "Account Exists"),animated: true,completion: nil)
                    }
                    else
                    {
                        self.presentViewController(Alert().alert("Title", message: "Password updated successfully..!"),animated: true,completion: nil)
                        
                    }
                })
        }
        task.resume()
    }
    
    
    
   func UpdateMerchantDetails()
   {
        let accountModel = AccountModel.init(Username: self.username, Password: self.password, Email: self.email, PhoneNumber: self.phonenumber, AccountHolderName: self.accountholdername, AccountToken: self.accounttype)
        let serializedjson  = JSONSerializer.toJson(accountModel!)
        print(serializedjson)
    
    
    let request = NSMutableURLRequest(URL: NSURL(string: Appconstant.WEB_API + Appconstant.debitupdate)!)
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
            
            dispatch_async(dispatch_get_main_queue(), {
                if responseString == "-2"
                {
                    self.presentViewController(Alert().alert("Title", message: "Invalid Username/Password"),animated: true,completion: nil)
                    
                }
                else if responseString! == ""
                {
                    self.presentViewController(Alert().alert("Title", message: "Please Check your Internet connection"),animated: true,completion: nil)
                }
                else if responseString! == "-11"
                {
                    self.presentViewController(Alert().alert("Title", message: "Duplicate User"),animated: true,completion: nil)
                }
                else if responseString! == "-12"
                {
                    self.presentViewController(Alert().alert("Title", message: "Account Exists"),animated: true,completion: nil)
                }
                else
                {
                    self.presentViewController(Alert().alert("Title", message: "Details updated sucessfully..!"),animated: true,completion: nil)
    
                }
                })
    }
    task.resume()
    }
  
    
    override func viewWillAppear(animated: Bool) {
        self.createBottomLineTextField(newPwd)
        self.createBottomLineTextField(confirmPwd)
//        profilePicture.frame = CGRectMake(250, 250, 125, 125)
        self.profilePicture.layer.borderWidth = 1
        self.profilePicture.layer.masksToBounds = false
        self.profilePicture.layer.borderColor = UIColor.blueColor().CGColor
        self.profilePicture.layer.cornerRadius = profilePicture.frame.height/2
        self.profilePicture.clipsToBounds = true
//        blurImageView.addSubview(profilePicture)
        updateInformationView.addSubview(profilePicture)
        self.makeBlurImage(blurImageView)
        
        let date = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"//this your string date format
        dateFormatter.timeZone = NSTimeZone(name: "UTC")
//        let date = dateFormatter.dateFromString(date)
        
        
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"///this is you want to convert format
        dateFormatter.timeZone = NSTimeZone(name: "UTC")
        DateandTime = dateFormatter.stringFromDate(date)
        
        print(DateandTime)
        
        self.DeviceLocation = Appconstant.CurrentDevice
        self.DeviceName = Appconstant.CountryCode
        
        
//         segmentsLabelName = ["SUPPORT","CHANGE PASSWORD","UPDATE INFORMATION"]
//        for var k=0;k<3;k++
//        {
//            let text: NSString = segmentsLabelName[k];
//            print(text)
//            let label = UILabel()
//            label.frame = CGRectMake(10,2, (self.mySegmentedControl.frame.size.width/6), 40)
//            label.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
////            label.textColor = UIColor.whiteColor()
//            label.text = text as String
//            label.numberOfLines = 0
//            label.textAlignment = NSTextAlignment.Center
//            label.sizeToFit()
//            self.mySegmentedControl.subviews[k].addSubview(label)
//        }
//        
        
        
    }
    
    @IBAction func homeBtnAction(sender: AnyObject) {
        self.performSegueWithIdentifier("goto_Homepage", sender: self)
    }
    
    func makeBlurImage(targetImageView:UIImageView?)
    {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = targetImageView!.bounds
        
        blurEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight] // for supporting device rotation
        targetImageView?.addSubview(blurEffectView)
    }
    
    @IBAction func homeButtonAction(sender: AnyObject) {
        self.performSegueWithIdentifier("goto_Homepage", sender: self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    
    func getuserdetails(){
        DBHelper().opensupermarketDB()
        let databaseURL = NSURL(fileURLWithPath:NSTemporaryDirectory()).URLByAppendingPathComponent("PayableApp.db")
        let databasePath = databaseURL.absoluteString
        let supermarketDB = FMDatabase(path: databasePath as String)
        if supermarketDB.open() {
            
            let selectSQL = "SELECT * FROM LOGINTABLE2"
            
            let results:FMResultSet! = supermarketDB.executeQuery(selectSQL,
                withArgumentsInArray: nil)
            if ((results == nil))
            {
                
            }
            else{
                print("Error: \(supermarketDB.lastErrorMessage())")
//                self.phonenumber = results.stringForColumn("PHONENUMBER")
                self.email = results.stringForColumn("EMAIL")
                self.username = results.stringForColumn("USERNAME")
                self.password = results.stringForColumn("PASSWORD")
                self.accountholdername = results.stringForColumn("ACCOUNTHOLDERNAME")
                self.accounttype = results.stringForColumn("ACCOUNTTYPE")
                
                
                print(phonenumber)
                print(email)
                print(results.stringForColumn("PHONENUMBER"))
                print(results.stringForColumn("EMAIL"))
                
            }
            supermarketDB.close()
        } else {
            
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
