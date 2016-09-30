//
//  EmployeeViewController.swift
//  payableApp
//
//  Created by apple on 21/09/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class EmployeeViewController: UIViewController {
   

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    var userid = "8282"
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var Username = [String]()
    var Email = [String]()
    var PhoneNumber = [String]()
    var CardTransactionCount = [String]()
    var BitcoinTransactionCount = [String]()
    var CardTotalTransactionAmount = [String]()
    var BitcoinTotalTransactionAmount = [String]()
    
   
    
    var Username1 = [String]()
    var Email1 = [String]()
    var PhoneNumber1 = [String]()
    var CardTransactionCount1 = [String]()
    var BitcoinTransactionCount1 = [String]()
    var CardTotalTransactionAmount1 = [String]()
    var BitcoinTotalTransactionAmount1 = [String]()
    
    
    var isActive: Bool = true
    var isInactive: Bool = false
    var isBlocked: Bool = false
    
    var blockCount = 0
    var unblockCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getuserdetails()
        self.getEmployeeListDetails()
        // Do any additional setup after loading the view.
    }

    @IBAction func indexBtn(sender: AnyObject) {
        
        switch segmentControl.selectedSegmentIndex {
        case 0:
            isActive = true
            isBlocked = false
            tableView.reloadData()
        case 1:
            
            isInactive = true
            
        case 2:
            isBlocked = true
            isActive = false
            
            tableView.reloadData()
            
        default:
            break;
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
                self.userid = "\(results.intForColumn("USERID"))"
                
                print(userid)
               
                print( (results.intForColumn("USERID")))
            }
            supermarketDB.close()
        } else {
            
        }
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func homeBtnAction(sender: AnyObject) {
        self.performSegueWithIdentifier("goto_Homepage", sender: self)
    }
    
    @IBAction func blockBtnAction(sender: AnyObject) {
        if isBlocked
        {
            let point = sender.convertPoint(CGPointZero, toView: tableView)
            let indexPath = self.tableView.indexPathForRowAtPoint(point)!
            print(indexPath)
            Username1[indexPath.row].removeAll()
            Email1[indexPath.row].removeAll()
            PhoneNumber1[indexPath.row].removeAll()
            CardTransactionCount1[indexPath.row].removeAll()
            BitcoinTransactionCount1[indexPath.row].removeAll()
            CardTotalTransactionAmount1[indexPath.row].removeAll()
            BitcoinTotalTransactionAmount1[indexPath.row].removeAll()
            tableView.reloadData()
        }
        else
        {
            let point = sender.convertPoint(CGPointZero, toView: tableView)
            let indexPath = self.tableView.indexPathForRowAtPoint(point)!
            print(indexPath)
            
            Username1.append(Username[indexPath.row])
            Email1.append(Email[indexPath.row])
            PhoneNumber1.append(PhoneNumber[indexPath.row])
            CardTransactionCount1.append(CardTransactionCount[indexPath.row])
            BitcoinTransactionCount1.append(BitcoinTransactionCount[indexPath.row])
            CardTotalTransactionAmount1.append(CardTotalTransactionAmount[indexPath.row])
            BitcoinTotalTransactionAmount1.append(BitcoinTotalTransactionAmount[indexPath.row])
            
            blockCount = blockCount+1
            
            
            
            for var i = indexPath.row; i<unblockCount-1; i++
            {
                print(i)
                print(unblockCount)
                Username[i] = Username[i+1]
                Email[i] = Email[i+1]
                PhoneNumber[i] = PhoneNumber[i+1]
                CardTransactionCount[i] = CardTransactionCount[i+1]
                BitcoinTransactionCount[i] = BitcoinTransactionCount[i+1]
                CardTotalTransactionAmount[i] = CardTotalTransactionAmount[i+1]
                BitcoinTotalTransactionAmount[i] = BitcoinTotalTransactionAmount[i+1]
            }
            
            
            unblockCount = unblockCount - 1
            
            tableView.reloadData()
            
            print(self.Username)
            print(self.Email)
            print(self.PhoneNumber)
            print(self.CardTransactionCount)
            print(self.BitcoinTransactionCount)
            print(self.CardTotalTransactionAmount)
            print(self.BitcoinTotalTransactionAmount)
        }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let employeeCell = tableView.dequeueReusableCellWithIdentifier("employeeCell", forIndexPath: indexPath) as UITableViewCell!
        if indexPath.row == 0
        {
            employeeCell.viewWithTag(10)?.hidden = true
        }
        
        
        let usernameLabel = employeeCell.viewWithTag(1) as! UILabel
        let emailLabel = employeeCell.viewWithTag(2) as! UILabel
        let phonenumberLabel = employeeCell.viewWithTag(3) as! UILabel
        let cardCountLabel = employeeCell.viewWithTag(4) as! UILabel
        let bitcoinCountLabel = employeeCell.viewWithTag(5) as! UILabel
        let cardTotalAmountLabel = employeeCell.viewWithTag(6) as! UILabel
        let bitcoinTotalAmountLabel = employeeCell.viewWithTag(7) as! UILabel
        let blockButton = employeeCell.viewWithTag(8) as! UIButton
        if (isBlocked)
        {
            usernameLabel.text = Username1[indexPath.row]
            emailLabel.text = Email1[indexPath.row]
            phonenumberLabel.text = PhoneNumber1[indexPath.row]
            cardCountLabel.text = CardTransactionCount1[indexPath.row]
            bitcoinCountLabel.text = BitcoinTransactionCount1[indexPath.row]
            cardTotalAmountLabel.text = CardTotalTransactionAmount1[indexPath.row]
            bitcoinTotalAmountLabel.text = BitcoinTotalTransactionAmount1[indexPath.row]
            blockButton.titleLabel?.text = "BLOCK"
            
        }
        else
        {
            
            usernameLabel.text = Username[indexPath.row]
            emailLabel.text = Email[indexPath.row]
            phonenumberLabel.text = PhoneNumber[indexPath.row]
            cardCountLabel.text = CardTransactionCount[indexPath.row]
            bitcoinCountLabel.text = BitcoinTransactionCount[indexPath.row]
            cardTotalAmountLabel.text = CardTotalTransactionAmount[indexPath.row]
            bitcoinTotalAmountLabel.text = BitcoinTotalTransactionAmount[indexPath.row]
            blockButton.titleLabel?.text = "UNBLOCK"
            
            
            
            
        }
        
        
        return employeeCell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (isBlocked)
        {
            print(blockCount)
            return blockCount
        }
        else
        {
            print(unblockCount)
           return unblockCount
            
        }
        
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
    }

    
    func getEmployeeListDetails(){
        
//        let username = self.username1
//        let password = self.password1
//        let loginString = NSString(format: "%@:%@", username, password)
//        let loginData: NSData = loginString.dataUsingEncoding(NSUTF8StringEncoding)!
//        let base64LoginString = "Basic "+loginData.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.Encoding64CharacterLineLength)
        
        let fetchEmployeeListModel = FetchEmployeeListModel.init(compID : self.userid)
        
        let serializedjson  = JSONSerializer.toJson(fetchEmployeeListModel!)
        print(serializedjson)
        
//        let result:NSString = serializedjson.stringByTrimmingCharactersInSet(NSCharacterSet.init(charactersInString: "la t, \n \" ':"))
//                        print(result)
        self.activityIndicator.startAnimating()
        
        let request = NSMutableURLRequest(URL: NSURL(string: Appconstant.WEB_API + Appconstant.getCompanyEmployeeList)!)
        request.HTTPMethod = "Post"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.HTTPBody = serializedjson.dataUsingEncoding(NSUTF8StringEncoding)
        print(request)
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
                
                print(json)
                for item in json.arrayValue
                {
                    print(item)
                    
                    if item["IsBlocked"] == true
                    {
                        self.Username1.append(item["Username"].stringValue)
                        self.Email1.append(item["Email"].stringValue)
                        self.PhoneNumber1.append(item["PhoneNumber"].stringValue)
                        self.CardTransactionCount1.append(item["CardTransactionCount"].stringValue)
                        self.BitcoinTransactionCount1.append(item["BitcoinTransactionCount"].stringValue)
                        self.CardTotalTransactionAmount1.append(item["CardTotalTransactionAmount"].stringValue)
                        self.BitcoinTotalTransactionAmount1.append(item["BitcoinTotalTransactionAmount"].stringValue)
                            self.blockCount = self.blockCount+1
                    }
                    else
                    {
                        self.Username.append(item["Username"].stringValue)
                        self.Email.append(item["Email"].stringValue)
                        self.PhoneNumber.append(item["PhoneNumber"].stringValue)
                        self.CardTransactionCount.append(item["CardTransactionCount"].stringValue)
                        self.BitcoinTransactionCount.append(item["BitcoinTransactionCount"].stringValue)
                        self.CardTotalTransactionAmount.append(item["CardTotalTransactionAmount"].stringValue)
                        self.BitcoinTotalTransactionAmount.append(item["BitcoinTotalTransactionAmount"].stringValue)
                        self.unblockCount = self.unblockCount+1
                    }
                }
                print(self.Username)
                print(self.Email)
                print(self.PhoneNumber)
                print(self.CardTransactionCount)
                print(self.BitcoinTransactionCount)
                print(self.CardTotalTransactionAmount)
                print(self.BitcoinTotalTransactionAmount)
                
                dispatch_async(dispatch_get_main_queue()) {
                    self.tableView.reloadData()
                }
                self.activityIndicator.stopAnimating()
                
               
        }
        task.resume()
        print(task)
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
