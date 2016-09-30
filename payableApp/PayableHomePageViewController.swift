//
//  PayableHomePageViewController.swift
//  payableApp
//
//  Created by apple on 14/09/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class PayableHomePageViewController: UIViewController,UITextViewDelegate {

    @IBOutlet weak var onlyNumberView: UIView!
  
   
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var numberPadView: UIView!
    @IBOutlet weak var menuBarView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var chargeAmountTextField: UITextField!
    var str = [String]()
    var userIsInTheMiddleOfTypingANumber = false
    
    
    var username1 = ""
    var password1 = ""
    var userid = ""
    
    var updatedText = ""
    var chargeValue: String = ""
    var chargeText : Double = 0.00
    var chargeAmountString : String = ""
   
    let view1 = UIView()
    let fadeButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chargeAmountTextField.text = "$0.00"
        descriptionTextView.delegate = self
        
        descriptionTextView.text = "Enter your Comment"
        descriptionTextView.textColor = UIColor.lightGrayColor()
//        self.getuserdetails()
        
       
//        let scrollView = UIScrollView(frame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height))
//        
//        self.view.addSubview(scrollView)
//        
//        let contentView = UIView(frame:CGRectMake(0, 0, scrollView.frame.size.width, self.view.frame.size.height))
//        contentView.backgroundColor = UIColor.blueColor()
//        
//        scrollView.addSubview(contentView)
//        
//        let chargeTextField = UITextField(frame:CGRectMake(8, 400, contentView.frame.size.width-20, 30))
//        contentView.addSubview(chargeTextField)
//        
//        let descriptionTextView = UITextView(frame:CGRectMake(10, 50, contentView.frame.size.width-230, 80))
//        contentView.addSubview(descriptionTextView)
//        
//        let numberPadView = UIView(frame:CGRectMake(30, 152, contentView.frame.size.width-60, 238))
//        numberPadView.backgroundColor = UIColor.brownColor()
//        contentView.addSubview(numberPadView)
//
////        menuBarView = UIView(frame:CGRectMake(10, 400, contentView.frame.size.width-18, 200))
////        contentView.addSubview(menuBarView)
////
        
    }
