//
//  PopOverViewController.swift
//  payableApp
//
//  Created by apple on 20/09/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class PopOverViewController: UIViewController,UIPopoverPresentationControllerDelegate {

    @IBOutlet weak var generateQRView: UIView!
    @IBOutlet weak var bitCoinView: UIView!
    @IBOutlet weak var scanCardView: UIView!
    @IBOutlet weak var sendInvoice: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        
//       self.navigationController?.navigationItem.title = "$ Charge Option"
//        
//        self.navigationController!.navigationBar.barTintColor = UIColor.blueColor()
        
        
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
