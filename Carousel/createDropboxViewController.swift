//
//  createDropboxViewController.swift
//  Carousel
//
//  Created by Kyungmin Kim on 2/14/15.
//  Copyright (c) 2015 Kyungmin Kim. All rights reserved.
//

import UIKit

class createDropboxViewController: UIViewController {

    @IBOutlet weak var createFormGroup: UIView!
    @IBOutlet weak var createButtonGroup: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)

        createFormGroup.transform = CGAffineTransformMakeScale(0.5, 0.5)
        createFormGroup.alpha = 0.2

        delay(0.1, {
            UIView.animateWithDuration(0.3, delay: 0, options: nil, animations: {
                self.createFormGroup.transform = CGAffineTransformMakeScale(1, 1)
                self.createFormGroup.alpha = 1
            }, completion: nil)
        })
    }

    
    @IBAction func backButtonDidClick(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
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
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            
            self.createFormGroup.center.y = 100
            self.createButtonGroup.center.y = self.createFormGroup.center.y + self.createButtonGroup.frame.height + 100
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