//    func textViewDidChange(descriptionField: UITextView) {
//        if descriptionField.text.isEmpty == false {
//            descriptionTextView.text = ""
//        } else {
//            descriptionTextView.text = "Description"
//        }
//    }
    
    
    func getuserdetails(){
        DBHelper().opensupermarketDB()
        let databaseURL = NSURL(fileURLWithPath:NSTemporaryDirectory()).URLByAppendingPathComponent("PayableApp.db")
        let databasePath = databaseURL.absoluteString
        let supermarketDB = FMDatabase(path: databasePath as String)
        if supermarketDB.open() {
            
            let selectSQL = "SELECT * FROM LOGINTABLE"
            
            let results:FMResultSet! = supermarketDB.executeQuery(selectSQL,
                withArgumentsInArray: nil)
            if ((results == nil))
            {
                
            }
            else{
                print("Error: \(supermarketDB.lastErrorMessage())")
                self.userid = "\(results.intForColumn("USERID"))"
                self.username1 = results.stringForColumn("USERNAME")
                self.password1 = results.stringForColumn("PASSWORD")
                print(username1)
                print(password1)
                print(userid)
                print(results.stringForColumn("USERNAME"))
                print(results.stringForColumn("PASSWORD"))
                print( (results.intForColumn("USERID")))
            }
            supermarketDB.close()
        } else {
            
        }
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        
        self.createBottomLineTextField(chargeAmountTextField)
        print(self.view.frame.size.width)
        
        
        let employeeViewButton = UIButton(frame: CGRectMake(5,5,(self.view.frame.size.width-20)/3-10,menuBarView.frame.size.height/2-12.5))
        print((menuBarView.frame.origin.x+5,5,(self.view.frame.size.width-20)/3-10,menuBarView.frame.size.height/2-12.5))
        employeeViewButton.setTitle("Employee", forState: .Normal)
//        employeeViewButton.tintColor = UIColor.whiteColor()
        employeeViewButton.backgroundColor = UIColor(red: 220/255.0, green: 98/255.0, blue: 94/255.0, alpha: 1.0)
        let employeeImage = UIImage(named: "ic_employee@2x.png")
        employeeViewButton.setImage(employeeImage, forState: .Normal)
        employeeViewButton.imageEdgeInsets = UIEdgeInsetsMake(0, 20, 20, 20);
        employeeViewButton.addTarget(self, action: "employeeAction:", forControlEvents: .TouchUpInside)
        menuBarView.addSubview(employeeViewButton)
        
        employeeViewButton.titleEdgeInsets = UIEdgeInsetsMake(65, -65, 0, 0);
//        let employeeLabel = UILabel(frame: CGRectMake(employeeViewButton.frame.size.width/2-30,employeeViewButton.frame.size.height-20,0,0))
//         employeeViewButton.titleEdgeInsets = UIEdgeInsets(top: 108, left: 0, bottom: 0, right: 0)
//        let xConstraint = NSLayoutConstraint(item: employeeLabel, attribute: .CenterX, relatedBy: .Equal, toItem: employeeViewButton, attribute: .CenterX, multiplier: 1, constant: 0)
//        employeeLabel.addConstraint(xConstraint)
//        employeeLabel.text = "Employee"
//        employeeLabel.textColor = UIColor.whiteColor()
//        employeeLabel.sizeToFit()
//        employeeViewButton.addSubview(employeeLabel)
        
        
        let accountViewButton = UIButton(frame: CGRectMake(5,employeeViewButton.frame.origin.y+employeeViewButton.frame.size.height+15,(self.view.frame.size.width-20)/3-10,menuBarView.frame.size.height/2-12.5))
        print((menuBarView.frame.origin.x+5,employeeViewButton.frame.origin.y+employeeViewButton.frame.size.height+15,(self.view.frame.size.width-20)/3-10,menuBarView.frame.size.height/2-12.5))
        accountViewButton.setTitle("Account", forState: .Normal)
        accountViewButton.backgroundColor = UIColor(red: 100/255.0, green: 114/255.0, blue: 202/255.0, alpha: 1.0)
        let image = UIImage(named: "ic_account@2x.png")
        accountViewButton.setImage(image, forState: .Normal)
        accountViewButton.imageEdgeInsets = UIEdgeInsetsMake(0, 20, 20, 20);
        accountViewButton.addTarget(self, action: "accountViewAction:", forControlEvents: .TouchUpInside)
         menuBarView.addSubview(accountViewButton)
        
        accountViewButton.titleEdgeInsets = UIEdgeInsetsMake(65, -65, 0, 0);
        
//        let accountLabel = UILabel(frame: CGRectMake(accountViewButton.frame.size.width/2-30,accountViewButton.frame.size.height-20,0,0))
//        accountLabel.text = "Account"
//        accountLabel.textColor = UIColor.whiteColor()
//        accountLabel.sizeToFit()
//        accountViewButton.addSubview(accountLabel)
        
       
        
        let settingsViewButton = UIButton(frame: CGRectMake(employeeViewButton.frame.origin.x+employeeViewButton.frame.size.width+15 ,5,(self.view.frame.size.width-20)/3-10,menuBarView.frame.size.height/2-12.5))
        print((employeeViewButton.frame.origin.x+employeeViewButton.frame.size.height+15 ,5,(self.view.frame.size.width-20)/3-10,menuBarView.frame.size.height/2-12.5))
        settingsViewButton.setTitle("Settings", forState: .Normal)
        settingsViewButton.backgroundColor = UIColor(red: 180/255.0, green: 157/255.0, blue: 68/255.0, alpha: 1.0)
        let settingsImage = UIImage(named: "ic_settings@2x.png")
        settingsViewButton.setImage(settingsImage, forState: .Normal)
        settingsViewButton.imageEdgeInsets = UIEdgeInsetsMake(0, 20, 20, 20);
        settingsViewButton.addTarget(self, action: "settingsAction:", forControlEvents: .TouchUpInside)
        
        settingsViewButton.titleEdgeInsets = UIEdgeInsetsMake(65, -65, 0, 0);
        menuBarView.addSubview(settingsViewButton)
        
//        let settingsLabel = UILabel(frame: CGRectMake(settingsViewButton.frame.width/2-30,settingsViewButton.frame.size.height-20,0,0))
//        settingsLabel.text = "Settings"
//        settingsLabel.textColor = UIColor.whiteColor()
//        settingsLabel.sizeToFit()
//        settingsViewButton.addSubview(settingsLabel)
        
        
        
        let historyViewButton = UIButton(frame: CGRectMake(accountViewButton.frame.origin.x+accountViewButton.frame.size.width+15,employeeViewButton.frame.origin.y+employeeViewButton.frame.size.height+15,(self.view.frame.size.width-20)/3-10,menuBarView.frame.size.height/2-12.5))
        print((accountViewButton.frame.origin.x+accountViewButton.frame.size.height+15,employeeViewButton.frame.origin.y+employeeViewButton.frame.size.height+15,(self.view.frame.size.width-20)/3-10,menuBarView.frame.size.height/2-12.5))
        historyViewButton.setTitle("History", forState: .Normal)
        historyViewButton.backgroundColor = UIColor(red: 68/255.0, green: 172/255.0, blue: 164/255.0, alpha: 1.0)
        let historyImage = UIImage(named: "ic_history@2x.png")
        historyViewButton.setImage(historyImage, forState: .Normal)
        historyViewButton.imageEdgeInsets = UIEdgeInsetsMake(0, 20, 20, 20);
        historyViewButton.addTarget(self, action: "historyAction:", forControlEvents: .TouchUpInside)
        historyViewButton.titleEdgeInsets = UIEdgeInsetsMake(65, -65, 0, 0);
        menuBarView.addSubview(historyViewButton)
        
//        let historyLabel = UILabel(frame: CGRectMake(historyViewButton.frame.size.width/2-30,historyViewButton.frame.size.height-20,0,0))
//        historyLabel.text = "History"
//        historyLabel.textColor = UIColor.whiteColor()
//        historyLabel.sizeToFit()
//        historyViewButton.addSubview(historyLabel)
        
        
        
        let dashBoardViewButton = UIButton(frame: CGRectMake(settingsViewButton.frame.origin.x+settingsViewButton.frame.size.width+15 ,5,(self.view.frame.size.width-20)/3-10,menuBarView.frame.size.height/2-12.5))
        print((settingsViewButton.frame.origin.x+settingsViewButton.frame.size.height+15 ,5,(self.view.frame.size.width-20)/3-10,menuBarView.frame.size.height/2-12.5))
        dashBoardViewButton.setTitle("Stripe Dashboard", forState: .Normal)
        dashBoardViewButton.backgroundColor = UIColor(red: 186/255.0, green: 91/255.0, blue: 204/255.0, alpha: 1.0)
        let dashboardImage = UIImage(named: "ic_dashboard@2x.png")
        dashBoardViewButton.setImage(dashboardImage, forState: .Normal)
        dashBoardViewButton.imageEdgeInsets = UIEdgeInsetsMake(0, 20, 20, 20);
        dashBoardViewButton.addTarget(self, action: "stripeAction:", forControlEvents: .TouchUpInside)
        dashBoardViewButton.titleLabel?.numberOfLines = 2
        dashBoardViewButton.titleLabel?.textAlignment = NSTextAlignment.Center
        dashBoardViewButton.titleEdgeInsets = UIEdgeInsetsMake(45, -65, 0, 0);
        menuBarView.addSubview(dashBoardViewButton)
        
//        let stripeLabel = UILabel(frame: CGRectMake(0,dashBoardViewButton.frame.size.height-20,0,0))
//        stripeLabel.text = "Stripe Dashboard"
//        stripeLabel.textColor = UIColor.whiteColor()
//        stripeLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
//        stripeLabel.numberOfLines = 2
//        stripeLabel.sizeToFit()
//        dashBoardViewButton.addSubview(stripeLabel)
        
        let logoutViewButton = UIButton(frame: CGRectMake(historyViewButton.frame.origin.x+historyViewButton.frame.size.width+15,employeeViewButton.frame.origin.y+employeeViewButton.frame.size.height+15,(self.view.frame.size.width-20)/3-10,menuBarView.frame.size.height/2-12.5))
        print((historyViewButton.frame.origin.x+historyViewButton.frame.size.height+15,employeeViewButton.frame.origin.y+employeeViewButton.frame.size.height+15,(self.view.frame.size.width-20)/3-10,menuBarView.frame.size.height/2-12.5))
        logoutViewButton.setTitle("LogOut", forState: .Normal)
        logoutViewButton.backgroundColor = UIColor(red: 212/255.0, green: 70/255.0, blue: 119/255.0, alpha: 1.0)
        let logoutImage = UIImage(named: "ic_logout@2x.png")
        logoutViewButton.setImage(logoutImage, forState: .Normal)
        logoutViewButton.imageEdgeInsets = UIEdgeInsetsMake(0, 20, 20, 20);
        logoutViewButton.addTarget(self, action: "logoutAction:", forControlEvents: .TouchUpInside)
        logoutViewButton.titleEdgeInsets = UIEdgeInsetsMake(65, -65, 0, 0);
        menuBarView.addSubview(logoutViewButton)
        
//        let logoutLabel = UILabel(frame: CGRectMake(logoutViewButton.frame.size.width/2-30,logoutViewButton.frame.size.height-20,0,0))
//        logoutLabel.text = "Logout"
//        logoutLabel.textColor = UIColor.whiteColor()
//        logoutLabel.sizeToFit()
//        logoutViewButton.addSubview(logoutLabel)
        
        self.createNumberPadButton()
    }
    func employeeAction(sender: UIButton!)
    {
        self.performSegueWithIdentifier("goto_Employee", sender: self)
    }
    func accountViewAction(sender: UIButton!)
    {
        self.performSegueWithIdentifier("goto_AccountInfo", sender: self)
    }
    func settingsAction(sender: UIButton!)
    {
        self.performSegueWithIdentifier("goto_Settings", sender: self)
    }
    func historyAction(sender: UIButton!)
    {
        self.performSegueWithIdentifier("goto_History", sender: self)
    }
    func stripeAction(sender: UIButton!)
    {
        self.performSegueWithIdentifier("goto_Stripe", sender: self)
    }
    func logoutAction(sender: UIButton!)
    {
      self.performSegueWithIdentifier("goto_Login", sender: self)
    }
    
    
    
    
    
    func createNumberPadButton()
    {
        //DYNAMIC NUMBERPAD CREATION
        let numberSevenButton = UIButton(frame: CGRectMake(5,5,(self.view.frame.size.width-90)/3,((onlyNumberView.frame.size.height/4)-3)))
        numberSevenButton.setTitle("7", forState: .Normal)
        numberSevenButton.titleLabel?.textColor = UIColor.whiteColor()
//        numberSevenButton.backgroundColor = UIColor(red: 107/255.0, green: 178/255.0, blue: 227/255.0, alpha: 1.0)
        numberSevenButton.backgroundColor = UIColor.clearColor()
        numberSevenButton.addTarget(self, action:"appendDigit:", forControlEvents: .TouchUpInside)
        onlyNumberView.addSubview(numberSevenButton)
        
        let numberfourButton = UIButton(frame: CGRectMake(5,numberSevenButton.frame.origin.y+numberSevenButton.frame.size.height,(self.view.frame.size.width-90)/3,((onlyNumberView.frame.size.height/4)-3)))
        numberfourButton.setTitle("4", forState: .Normal)
//        numberfourButton.backgroundColor = UIColor(red: 107/255.0, green: 178/255.0, blue: 227/255.0, alpha: 1.0)
        numberfourButton.backgroundColor = UIColor.clearColor()
        numberfourButton.addTarget(self, action:"appendDigit:", forControlEvents: .TouchUpInside)
        onlyNumberView.addSubview(numberfourButton)
        
        let numberOneButton = UIButton(frame: CGRectMake(5,numberfourButton.frame.origin.y+numberfourButton.frame.size.height,(self.view.frame.size.width-90)/3,((onlyNumberView.frame.size.height/4)-3)))
        numberOneButton.setTitle("1", forState: .Normal)
        numberOneButton.backgroundColor = UIColor(red: 107/255.0, green: 178/255.0, blue: 227/255.0, alpha: 1.0)
        numberOneButton.backgroundColor = UIColor.clearColor()
        numberOneButton.addTarget(self, action:"appendDigit:", forControlEvents: .TouchUpInside)
        onlyNumberView.addSubview(numberOneButton)
        
        let numberZeroButton = UIButton(frame: CGRectMake(5,numberOneButton.frame.origin.y+numberOneButton.frame.size.height,(self.view.frame.size.width-90)/3,((onlyNumberView.frame.size.height/4)-3)))
        numberZeroButton.setTitle("00", forState: .Normal)
//        numberZeroButton.backgroundColor = UIColor(red: 107/255.0, green: 178/255.0, blue: 227/255.0, alpha: 1.0)
        numberZeroButton.backgroundColor = UIColor.clearColor()
        numberZeroButton.addTarget(self, action:"appendDigit:", forControlEvents: .TouchUpInside)
        onlyNumberView.addSubview(numberZeroButton)
        
        
        let numberEightButton = UIButton(frame: CGRectMake(numberSevenButton.frame.origin.x+numberSevenButton.frame.size.width,5,(self.view.frame.size.width-90)/3,((onlyNumberView.frame.size.height/4)-3)))
        numberEightButton.setTitle("8", forState: .Normal)
//        numberEightButton.backgroundColor = UIColor(red: 107/255.0, green: 178/255.0, blue: 227/255.0, alpha: 1.0)
        numberEightButton.backgroundColor = UIColor.clearColor()
        numberEightButton.addTarget(self, action:"appendDigit:", forControlEvents: .TouchUpInside)
        onlyNumberView.addSubview(numberEightButton)
        
        let numberFiveButton = UIButton(frame: CGRectMake(numberSevenButton.frame.origin.x+numberSevenButton.frame.size.width,numberSevenButton.frame.origin.y+numberSevenButton.frame.size.height,(self.view.frame.size.width-90)/3,((onlyNumberView.frame.size.height/4)-3)))
        numberFiveButton.setTitle("5", forState: .Normal)
//        numberFiveButton.backgroundColor = UIColor(red: 107/255.0, green: 178/255.0, blue: 227/255.0, alpha: 1.0)
        numberFiveButton.backgroundColor = UIColor.clearColor()
        numberFiveButton.addTarget(self, action:"appendDigit:", forControlEvents: .TouchUpInside)
        onlyNumberView.addSubview(numberFiveButton)
        
        let numberTwoButton = UIButton(frame: CGRectMake(numberSevenButton.frame.origin.x+numberSevenButton.frame.size.width,numberfourButton.frame.origin.y+numberfourButton.frame.size.height,(self.view.frame.size.width-90)/3,((onlyNumberView.frame.size.height/4)-3)))
        numberTwoButton.setTitle("2", forState: .Normal)
//        numberTwoButton.backgroundColor = UIColor(red: 107/255.0, green: 178/255.0, blue: 227/255.0, alpha: 1.0)
        numberTwoButton.backgroundColor = UIColor.clearColor()
        numberTwoButton.addTarget(self, action:"appendDigit:", forControlEvents: .TouchUpInside)
        onlyNumberView.addSubview(numberTwoButton)
        
        let numberSingleZeroButton = UIButton(frame: CGRectMake(numberSevenButton.frame.origin.x+numberSevenButton.frame.size.width,numberOneButton.frame.origin.y+numberOneButton.frame.size.height,(self.view.frame.size.width-90)/3,((onlyNumberView.frame.size.height/4)-3)))
        numberSingleZeroButton.setTitle("0", forState: .Normal)
//        numberSingleZeroButton.backgroundColor = UIColor(red: 107/255.0, green: 178/255.0, blue: 227/255.0, alpha: 1.0)
        numberSingleZeroButton.backgroundColor = UIColor.clearColor()
        numberSingleZeroButton.addTarget(self, action:"appendDigit:", forControlEvents: .TouchUpInside)
        onlyNumberView.addSubview(numberSingleZeroButton)
        
        
        
        let numberNineButton = UIButton(frame: CGRectMake(numberEightButton.frame.origin.x+numberEightButton.frame.size.width,5,(self.view.frame.size.width-90)/3,((onlyNumberView.frame.size.height/4)-3)))
        numberNineButton.setTitle("9", forState: .Normal)
//        numberNineButton.backgroundColor = UIColor(red: 107/255.0, green: 178/255.0, blue: 227/255.0, alpha: 1.0)
        numberNineButton.backgroundColor = UIColor.clearColor()
        numberNineButton.addTarget(self, action:"appendDigit:", forControlEvents: .TouchUpInside)
        onlyNumberView.addSubview(numberNineButton)
        
        let numberSixButton = UIButton(frame: CGRectMake(numberEightButton.frame.origin.x+numberEightButton.frame.size.width,numberSevenButton.frame.origin.y+numberSevenButton.frame.size.height,(self.view.frame.size.width-90)/3,((onlyNumberView.frame.size.height/4)-3)))
        numberSixButton.setTitle("6", forState: .Normal)
//        numberSixButton.backgroundColor = UIColor(red: 107/255.0, green: 178/255.0, blue: 227/255.0, alpha: 1.0)
        numberSixButton.backgroundColor = UIColor.clearColor()
        numberSixButton.addTarget(self, action:"appendDigit:", forControlEvents: .TouchUpInside)
        onlyNumberView.addSubview(numberSixButton)
        
        let numberThreeButton = UIButton(frame: CGRectMake(numberEightButton.frame.origin.x+numberEightButton.frame.size.width,numberfourButton.frame.origin.y+numberfourButton.frame.size.height,(self.view.frame.size.width-90)/3,((onlyNumberView.frame.size.height/4)-3)))
        numberThreeButton.setTitle("3", forState: .Normal)
//        numberThreeButton.backgroundColor = UIColor(red: 107/255.0, green: 178/255.0, blue: 227/255.0, alpha: 1.0)
        numberThreeButton.backgroundColor = UIColor.clearColor()
        numberThreeButton.addTarget(self, action:"appendDigit:", forControlEvents: .TouchUpInside)
        onlyNumberView.addSubview(numberThreeButton)
        
        let lessThanButton = UIButton(frame: CGRectMake(numberEightButton.frame.origin.x+numberEightButton.frame.size.width,numberOneButton.frame.origin.y+numberOneButton.frame.size.height,(self.view.frame.size.width-90)/3,((onlyNumberView.frame.size.height/4)-3)))
        lessThanButton.setTitle("<", forState: .Normal)
//        lessThanButton.backgroundColor = UIColor(red: 107/255.0, green: 178/255.0, blue: 227/255.0, alpha: 1.0)
        lessThanButton.backgroundColor = UIColor.clearColor()
        lessThanButton.addTarget(self, action:"clearAction:", forControlEvents: .TouchUpInside)
        onlyNumberView.addSubview(lessThanButton)
    }
    
    
    func appendDigit(sender: UIButton!) {
        print("Button tapped")

        let digit = sender.currentTitle!
        chargeValue = chargeValue + digit
        print(chargeValue)
        
        
            let chargeAmt:String = chargeValue
                        let chargeAmount: Double? = (Double)(chargeAmt)
            print(chargeAmount!/100.0)
            chargeText = chargeAmount!/100.0
             let dollar: String = "$ "
            chargeAmountTextField.text = dollar + (String)(chargeText)
        
       chargeAmountString = (String)(chargeText)
            //(chargeAmountTextField.text! + digit)
       
        
    }
    func clearAction(sender: UIButton!) {

//      if chargeAmountTextField.text?.characters.count > 0
//      {
//        chargeAmountString = chargeAmountString.substringWithRange(Range(start: chargeAmountString.startIndex.advancedBy(0), end: chargeAmountString.endIndex.advancedBy(-1)))
//        }
       
        chargeAmountTextField.text =  (String)(chargeText)
   
        chargeValue = ""
    }
    
    
    func createBottomLineTextField(textField:UITextField)
    {
        let bottomLine = CALayer()
        bottomLine.frame = CGRectMake(0.0, textField.frame.height - 1 , textField.frame.width, 1.0)
        bottomLine.backgroundColor = UIColor.whiteColor().CGColor
        textField.borderStyle = UITextBorderStyle.None
        textField.layer.addSublayer(bottomLine)
    }
    
    func createView(view: UIView)
    {
        let view = UIView(frame: CGRectMake(100,20,100,100))
        view.backgroundColor = UIColor.greenColor()
        menuBarView.addSubview(view)
    }
    
    
    
    func displayViewController(animationType: SLpopupViewAnimationType) {
        let myPopupViewController:MyPopupViewController = MyPopupViewController(nibName:"MyPopupViewController", bundle: nil)
        //        myPopupViewController.delegate = self
        self.presentpopupViewController(myPopupViewController, animationType: animationType, completion: { () -> Void in
            
        })
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
    
    
    
    @IBAction func chargeOptionBtnAction(sender: AnyObject) {
        
//        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("popOver")
//        self.addChildViewController(popOverVC)
//        popOverVC.view.frame = CGRectMake(25, 100, self.view.frame.size.width - 100, self.view.frame.size.height - 250)
//        popOverVC.modalPresentationStyle = .Popover
//        self.view.addSubview(popOverVC.view)
//        popOverVC.didMoveToParentViewController(self)
        print(chargeText)
//        let totalAmountValue: Double = (Double)(chargeAmountTextField.text!)!
        if ( chargeText < 2)
        {
            self.presentViewController(Alert().alert("Warning", message: "Amount Should be above "),animated: true,completion: nil)
           
        }
        else if descriptionTextView.text.isEmpty || descriptionTextView.text == "Description" || descriptionTextView.text == ""
        {
            self.presentViewController(Alert().alert("Warning", message: "Please Provide Description for this purchase"),animated: true,completion: nil)
        }
        else
        {
            
            MerchantDetailsSingleTon.sharedInstance.setChargeAmount(chargeAmountString)
            MerchantDetailsSingleTon.sharedInstance.setDescriptonText(descriptionTextView.text)
            MerchantDetailsSingleTon.sharedInstance.setIsSimple(true)
//            self.displayViewController(.BottomTop)
            
            
            
//            let popupVc : MyPopupViewController = MyPopupViewController()
//            print("*****")
//            print(chargeAmountString)
//            popupVc.amountString = chargeAmountString
//            popupVc.descriptionString = descriptionTextView.text
//            popupVc.isSimple = true
//            print(popupVc.amountString)
            
            
            self.createBigButton()
            
        }
        
        
    }
    
    
    func createBigButton()
    {
        view1.frame =  CGRectMake(10,self.view.frame.origin.y+100,300,300)
//        view1.frame =  CGRectMake(self.view.frame.origin.x+20,self.view.frame.origin.y+100,self.view.frame.size.width-40,self.view.frame.size.height-200)
        view1.backgroundColor = UIColor.whiteColor()
        self.disableTouchesOnView(self.view)
        self.view.addSubview(view1)
        
        let scanCardButton : UIButton = UIButton(frame: CGRectMake(10,10,view1.frame.size.width/2-30,view1.frame.size.height/2-30))
        scanCardButton.backgroundColor = UIColor.blueColor()
        scanCardButton.addTarget(self, action: "scanAction:", forControlEvents: .TouchUpInside)
        [view1.addSubview(scanCardButton)]

        
    }
    
    func scanAction(sender: UIButton!) {
        print(" Scan Button tapped")
        
//        self.performSegueWithIdentifier("goto_MerchantQR", sender: self)
        let merchantVc: MerchantQRCodeViewController = MerchantQRCodeViewController()
        self.navigationController?.pushViewController(merchantVc, animated: true)
    }
    
    func fadeAction(sender: UIButton!) {
        print(" Fade Button tapped")
        
        view1.removeFromSuperview()
        fadeButton.removeFromSuperview()
        
    }
    
    func disableTouchesOnView(view : UIView)
    {
        fadeButton.frame = CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height)
//        let scanCardButton : UIButton = UIButton(frame: CGRectMake(view.frame.origin.x+20,view.frame.origin.y+20,view.frame.size.width/2-20,view.frame.size.height/2-20))
        fadeButton.backgroundColor = UIColor.clearColor()
        fadeButton.tag = 42
        fadeButton.addTarget(self, action: "fadeAction:", forControlEvents: .TouchUpInside)
        self.view.addSubview(fadeButton)
//        scanCardButton.addTarget(self, action: "scanAction:", forControlEvents: .TouchUpInside)
//        [view.addSubview(scanCardButton)]
    }
    
    func enableTouchesOnView(view : UIView)
    {
        view.viewWithTag(42)?.removeFromSuperview()
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 

}
