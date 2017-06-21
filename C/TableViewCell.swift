//
//  TableViewCell.swift
//  C
//
//  Created by Deepak Dewani on 19/01/16.
//  Copyright © 2016 Deepak Dewani. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var myLabel: UILabel!
    
    
//    override func drawRect(rect: CGRect) {
//        
//        let verticalLine: CGContextRef = UIGraphicsGetCurrentContext()!
//        CGContextSetStrokeColorWithColor(verticalLine, UIColor.grayColor().CGColor)
//        CGContextBeginPath(verticalLine)
//        CGContextMoveToPoint(verticalLine, self.myLabel.center.x, self.myLabel.center.y)
//        CGContextAddLineToPoint(verticalLine, self.myLabel.center.x, -11)
//        CGContextStrokePath(verticalLine)
//    }
    
    func drawLineFromPoint(start : CGPoint, toPoint end:CGPoint, ofColor lineColor: UIColor, inView view:UIView) {
        
//        //design the path
//        var path = UIBezierPath()
//        path.moveToPoint(start)
//        path.addLineToPoint(end)
//        
//        //design path in layer
//        var shapeLayer = CAShapeLayer()
//        shapeLayer.path = path.CGPath
//        shapeLayer.strokeColor = lineColor.CGColor
//        shapeLayer.lineWidth = 6.0
//        
//        view.layer.addSublayer(shapeLayer)
    }
    
}
