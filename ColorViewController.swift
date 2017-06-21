//
//  ColorViewController.swift
//  C
//
//  Created by Deepak Dewani on 04/02/16.
//  Copyright © 2016 Deepak Dewani. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {

    @IBOutlet weak var switchCol: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func changeColor(sender: AnyObject) {
        
        if switchCol.on {
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.view.backgroundColor = UIColor.lightGrayColor()

            })
            

        }
        else {
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.view.backgroundColor = UIColor.whiteColor()
                
            })
        }
        
        
        
    }


}
