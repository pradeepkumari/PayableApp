//
//  MerchantQRCodeViewController.swift
//  payableApp
//
//  Created by apple on 29/09/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class MerchantQRCodeViewController: UIViewController {
    var amountString: String!
    var descriptionString: String!
    var isSimple: Bool!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Merchant"
        self.amountString = MerchantDetailsSingleTon.sharedInstance.getChargeAmount()
        print("check**")
        print(self.amountString)
        // Do any additional setup after loading the view.
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
