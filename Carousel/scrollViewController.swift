//
//  scrollViewController.swift
//  Carousel
//
//  Created by Kyungmin Kim on 2/11/15.
//  Copyright (c) 2015 Kyungmin Kim. All rights reserved.
//

import UIKit

class scrollViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var getStartedButtonGroup: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: 1280, height: 568)
        scrollView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        // Get the current page based on the scroll offset
        var page : Int = Int(round(scrollView.contentOffset.x / 320))
        
        // Set the current page, so the dots will update
        pageControl.currentPage = page
        
        // initially hide the button
        getStartedButtonGroup.alpha = 0
        
        if (page == 3) {
            pageControl.hidden = true

            UIView.animateWithDuration(1, delay: 0.0, options: nil, animations: {
                self.getStartedButtonGroup.alpha = 1
                }, completion: nil)
        }
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
