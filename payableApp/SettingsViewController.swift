//
//  SettingsViewController.swift
//  payableApp
//
//  Created by apple on 16/09/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var businessLogoView: UIView!
    @IBOutlet weak var businessLogoImageView: UIImageView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var taxAndTipsView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
//               segmentedControl.tintColor = UIColor.blueColor()
             
                
            default:
                break;
            }
            
        }
    
    @IBAction func homeButtonAction(sender: AnyObject) {
        self.performSegueWithIdentifier("goto_Homepage", sender: self)
    }

    @IBAction func updateButtonAction(sender: AnyObject) {
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
