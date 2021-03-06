//
//  MyPopupViewController.swift
//  SLPopupViewControllerDemo
//
//  Created by Nguyen Duc Hoang on 9/13/15.
//  Copyright © 2015 Nguyen Duc Hoang. All rights reserved.
//

import UIKit

protocol MyPopupViewControllerDelegate {
    func pressOK(sender: MyPopupViewController)
    func pressCancel(sender: MyPopupViewController)
}
class MyPopupViewController: UIViewController {
    var delegate:MyPopupViewControllerDelegate?
    var amountString: String!
    var descriptionString: String!
    var isSimple: Bool!
    
    @IBAction func btnOK(sender:UIButton) {
//        self.delegate?.pressOK(self)
        self.dismissPopupViewController(.TopBottom)
    }
    
    @IBAction func scanCardBtn(sender: AnyObject) {
        print("Scan Card Tapped")
    }
    @IBAction func bitCoinBtn(sender: AnyObject) {
        print("BitCoin Tapped")
        self.dismissPopupViewController(.TopBottom)
//        let popup : MerchantQRCodeViewController = self.storyboard?.instantiateViewControllerWithIdentifier("bitcoin") as! MerchantQRCodeViewController
//        let navigationController = UINavigationController(rootViewController: popup)
//        navigationController.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext
//        self.presentViewController(navigationController, animated: true, completion: nil)
        
        let merchantVc: MerchantQRCodeViewController = MerchantQRCodeViewController()
        self.presentViewController(merchantVc, animated: true, completion: nil)
        
//        presentView(merchantVc)
//        self.displayViewController(.TopBottom)
//        let merchantVc: MerchantQRCodeViewController = MerchantQRCodeViewController()
//        self.presentViewController(merchantVc, animated: true, completion: nil)
//        merchantVc.amountString = self.amountString
//        merchantVc.descriptionString = self.descriptionString
//        merchantVc.isSimple = self.isSimple
//        
//        print(merchantVc.amountString)
    }
 
    
    func displayViewController(animationType: SLpopupViewAnimationType) {
        let merchantVc: MerchantQRCodeViewController = MerchantQRCodeViewController()
//        let myPopupViewController:MyPopupViewController = MyPopupViewController(nibName:"MyPopupViewController", bundle: nil)
        //        myPopupViewController.delegate = self
        self.presentpopupViewController(merchantVc, animationType: animationType, completion: { () -> Void in
            
        })
    }
    
    @IBAction func generateQR(sender: AnyObject) {
        print("generateQR Tapped")
    }
    @IBAction func sendInvoiceBtn(sender: AnyObject) {
        print("sendInvoice Tapped")
    }
    @IBAction func btnCancel(sender:UIButton) {
        self.delegate?.pressCancel(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        self.view.frame.size.width = 300
        self.view.frame.size.width = 300
        
//        let signUp = SignUpViewController()
//        let h = signUp.screenHeight
//        
//        if(h == 480) {
//            
//            self.view.frame.size.width = 320-60
//        } //iPhone-4
//        
//        if(h == 568) {
//            
//            self.view.frame.size.width = 320-60
//        }
//        if(h == 667) {
//            
//            self.view.frame.size.width = 375-60
//        } //iPhone-6,7
//        if(h == 736) {
//            
//            self.view.frame.size.width = 414-60
//        } //iPhone-6s,7s
        
        self.view.layer.cornerRadius = 22
        self.view.layer.masksToBounds = true
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
