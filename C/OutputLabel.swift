//
//  OutputLabel.swift
//  C
//
//  Created by Deepak Dewani on 02/02/16.
//  Copyright © 2016 Deepak Dewani. All rights reserved.
//

import UIKit

class OutputLabel: UILabel {

    override func drawTextInRect(rect: CGRect) {
        let newRect = CGRectOffset(rect, 15, 8) // move text 10 points to the right
        super.drawTextInRect(newRect)
    }

}
