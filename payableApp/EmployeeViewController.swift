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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func homeBtnAction(sender: AnyObject) {
        self.performSegueWithIdentifier("goto_Homepage", sender: self)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let acell = tableView.dequeueReusableCellWithIdentifier("employeeCell", forIndexPath: indexPath) as UITableViewCell!
        if indexPath.row == 0
        {
            acell.viewWithTag(10)?.hidden = true
        }
        
        let label = acell.viewWithTag(1) as! UILabel
//        acell.viewWithTag(1) = "check val"
        label.text = "hfu"
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
