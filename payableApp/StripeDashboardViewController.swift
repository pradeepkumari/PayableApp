//
//  StripeDashboardViewController.swift
//  payableApp
//
//  Created by apple on 19/09/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class StripeDashboardViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    var result: Bool!
    var BitcoinEnabled = true
    
//    var userid = ""
    //Checking
    var userid = "8282"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL (string: "https://dashboard.stripe.com/")
        let requestObj = NSURLRequest(URL: url!);
                webView.loadRequest(requestObj)
        
       
//                AppUtils.LoggedInUser.BitcoinEnabled = true;
        if BitcoinEnabled
        {
                CallServiceToUpdateBitCoinStatus();
        }
        // Do any additional setup after loading the view.
    }
    
    func CallServiceToUpdateBitCoinStatus()
    {
        let userAccountModel = UserAccountModel.init(UserId: self.userid)
        let serializedjson  = JSONSerializer.toJson(userAccountModel!)
        print(serializedjson)
        
        
        let request = NSMutableURLRequest(URL: NSURL(string: Appconstant.WEB_API + Appconstant.UpdateBitcoinEnableStatus)!)
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
                        self.presentViewController(Alert().alert("Title", message: "Unable to enable the bitcoin. Please Try Again Later."),animated: true,completion: nil)
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
                        self.presentViewController(Alert().alert("Title", message: "Success!Now you can proceed with your bitcoin transactions"),animated: true,completion: nil)
                        
                    }
                })
        }
        task.resume()
 
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

    
    @IBAction func homeBarButton(sender: AnyObject) {
        self.performSegueWithIdentifier("goto_Homepage", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
