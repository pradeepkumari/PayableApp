//
//  AccountInfoViewController.swift
//  payableApp
//
//  Created by apple on 15/09/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class AccountInfoViewController: UIViewController {
    @IBOutlet weak var commentButton: UIButton!
    
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
       
       self.navigationController?.navigationBar.backgroundColor = UIColor(red: 107/255.0, green: 178/255.0, blue: 227/255.0, alpha: 1.0)
        
       self.mySegmentedControl.layer.cornerRadius = 45.0
//        self.mySegmentedControl.layer.masksToBounds = true
//        self.mySegmentedControl.tintColor = UIColor.whiteColor()
//
        self.updateInformationView.hidden = false
        self.changePasswordView.hidden = true
        self.supportView.hidden = true
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func createBottomLineTextField(textField:UITextField)
    {
        let bottomLine = CALayer()
        bottomLine.frame = CGRectMake(0.0, textField.frame.height - 1 , textField.frame.width, 1.0)
        bottomLine.backgroundColor = UIColor.blackColor().CGColor
        textField.borderStyle = UITextBorderStyle.None
        textField.layer.addSublayer(bottomLine)
    }
    
    override func viewWillAppear(animated: Bool) {
        self.createBottomLineTextField(newPwd)
        self.createBottomLineTextField(confirmPwd)
        self.profilePicture.layer.borderWidth = 1
        self.profilePicture.layer.masksToBounds = false
        self.profilePicture.layer.borderColor = UIColor.blackColor().CGColor
        self.profilePicture.layer.cornerRadius = profilePicture.frame.height/2
        self.profilePicture.clipsToBounds = true
        blurImageView.addSubview(profilePicture)
        
        self.makeBlurImage(blurImageView)
        
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
