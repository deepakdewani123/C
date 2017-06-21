//
//  OutputViewController.swift
//  C
//
//  Created by Deepak Dewani on 26/01/16.
//  Copyright © 2016 Deepak Dewani. All rights reserved.
//

import UIKit

//extension UIView {
//    func addDashedBorder() {
//        let color = UIColor.blackColor().CGColor
//        
//        let shapeLayer:CAShapeLayer = CAShapeLayer()
//        let frameSize = self.frame.size
//        let shapeRect = CGRect(x: 0, y: 0, width: 585, height: frameSize.height)
//        
//        shapeLayer.bounds = shapeRect
//        shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
//        shapeLayer.fillColor = UIColor.clearColor().CGColor
//        shapeLayer.strokeColor = color
//        shapeLayer.lineWidth = 1
//        shapeLayer.lineJoin = kCALineJoinRound
//        shapeLayer.lineDashPattern = [6,3]
//        shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 5).CGPath
//        
//        self.layer.addSublayer(shapeLayer)
//        
//    }
//}


class OutputViewController: UIViewController {

    
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var outputbBackgroundView: UIView!
    
    var text2 = NSString()
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        outputLabel.layer.borderColor = (UIColor(patternImage: UIImage(named: "dot")!)).CGColor
        outputLabel.alpha = 0
        outputLabel.layer.borderWidth = 1
        outputLabel.layer.borderColor = UIColor.blackColor().CGColor
        outputLabel.layer.cornerRadius = 5
        
        UIView.animateWithDuration(1) { () -> Void in
            self.outputLabel.alpha = 1
        }
        
        // shadow
//        outputLabel.layer.shadowColor = UIColor.blackColor().CGColor
//        outputLabel.layer.shadowOffset = CGSize(width: 0, height: 0)
//        outputLabel.layer.shadowOpacity = 0.5
//        outputLabel.layer.shadowRadius = 5.0
        
        let bundle = NSBundle.mainBundle()
        
        let path = bundle.pathForResource("keywordOutput", ofType: "txt")
        do {
            text2 = try NSString(contentsOfFile: path!, encoding: NSUTF8StringEncoding)
            print(text2) // prints the content of data.txt

        }
        catch {/* error handling here */}
        
        outputLabel.text = text2 as String
        
        outputbBackgroundView.center.y = -800
        outputLabel.center.y = -800
        
        UIView.animateWithDuration(0.4) { () -> Void in
            self.outputLabel.center.y = 0
            self.outputbBackgroundView.center.y = 0
        }

    }
    
    override func viewDidAppear(animated: Bool) {
     
    }
 

}
