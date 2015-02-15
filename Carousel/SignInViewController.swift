//
//  SignInViewController.swift
//  Carousel
//
//  Created by Kyungmin Kim on 2/10/15.
//  Copyright (c) 2015 Kyungmin Kim. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var loginForm: UIImageView!
    @IBOutlet weak var loginText: UIImageView!
    @IBOutlet weak var loginFormGroup: UIView!
    @IBOutlet weak var signInButtonGroup: UIView!
    
    var alertView = UIAlertView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    @IBAction func didStartEditing(sender: AnyObject) {
        if (emailField.text.isEmpty || passwordField.text.isEmpty) {
            signInButton.enabled = false
        } else {
            signInButton.enabled = true
        }
    }
    
    @IBAction func didPressBackButton(sender: AnyObject) {
       dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func signInDidClick(sender: AnyObject) {
        if (emailField.text == "") {
            // empty email
            self.alertView = UIAlertView(title: "Email required", message: "Please enter your email address", delegate: self, cancelButtonTitle: "OK")
            self.alertView.show()
        } else if (passwordField.text == "") {
            // empty password
            self.alertView = UIAlertView(title: "Password required", message: "Please enter your password", delegate: self, cancelButtonTitle: "OK")
            self.alertView.show()
        } else {
            alertView = UIAlertView(title: "Signing in...", message: nil, delegate: self, cancelButtonTitle: nil)
            alertView.show()
            
            delay(2, {() -> () in
                if (self.emailField.text == "kk") {
                    // success
                    self.alertView.dismissWithClickedButtonIndex(0, animated: true)
                    self.performSegueWithIdentifier("signedIn", sender: self)
                } else {
                    // wrong email
                    self.alertView = UIAlertView(title: "Sign In Failed", message: "Incorrect email or password", delegate: self, cancelButtonTitle: "OK")
                    self.alertView.show()
                }
            })
        }
        
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        var originalLoginFormY = self.loginFormGroup.center.y
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {

            self.loginFormGroup.center.y = 100
            self.signInButtonGroup.center.y = 568 - (kbSize.height + 30)
            
            }, completion: nil)
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue

        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {

            }, completion: nil)
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
