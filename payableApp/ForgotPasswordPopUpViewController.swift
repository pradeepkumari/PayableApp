//
//  ForgotPasswordPopUpViewController.swift
//  payableApp
//
//  Created by apple on 24/09/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class ForgotPasswordPopUpViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        createBottomLineTextField(usernameTextField)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int){
        
            self.dismissPopupViewController(.TopBottom)
        
    }

    
    @IBAction func forgotPwdSubmit(sender: AnyObject) {
        if (usernameTextField.text == nil || usernameTextField.text!.isEmpty || usernameTextField.text == "") {
            self.presentViewController(Alert().alert("Warning", message: "Enter your Username"),animated: true,completion: nil)
            
        }
        else
        {
            
            let forgotPwdViewModel = ForgotPwdModel.init(Username : self.usernameTextField.text!)
            
            let serializedjson  = JSONSerializer.toJson(forgotPwdViewModel!)
            print(serializedjson)
            
            let request = NSMutableURLRequest(URL: NSURL(string: Appconstant.WEB_API + Appconstant.forgot)!)
            request.HTTPMethod = "Post"
            
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            request.HTTPBody = serializedjson.dataUsingEncoding(NSUTF8StringEncoding)
            
            let task = NSURLSession.sharedSession().dataTaskWithRequest(request)
                { data, response, error in
                    guard error == nil && data != nil else {                                                          // check for fundamental networking error
                        
                        return
                    }
                    
                    if let httpStatus = response as? NSHTTPURLResponse where httpStatus.statusCode != 200 {           // check for http errors
                        print("statusCode should be 200, but is \(httpStatus.statusCode)")
                        print("response = \(response)")
                    }
                    
                    let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
                    print("responseString = \(responseString!)")
                    let result:NSString = responseString!.stringByTrimmingCharactersInSet(NSCharacterSet.init(charactersInString: "la t, \n \" ':"))
                    print(result)
                    dispatch_async(dispatch_get_main_queue(), {
                        if result == "-2"
                        {
                            self.presentViewController(Alert().alert("Title", message: "Invalid Username"),animated: true,completion: nil)
                            
                        }
                        else if responseString! == ""
                        {
                            self.presentViewController(Alert().alert("Title", message: "Please Check your Internet connection"),animated: true,completion: nil)
                        }
                        else
                        {
                            let alert:UIAlertView = UIAlertView()
                            alert.delegate = self
                            alert.title = "Alert"
                            alert.message = "Password reset mail successfully sent to your mail address..! Please check your mail and follow the instructions as given."
                            alert.addButtonWithTitle("Done")
                            alert.show()
                        }
                        
                    })
                    
                    //
            }
            task.resume()

    }
    }

        func alert(title: String,message: String)-> UIAlertController
        {
            let alert = UIAlertController(title: title,message: message, preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK",style: UIAlertActionStyle.Default, handler: nil))
            return alert
        }

    func createBottomLineTextField(textField:UITextField)
    {
        let bottomLine = CALayer()
        bottomLine.frame = CGRectMake(0.0, textField.frame.height - 1 , textField.frame.width, 1.0)
        bottomLine.backgroundColor = UIColor.blackColor().CGColor
        textField.borderStyle = UITextBorderStyle.None
        textField.layer.addSublayer(bottomLine)
    }
    @IBAction func forgotPwdCancel(sender: AnyObject) {
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
