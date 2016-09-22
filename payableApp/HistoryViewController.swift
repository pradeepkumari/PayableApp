//
//  HistoryViewController.swift
//  payableApp
//
//  Created by apple on 19/09/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var TotalTransLabel1: UILabel!
    @IBOutlet weak var totalTransLabel2: UILabel!
    @IBOutlet weak var TransactionCountTextfield: UITextField!
    @IBOutlet weak var transactionAmountTextfield: UITextField!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.segmentControl.tintColor = UIColor.whiteColor()
//        self.segmentControl.layer.cornerRadius = 50.0
//        
//        segmentControl.subviews[1].backgroundColor = UIColor.whiteColor()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func homeButtonAction(sender: AnyObject) {
        self.performSegueWithIdentifier("goto_Homepage", sender: self)
    }

    @IBAction func indexBtn(sender: AnyObject) {
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let acell = tableView.dequeueReusableCellWithIdentifier("historyCell", forIndexPath: indexPath) as UITableViewCell!
        
        let accountImage = acell.viewWithTag(3) as! UIImageView
        let productimages =  UIImage(named: "ic_home.png")
        accountImage.image = productimages
        
        let label = acell.viewWithTag(1) as! UILabel
        label.text = "hfu"
        let dateTimelabel = acell.viewWithTag(2) as! UILabel
        dateTimelabel.text = "hfu"
        
        return acell
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  5
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
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
