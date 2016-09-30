//
//  HistoryViewController.swift
//  payableApp
//
//  Created by apple on 19/09/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var TotalTransLabel1: UILabel!
    @IBOutlet weak var totalTransLabel2: UILabel!
    @IBOutlet weak var TransactionCountTextfield: UITextField!
    @IBOutlet weak var transactionAmountTextfield: UITextField!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    var isSelected:Bool = false
    
    var selectedIndex = -1
    
//    var username:String = ""
//    var password:String = ""
    
    //FOR CHECK
    var username:String = "jack777"
    var password:String = "weenggs"

    
    
    var checkdata: NSMutableData = NSMutableData()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.getuserdetails()
        loadCardHistory()
        self.getHistoryDetails()
//        self.segmentControl.tintColor = UIColor.whiteColor()
//        self.segmentControl.layer.cornerRadius = 50.0
//        
//        segmentControl.subviews[1].backgroundColor = UIColor.whiteColor()
        // Do any additional setup after loading the view.
    }

    func getHistoryDetails()
    {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func homeButtonAction(sender: AnyObject) {
        self.performSegueWithIdentifier("goto_Homepage", sender: self)
    }
   

    @IBAction func indexBtn(sender: AnyObject) {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            
            self.loadCardHistory()
            
        case 1:
        
            self.loadBitcoinHistory()
            
        default:
            break;
        }
  
        
    }
   
    
    func connection(didReceiveResponse: NSURLConnection!, didReceiveResponse response: NSURLResponse!) {
        // Received a new request, clear out the data object
        self.checkdata = NSMutableData()
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!) {
        // Append the received chunk of data to our data object
        self.checkdata.appendData(data)
    }
    
    
        

    
    
    func loadCardHistory()
    {
        let merchantLoginViewModel = MerchantLoginViewModel.init(Username : username, Password : password)
        
        let serializedjson  = JSONSerializer.toJson(merchantLoginViewModel!)
        print(serializedjson)
        
        
        let request = NSMutableURLRequest(URL: NSURL(string: Appconstant.WEB_API + Appconstant.API_GetHistory)!)
        request.HTTPMethod = "Post"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.HTTPBody = serializedjson.dataUsingEncoding(NSUTF8StringEncoding)
        activityIndicator.startAnimating()
        
        
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
                
                
                
                let json = JSON(data: data!)
                
                print("**JSON**")
                print(json)
                print(json.arrayValue)
                print("**JSONArray**")
                print(json[0])
                for item in json.arrayValue
                {
                    print(item)
                print(item["Amount"].stringValue)
                print(item["Time"].stringValue)
                }
                
                
                dispatch_async(dispatch_get_main_queue(), {
                    if responseString == "\"-2\""
                    {
                        self.presentViewController(Alert().alert("Title", message: "Invalid Username/Password"),animated: true,completion: nil)
                        
                    }
                    else if responseString! == ""
                    {
                        self.presentViewController(Alert().alert("Title", message: "Please Check your Internet connection"),animated: true,completion: nil)
                    }
                    else
                    {
                        
                        
                        
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
                                    
                                }
                            }
                            
                            
                        }
                        
                    }
                    self.activityIndicator.stopAnimating()
                })
               
        }
        
        task.resume()
    }
    
    func loadBitcoinHistory()
    {
        
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let acell:HistoryTableViewCell = tableView.dequeueReusableCellWithIdentifier("historyCell", forIndexPath: indexPath) as! HistoryTableViewCell
        
        
        if(indexPath.row == selectedIndex )
        {
            if isSelected
            {
                acell.topView.hidden = true
                acell.bottomView.hidden = false
            }
            else
            {
                acell.bottomView.hidden = true
                acell.topView.hidden = false
            }
            
        }
        else
        {
            acell.bottomView.hidden = true
            acell.topView.hidden = false
        }
        return acell
        
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  5
    }
    
    //    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    //        return 110.0
    //    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath)
    {
        
        //        cell.contentView.backgroundColor = UIColor(red: 107/255.0, green: 178/255.0, blue: 227/255.0, alpha: 1.0)
        
        //        let whiteRoundedView : UIView = UIView(frame: CGRectMake(0, 10, self.view.frame.size.width, 90))
        //
        //        whiteRoundedView.layer.backgroundColor = CGColorCreate(CGColorSpaceCreateDeviceRGB(), [1.0, 1.0, 1.0, 1.0])
        //        whiteRoundedView.layer.masksToBounds = false
        //        whiteRoundedView.layer.cornerRadius = 2.0
        //        whiteRoundedView.layer.shadowOffset = CGSizeMake(-1, 1)
        //        whiteRoundedView.layer.shadowOpacity = 0.2
        //
        //        cell.contentView.addSubview(whiteRoundedView)
        //        cell.contentView.sendSubviewToBack(whiteRoundedView)
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedIndex = indexPath.row;
        if isSelected
        {
            isSelected = false
            self.tableView.reloadRowsAtIndexPaths([tableView.indexPathForSelectedRow!], withRowAnimation: .Fade)
        }
        else
        {
            isSelected = true
            self.tableView.reloadRowsAtIndexPaths([tableView.indexPathForSelectedRow!], withRowAnimation: .Fade)
        }
        // toggle cell full message height/default truncated height
        
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        //        if isSelected
        //        {
        if (indexPath.row == selectedIndex )
        {
            if isSelected
            {
               return 245.0
            }
            else
            {
               return 110.0
            }
            //                isSelected = false
        }
        else
        {
            return 110.0
        }
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
                
                self.username = results.stringForColumn("USERNAME")
                self.password = results.stringForColumn("PASSWORD")
              
                
                print(username)
                print(password)
                print(results.stringForColumn("USERNAME"))
                print(results.stringForColumn("PASSWORD"))
                
            }
            supermarketDB.close()
        } else {
            
        }
        
    }

    

}
