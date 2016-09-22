//
//  SelectAccountAlertViewController.swift
//  payableApp
//
//  Created by apple on 20/09/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class SelectAccountAlertViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var accountTypes:NSArray!
    var accountImageTypes:NSArray!
    var selectedAccountType:NSString!
    var btnString:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        accountTypes = ["Individual","Employee","Company","Non-Profit Organisation","Non-Profit Organisation Employee"]
        accountImageTypes = ["ic_np_individual-1.png","ic_np_employee-1.png","ic_np_company-1.png","ic_np_organization.png","ic_np_organization_employee@2x.png"]
//        tableView.registerNib(UINib(nibName: "SelectAccountTableViewCell", bundle: nil), forCellReuseIdentifier: "selectAccountCell")
        // Do any additional setup after loading the view.
    }

 
    @IBAction func individualButton(sender: AnyObject) {
        
        print("Individual")
        btnString = "Individual"
    }
    @IBAction func employeeButton(sender: AnyObject) {
         print("Employee")
        let signupVc: SignUpViewController = SignUpViewController()
        Appconstant.btnName = "Employee"
//        signupVc.categoryTypeBtn.setTitle(Appconstant.btnName, forState: .Normal)
        
         
    }
    
    @IBAction func companyButton(sender: AnyObject) {
         print("Company")
        btnString = "Company"
    }
    
    @IBAction func nonProfitOrganisation(sender: AnyObject) {
         print("Non-Profit Organisation")
        btnString = "Non-Profit Organisation"
    }
    
    @IBAction func nonProfitOrganisationEmployee(sender: AnyObject) {
         print("Non-Profit Organisation Employee")
        btnString = "Non-Profit Organisation Employee"
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let acell:SelectAccountTableViewCell = tableView.dequeueReusableCellWithIdentifier("selectAccountCell", forIndexPath: indexPath) as! SelectAccountTableViewCell
        
       
        
        let label = acell.viewWithTag(1) as! UILabel
        label.text = accountTypes[indexPath.row] as? String
        print(label.text)
        let accountImage = acell.viewWithTag(2) as! UIImageView
        let productimages =  UIImage(named: accountImageTypes[indexPath.row] as! String)
        accountImage.image = productimages
        return acell
    }
    func Action()
    {
        print("text")
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  5
    }
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        let selectionColor = UIView() as UIView
        selectionColor.layer.borderWidth = 1
        selectionColor.layer.borderColor = UIColor.clearColor().CGColor
        selectionColor.backgroundColor = UIColor.clearColor()
        cell.selectedBackgroundView = selectionColor
    }
   func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    print("test")
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
