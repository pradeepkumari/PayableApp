//
//  PayableHomePageViewController.swift
//  payableApp
//
//  Created by apple on 14/09/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class PayableHomePageViewController: UIViewController {

    @IBOutlet weak var onlyNumberView: UIView!
  
   
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var numberPadView: UIView!
    @IBOutlet weak var menuBarView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var chargeAmountTextField: UITextField!
    var str = [String]()
    var userIsInTheMiddleOfTypingANumber = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
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
    override func viewWillAppear(animated: Bool) {
        
        self.createBottomLineTextField(chargeAmountTextField)
        print(self.view.frame.size.width)
        
        let employeeViewButton = UIButton(frame: CGRectMake(5,5,(self.view.frame.size.width-20)/3-10,menuBarView.frame.size.height/2-12.5))
        print((menuBarView.frame.origin.x+5,5,(self.view.frame.size.width-20)/3-10,menuBarView.frame.size.height/2-12.5))
        employeeViewButton.backgroundColor = UIColor(red: 220/255.0, green: 98/255.0, blue: 94/255.0, alpha: 1.0)
        let employeeImage = UIImage(named: "usedimages.png")
        employeeViewButton.setImage(employeeImage, forState: .Normal)
        employeeViewButton.addTarget(self, action: "employeeAction:", forControlEvents: .TouchUpInside)
        menuBarView.addSubview(employeeViewButton)
        
        
        let accountViewButton = UIButton(frame: CGRectMake(5,employeeViewButton.frame.origin.y+employeeViewButton.frame.size.height+15,(self.view.frame.size.width-20)/3-10,menuBarView.frame.size.height/2-12.5))
        print((menuBarView.frame.origin.x+5,employeeViewButton.frame.origin.y+employeeViewButton.frame.size.height+15,(self.view.frame.size.width-20)/3-10,menuBarView.frame.size.height/2-12.5))
        accountViewButton.backgroundColor = UIColor(red: 100/255.0, green: 114/255.0, blue: 202/255.0, alpha: 1.0)
        let image = UIImage(named: "account.png")
        accountViewButton.setImage(image, forState: .Normal)
        accountViewButton.addTarget(self, action: "accountViewAction:", forControlEvents: .TouchUpInside)
        menuBarView.addSubview(accountViewButton)
        
        let settingsViewButton = UIButton(frame: CGRectMake(employeeViewButton.frame.origin.x+employeeViewButton.frame.size.width+15 ,5,(self.view.frame.size.width-20)/3-10,menuBarView.frame.size.height/2-12.5))
        print((employeeViewButton.frame.origin.x+employeeViewButton.frame.size.height+15 ,5,(self.view.frame.size.width-20)/3-10,menuBarView.frame.size.height/2-12.5))
        settingsViewButton.backgroundColor = UIColor(red: 180/255.0, green: 157/255.0, blue: 68/255.0, alpha: 1.0)
        let settingsImage = UIImage(named: "settings.png")
        settingsViewButton.setImage(settingsImage, forState: .Normal)
        settingsViewButton.addTarget(self, action: "settingsAction:", forControlEvents: .TouchUpInside)
        menuBarView.addSubview(settingsViewButton)
        
        let historyViewButton = UIButton(frame: CGRectMake(accountViewButton.frame.origin.x+accountViewButton.frame.size.width+15,employeeViewButton.frame.origin.y+employeeViewButton.frame.size.height+15,(self.view.frame.size.width-20)/3-10,menuBarView.frame.size.height/2-12.5))
        print((accountViewButton.frame.origin.x+accountViewButton.frame.size.height+15,employeeViewButton.frame.origin.y+employeeViewButton.frame.size.height+15,(self.view.frame.size.width-20)/3-10,menuBarView.frame.size.height/2-12.5))
        historyViewButton.backgroundColor = UIColor(red: 68/255.0, green: 172/255.0, blue: 164/255.0, alpha: 1.0)
        let historyImage = UIImage(named: "history.png")
        historyViewButton.setImage(historyImage, forState: .Normal)
        historyViewButton.addTarget(self, action: "historyAction:", forControlEvents: .TouchUpInside)
        menuBarView.addSubview(historyViewButton)
        
        let dashBoardViewButton = UIButton(frame: CGRectMake(settingsViewButton.frame.origin.x+settingsViewButton.frame.size.width+15 ,5,(self.view.frame.size.width-20)/3-10,menuBarView.frame.size.height/2-12.5))
        print((settingsViewButton.frame.origin.x+settingsViewButton.frame.size.height+15 ,5,(self.view.frame.size.width-20)/3-10,menuBarView.frame.size.height/2-12.5))
        dashBoardViewButton.backgroundColor = UIColor(red: 186/255.0, green: 91/255.0, blue: 204/255.0, alpha: 1.0)
        let dashboardImage = UIImage(named: "stripe.png")
        dashBoardViewButton.setImage(dashboardImage, forState: .Normal)
        dashBoardViewButton.addTarget(self, action: "stripeAction:", forControlEvents: .TouchUpInside)
        menuBarView.addSubview(dashBoardViewButton)
        
        let logoutViewButton = UIButton(frame: CGRectMake(historyViewButton.frame.origin.x+historyViewButton.frame.size.width+15,employeeViewButton.frame.origin.y+employeeViewButton.frame.size.height+15,(self.view.frame.size.width-20)/3-10,menuBarView.frame.size.height/2-12.5))
        print((historyViewButton.frame.origin.x+historyViewButton.frame.size.height+15,employeeViewButton.frame.origin.y+employeeViewButton.frame.size.height+15,(self.view.frame.size.width-20)/3-10,menuBarView.frame.size.height/2-12.5))
        logoutViewButton.backgroundColor = UIColor(red: 212/255.0, green: 70/255.0, blue: 119/255.0, alpha: 1.0)
        let logoutImage = UIImage(named: "logout.png")
        logoutViewButton.setImage(logoutImage, forState: .Normal)
        logoutViewButton.addTarget(self, action: "logoutAction:", forControlEvents: .TouchUpInside)
        menuBarView.addSubview(logoutViewButton)
        
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
        
    }
    
    
    
    
    
    func createNumberPadButton()
    {
        //DYNAMIC NUMBERPAD CREATION
        let numberSevenButton = UIButton(frame: CGRectMake(5,5,(self.view.frame.size.width-90)/3,((onlyNumberView.frame.size.height/4)-3)))
        numberSevenButton.setTitle("7", forState: .Normal)
        numberSevenButton.titleLabel?.textColor = UIColor.whiteColor()
        numberSevenButton.backgroundColor = UIColor.blueColor()
        numberSevenButton.addTarget(self, action:"appendDigit:", forControlEvents: .TouchUpInside)
        onlyNumberView.addSubview(numberSevenButton)
        
        let numberfourButton = UIButton(frame: CGRectMake(5,numberSevenButton.frame.origin.y+numberSevenButton.frame.size.height,(self.view.frame.size.width-90)/3,((onlyNumberView.frame.size.height/4)-3)))
        numberfourButton.setTitle("4", forState: .Normal)
        numberfourButton.backgroundColor = UIColor.blueColor()
        numberfourButton.addTarget(self, action:"appendDigit:", forControlEvents: .TouchUpInside)
        onlyNumberView.addSubview(numberfourButton)
        
        let numberOneButton = UIButton(frame: CGRectMake(5,numberfourButton.frame.origin.y+numberfourButton.frame.size.height,(self.view.frame.size.width-90)/3,((onlyNumberView.frame.size.height/4)-3)))
        numberOneButton.setTitle("1", forState: .Normal)
        numberOneButton.backgroundColor = UIColor.blueColor()
        numberOneButton.addTarget(self, action:"appendDigit:", forControlEvents: .TouchUpInside)
        onlyNumberView.addSubview(numberOneButton)
        
        let numberZeroButton = UIButton(frame: CGRectMake(5,numberOneButton.frame.origin.y+numberOneButton.frame.size.height,(self.view.frame.size.width-90)/3,((onlyNumberView.frame.size.height/4)-3)))
        numberZeroButton.setTitle("00", forState: .Normal)
        numberZeroButton.backgroundColor = UIColor.blueColor()
        numberZeroButton.addTarget(self, action:"appendDigit:", forControlEvents: .TouchUpInside)
        onlyNumberView.addSubview(numberZeroButton)
        
        
        let numberEightButton = UIButton(frame: CGRectMake(numberSevenButton.frame.origin.x+numberSevenButton.frame.size.width,5,(self.view.frame.size.width-90)/3,((onlyNumberView.frame.size.height/4)-3)))
        numberEightButton.setTitle("8", forState: .Normal)
        numberEightButton.backgroundColor = UIColor.blueColor()
        numberEightButton.addTarget(self, action:"appendDigit:", forControlEvents: .TouchUpInside)
        onlyNumberView.addSubview(numberEightButton)
        
        let numberFiveButton = UIButton(frame: CGRectMake(numberSevenButton.frame.origin.x+numberSevenButton.frame.size.width,numberSevenButton.frame.origin.y+numberSevenButton.frame.size.height,(self.view.frame.size.width-90)/3,((onlyNumberView.frame.size.height/4)-3)))
        numberFiveButton.setTitle("5", forState: .Normal)
        numberFiveButton.backgroundColor = UIColor.blueColor()
        numberFiveButton.addTarget(self, action:"appendDigit:", forControlEvents: .TouchUpInside)
        onlyNumberView.addSubview(numberFiveButton)
        
        let numberTwoButton = UIButton(frame: CGRectMake(numberSevenButton.frame.origin.x+numberSevenButton.frame.size.width,numberfourButton.frame.origin.y+numberfourButton.frame.size.height,(self.view.frame.size.width-90)/3,((onlyNumberView.frame.size.height/4)-3)))
        numberTwoButton.setTitle("2", forState: .Normal)
        numberTwoButton.backgroundColor = UIColor.blueColor()
        numberTwoButton.addTarget(self, action:"appendDigit:", forControlEvents: .TouchUpInside)
        onlyNumberView.addSubview(numberTwoButton)
        
        let numberSingleZeroButton = UIButton(frame: CGRectMake(numberSevenButton.frame.origin.x+numberSevenButton.frame.size.width,numberOneButton.frame.origin.y+numberOneButton.frame.size.height,(self.view.frame.size.width-90)/3,((onlyNumberView.frame.size.height/4)-3)))
        numberSingleZeroButton.setTitle("0", forState: .Normal)
        numberSingleZeroButton.backgroundColor = UIColor.blueColor()
        numberSingleZeroButton.addTarget(self, action:"appendDigit:", forControlEvents: .TouchUpInside)
        onlyNumberView.addSubview(numberSingleZeroButton)
        
        
        
        let numberNineButton = UIButton(frame: CGRectMake(numberEightButton.frame.origin.x+numberEightButton.frame.size.width,5,(self.view.frame.size.width-90)/3,((onlyNumberView.frame.size.height/4)-3)))
        numberNineButton.setTitle("9", forState: .Normal)
        numberNineButton.backgroundColor = UIColor.blueColor()
        numberNineButton.addTarget(self, action:"appendDigit:", forControlEvents: .TouchUpInside)
        onlyNumberView.addSubview(numberNineButton)
        
        let numberSixButton = UIButton(frame: CGRectMake(numberEightButton.frame.origin.x+numberEightButton.frame.size.width,numberSevenButton.frame.origin.y+numberSevenButton.frame.size.height,(self.view.frame.size.width-90)/3,((onlyNumberView.frame.size.height/4)-3)))
        numberSixButton.setTitle("6", forState: .Normal)
        numberSixButton.backgroundColor = UIColor.blueColor()
        numberSixButton.addTarget(self, action:"appendDigit:", forControlEvents: .TouchUpInside)
        onlyNumberView.addSubview(numberSixButton)
        
        let numberThreeButton = UIButton(frame: CGRectMake(numberEightButton.frame.origin.x+numberEightButton.frame.size.width,numberfourButton.frame.origin.y+numberfourButton.frame.size.height,(self.view.frame.size.width-90)/3,((onlyNumberView.frame.size.height/4)-3)))
        numberThreeButton.setTitle("3", forState: .Normal)
        numberThreeButton.backgroundColor = UIColor.blueColor()
        numberThreeButton.addTarget(self, action:"appendDigit:", forControlEvents: .TouchUpInside)
        onlyNumberView.addSubview(numberThreeButton)
        
        let lessThanButton = UIButton(frame: CGRectMake(numberEightButton.frame.origin.x+numberEightButton.frame.size.width,numberOneButton.frame.origin.y+numberOneButton.frame.size.height,(self.view.frame.size.width-90)/3,((onlyNumberView.frame.size.height/4)-3)))
        lessThanButton.setTitle("<", forState: .Normal)
        lessThanButton.backgroundColor = UIColor.blueColor()
        lessThanButton.addTarget(self, action:"clearAction:", forControlEvents: .TouchUpInside)
        onlyNumberView.addSubview(lessThanButton)
    }
    
    
    func appendDigit(sender: UIButton!) {
        print("Button tapped")

        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTypingANumber {
            chargeAmountTextField.text = chargeAmountTextField.text! + digit
        } else {
            chargeAmountTextField.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
        
    }
    func clearAction(sender: UIButton!) {
        chargeAmountTextField.text = ""
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
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 

}
