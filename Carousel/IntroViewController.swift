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
    var xOffsets : [Float] = [-30, 75, -66, 10, -200, -15]
    var yOffsets : [Float] = [-285, -240, -415, 408, -480, -500]
    var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [Float] = [-10, -10, 10, 10, 10, -10]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        scrollView.contentSize = imageView.frame.size
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        var offset = Float(scrollView.contentOffset.y)
        var tiles : [UIImageView] = [tile1, tile2, tile3, tile4, tile5, tile6]

        for index in 0...5 {
            var tx = convertValue(offset, 0, 568, xOffsets[index], 0)
            var ty = convertValue(offset, 0, 568, yOffsets[index], 0)
            var scale = convertValue(offset, 0, 568, scales[index], 1)
            var rotation = convertValue(offset, 0, 568, rotations[index], 0)

            UIView.animateWithDuration(0.4, animations: {
                tiles[index].transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
                tiles[index].transform = CGAffineTransformScale(tiles[index].transform, CGFloat(scale), CGFloat(scale))
                tiles[index].transform = CGAffineTransformRotate(tiles[index].transform, CGFloat(Double(rotation) * M_PI / 180))
            })
        }
        
        
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
