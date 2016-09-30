//
//  SettingsViewController.swift
//  payableApp
//
//  Created by apple on 16/09/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var businessLogoView: UIView!
    @IBOutlet weak var businessLogoImageView: UIImageView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var taxAndTipsView: UIView!
//    var newlogo:UIImage!
    @IBOutlet weak var taxTextfield: UITextField!
     let imagePicker = UIImagePickerController()
    
    //var userid:String = ""
    
    
    var isTipApplicable: String = ""
    var isTaxApplicable: String = ""
    var taxPercentage: String = ""
    
    
    var isTipclicked: Bool!
    var isTaxclicked: Bool!
    var columnId = 0
    //Checking
    
    var userid:String = "8282"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.getuserdetails()
        
        self.getTaxTipValues()
        
        
        imagePicker.delegate = self
        self.businessLogoView.hidden = false
        self.taxAndTipsView.hidden = true
        // Do any additional setup after loading the view.
    }
    
    func getTaxTipValues()
    {
        DBHelper().opensupermarketDB()
        let databaseURL = NSURL(fileURLWithPath:NSTemporaryDirectory()).URLByAppendingPathComponent("PayableApp.db")
        let databasePath = databaseURL.absoluteString
        let supermarketDB = FMDatabase(path: databasePath as String)
        if supermarketDB.open() {
            
            let selectSQL = "SELECT * FROM TAXANDTIPSSETTINGS"
            
            let results:FMResultSet! = supermarketDB.executeQuery(selectSQL,
                withArgumentsInArray: nil)
            if ((results.columnCount() == 0))
            {
//                return TaxTipSettingsUpdateModel
            }
            else
            {
                print("Error: \(supermarketDB.lastErrorMessage())")
                //                self.phonenumber = results.stringForColumn("PHONENUMBER")
                
//                 TaxTipSettingsUpdateModel.setIsTaxApplicable(results.boolForColumn("ISTIPAPPLICABLE"))
                
                self.isTipApplicable = results.stringForColumn("ISTIPAPPLICABLE")
                self.isTaxApplicable = results.stringForColumn("ISTAXAPPLICABLE")
                self.taxPercentage = results.stringForColumn("TAXPERCENTAGE")
                
                print(results.stringForColumn("ISTIPAPPLICABLE"))
//                
//                let taxTipSettingsUpdateModel = TaxTipSettingsUpdateModel.init( IsTaxApplicable : self.isTipApplicable, IsTipApplicable : self.isTaxApplicable, taxPercentage : taxPercentage, )
            
                
            }
            supermarketDB.close()
        } else {
            
        }
        
    
    }
    
    
    override func viewWillAppear(animated: Bool) {
        self.segmentedControl.layer.cornerRadius = 30.0
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func indexBtn(sender: AnyObject) {
        
            switch segmentedControl.selectedSegmentIndex {
            case 0:
                self.businessLogoView.hidden = false
                self.taxAndTipsView.hidden = true
//                segmentedControl.tintColor = UIColor.blueColor()
            
            case 1:
                self.businessLogoView.hidden = true
                self.taxAndTipsView.hidden = false
                taxTextfield.hidden = true
//               segmentedControl.tintColor = UIColor.blueColor()
             
                
            default:
                break;
            }
            
        }
    
    
    @IBAction func addTipBtnAction(sender: UISwitch) {
        
        if sender.on
        {
            self.isTipclicked = true
            updateTip()
        }
        else
        {
            self.isTipclicked = false
        }
        
    }
    
    @IBAction func addSalesTaxBtnAction(sender: UISwitch)
    {
        if sender.on
        {
            self.isTaxclicked = true
            taxTextfield.hidden = false
//          updateTax()
        }
        else
        {
            self.isTaxclicked = false
           taxTextfield.hidden = true
        }
    }
    
    
    func updateTip()
    {
//        let taxTipSettingsUpdateModel = TaxTipSettingsUpdateModel.init(IsTaxApplicable: isTaxclicked, IsTipApplicable: isTipclicked, taxPercentage: taxPercentage, ColumnID: self.columnId)
        
        DBHelper().opensupermarketDB()
        let databaseURL = NSURL(fileURLWithPath:NSTemporaryDirectory()).URLByAppendingPathComponent("PayableApp.db")
        let databasePath = databaseURL.absoluteString
        let supermarketDB = FMDatabase(path: databasePath as String)
        if supermarketDB.open() {
            
            
//            let insertSQL = "INSERT INTO TAXTIPSETTINGSTABLE (USERID,USERNAME,PASSWORD,EMAIL,PHONENUMBER,ACCOUNTHOLDERNAME,ACCOUNTTYPE) VALUES ('\(json["UserId"].stringValue)','\(json["Username"].stringValue)','\(json["password"].stringValue)','\(json["EMail"].stringValue)','\(json["PhoneNumber"].stringValue)','\(json["AccountHolderName"].stringValue)','\(json["AccountType"].stringValue)')"
        }
        
        print("update tip")
    }
    
    func updateTax()
    {
        print("update tax")
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
                
                self.userid = results.stringForColumn("USERID")
                
                
                print(userid)
                
                print(results.stringForColumn("USERID"))
                
            }
            supermarketDB.close()
        } else {
            
        }
        
    }

    
    
    @IBAction func homeButtonAction(sender: AnyObject) {
        self.performSegueWithIdentifier("goto_Homepage", sender: self)
    }

    @IBAction func updateButtonAction(sender: AnyObject) {
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
//        imagePicker.sourceType = .Camera
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            businessLogoImageView.contentMode = .ScaleAspectFit
            UpdateBusinessLogo(pickedImage);
//            businessLogoImageView.image = pickedImage
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
   
   
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func UpdateBusinessLogo(newlogo:UIImage)
    {
        
        let imageData:NSData = UIImagePNGRepresentation(newlogo)!
        let strBase64:String = imageData.base64EncodedStringWithOptions(.Encoding64CharacterLineLength)
    
        let businessLogoUploadModel = BusinessLogoUploadModel.init(tempBuffer: strBase64, UserID: self.userid)
        let serializedjson  = JSONSerializer.toJson(businessLogoUploadModel!)
        print(serializedjson)
        
        
        let request = NSMutableURLRequest(URL: NSURL(string: Appconstant.WEB_API + Appconstant.UploadMerchantLogo)!)
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
//                    if responseString == "-2"
//                    {
//                        self.presentViewController(Alert().alert("Title", message: "Invalid Password"),animated: true,completion: nil)
//                        
//                    }
                    if responseString! == ""
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
                        self.presentViewController(Alert().alert("Title", message: "Business Logo updated successfully..!"),animated: true,completion: nil)
                        
                    }
                })
        }
        task.resume()
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
