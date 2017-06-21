//
//  ScrollViewController.swift
//  C
//
//  Created by Deepak Dewani on 01/02/16.
//  Copyright © 2016 Deepak Dewani. All rights reserved.
//

import UIKit

//extension String {
//    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
//        let constraintRect = CGSize(width: width, height: CGFloat.max)
//        
//        let boundingBox = self.boundingRectWithSize(constraintRect, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
//        
//        return boundingBox.height
//    }
//}

class ScrollViewController: UIViewController {

    
    @IBOutlet weak var height: NSLayoutConstraint!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var myView: UIView!
    
    var text1 = String()
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    text1 = "loops through a block of code a number of times. The 'initialization statement' is executed only once at the beginning of the for loop. Then the test expression is checked by the program, if it's false for loop is terminated, otherwise expression inside for loop's body is executed and then update expression is updated. This process repeats until test expression is false.loops through a block of code a number of times.loops through a block of code a number of times. The 'initialization statement' is executed only once at the beginning of the for loop. Then the test expression is checked by the program, if it's false for loop is terminated, otherwise expression inside for loop's body is executed and then update expression is updated. This process repeats until test expression is false.loops through a block of code a number of times.loops through a block of code a number of times. The 'initialization statement' is executed only once at the beginning of the for loop. Then the test expression is checked by the program, if it's false for loop is terminated, otherwise expression inside for loop's body is executed and then update expression is updated. This process repeats until test expression is false.loops through a block of code a number of times.. "
        
    label.text = text1

        
    }
    
    
    
    override func viewDidLayoutSubviews()
    {
        self.height.constant = text1.heightWithConstrainedWidth(270, font: UIFont(name: "Menlo", size: 17)!)

    }

}
