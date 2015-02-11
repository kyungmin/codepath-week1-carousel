//
//  IntroViewController.swift
//  Carousel
//
//  Created by Kyungmin Kim on 2/10/15.
//  Copyright (c) 2015 Kyungmin Kim. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var tile1: UIImageView!
    @IBOutlet weak var tile2: UIImageView!
    @IBOutlet weak var tile3: UIImageView!
    @IBOutlet weak var tile4: UIImageView!
    @IBOutlet weak var tile5: UIImageView!
    @IBOutlet weak var tile6: UIImageView!

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        scrollView.contentSize = imageView.frame.size
        
        tile1.transform = CGAffineTransformMakeDegreeRotation(-15)

        tile2.transform = CGAffineTransformMakeScale(1.5, 1.5)
        tile2.transform = CGAffineTransformRotate(tile2.transform, -15 * CGFloat(M_PI / 180))
        
        tile3.transform = CGAffineTransformMakeScale(1.5, 1.5)
        tile3.transform = CGAffineTransformRotate(tile3.transform, 15 * CGFloat(M_PI / 180))
        
        tile4.transform = CGAffineTransformMakeScale(1.5, 1.5)
        tile4.transform = CGAffineTransformRotate(tile4.transform, 15 * CGFloat(M_PI / 180))

        tile5.transform = CGAffineTransformMakeScale(1.5, 1.5)
        tile5.transform = CGAffineTransformRotate(tile5.transform, 15 * CGFloat(M_PI / 180))
        
        tile6.transform = CGAffineTransformMakeScale(1.5, 1.5)
        tile6.transform = CGAffineTransformRotate(tile6.transform, -15 * CGFloat(M_PI / 180))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        UIView.animateWithDuration(0.4, animations: {
            self.tile1.transform = CGAffineTransformMakeDegreeRotation(0)
            self.tile1.center.x = 125
            self.tile1.center.y = 825
            
            self.tile2.center.x = 240
            self.tile2.center.y = 787
            self.tile2.transform = CGAffineTransformMakeScale(1, 1)
            self.tile2.transform = CGAffineTransformRotate(self.tile2.transform, CGFloat(0))
            
            self.tile3.transform = CGAffineTransformMakeScale(1, 1)
            self.tile3.transform = CGAffineTransformTranslate(self.tile3.transform, 50, 50)
            self.tile3.transform = CGAffineTransformRotate(self.tile3.transform, CGFloat(0))
            
            self.tile4.transform = CGAffineTransformMakeScale(1, 1)
            self.tile4.transform = CGAffineTransformTranslate(self.tile4.transform, 50, 50)
            self.tile4.transform = CGAffineTransformRotate(self.tile4.transform, CGFloat(0))
            
            self.tile5.transform = CGAffineTransformMakeScale(1, 1)
            self.tile5.transform = CGAffineTransformTranslate(self.tile5.transform, 50, 50)
            self.tile5.transform = CGAffineTransformRotate(self.tile5.transform, CGFloat(0))
            
            self.tile6.transform = CGAffineTransformMakeScale(1, 1)
            self.tile6.transform = CGAffineTransformTranslate(self.tile6.transform, 50, 50)
            self.tile6.transform = CGAffineTransformRotate(self.tile6.transform, CGFloat(0))
        })
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView!) {
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView!,
        willDecelerate decelerate: Bool) {
            // This method is called right as the user lifts their finger
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        // This method is called when the scrollview finally stops scrolling.
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
