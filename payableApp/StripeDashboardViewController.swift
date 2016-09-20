//
//  StripeDashboardViewController.swift
//  payableApp
//
//  Created by apple on 19/09/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class StripeDashboardViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL (string: "https://www.google.com")
                let requestObj = NSURLRequest(URL: url!);
                webView.loadRequest(requestObj)
        
        
        // Do any additional setup after loading the view.
    }
    @IBAction func homeBarButton(sender: AnyObject) {
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
