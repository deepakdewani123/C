//
//  TopicTableViewController.swift
//  C
//
//  Created by Deepak Dewani on 23/01/16.
//  Copyright © 2016 Deepak Dewani. All rights reserved.
//

import UIKit



class TopicTableViewController: UITableViewController {
    
    var topicModel = TopicModel() //creating an instance of TopicModel to access the properties
    var subTopicModel = SubTopicModel()
    var defaults = NSUserDefaults.standardUserDefaults()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        defaults.setBool(true, forKey: "viewDidLoadForFirstTime")
        
        
        //setting the logo to the navigation bar throughout the app
        let imageView: UIImageView = UIImageView(image: UIImage(named: "navigation-bar-icon"))
        let imageSize: CGSize = CGSizeMake(50, 50)
        let marginX: CGFloat = (self.navigationController!.navigationBar.frame.size.width / 2) - (imageSize.width / 2)
        imageView.frame = CGRectMake(marginX, -5, imageSize.width, imageSize.height)
        self.navigationController!.navigationBar.addSubview(imageView)
        
        
        //assigning the logo the title of the view
        //        let logoImage = UIImage(named:"navigation-bar-icon")
        //        self.navigationItem.titleView = UIImageView(image: logoImage)
        
        
        self.tableView.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        self.tableView.reloadData()
        //animating the tableView cells
        if defaults.boolForKey("viewDidLoadForFirstTime") {
            self.animateTable()
            
        }
        else {
            self.animationFromSide()
        }    }
    
    override func viewDidDisappear(animated: Bool) {
        defaults.setBool(false, forKey: "viewDidLoadForFirstTime")
        
    }
    
    
    
    //animating the table
    
    func animateTable() {
        
        let cells = tableView.visibleCells
        
        let tableHeight: CGFloat = tableView.bounds.size.height
        
        for cell in cells {
            let cell: UITableViewCell = cell as UITableViewCell
            cell.transform = CGAffineTransformMakeTranslation(0, tableHeight)
        }
        
        var index = 0
        
        for cell in cells {
            let cell: UITableViewCell = cell as UITableViewCell
            UIView.animateWithDuration(0.6, delay: 0.07 * Double(index), usingSpringWithDamping: 2, initialSpringVelocity: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                cell.transform = CGAffineTransformMakeTranslation(0, 0)
                }, completion: nil)
            
            index += 1
        }
        
    }
    
    func animationFromSide(){
        
        let cells = tableView.visibleCells
        
        for cell in cells {
            let cell: UITableViewCell = cell as UITableViewCell
            cell.center.x = self.view.frame.width - 400
        }
        for cell in cells {
            let cell: UITableViewCell = cell as UITableViewCell
            UIView.animateWithDuration(0.7, delay: 0, usingSpringWithDamping: 3, initialSpringVelocity: 4, options: UIViewAnimationOptions.CurveEaseIn, animations: ({
                cell.center.x = self.view.frame.width / 2
                
            }), completion: nil)
            
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return topicModel.topicNameArray.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("topicCell", forIndexPath: indexPath) as! TopicTableViewCell
        
        if DeviceType.IS_IPHONE_5{
            print("IS_IPHONE_5")
            cell.topicNameLabel.font = UIFont(name: "Verdana", size: 16)
        }
        else if DeviceType.IS_IPHONE_4_OR_LESS {
            cell.topicNameLabel.font = UIFont(name: "Verdana", size: 15)
            
        }
        
        // Configure the cell...
        cell.topicNameLabel.text = topicModel.topicNameArray[indexPath.item]
        cell.numberOfPartsInEachTopic.text = topicModel.numberOfSubTopicsInEachTopicArray[indexPath.item]
        cell.topicImageView.image = UIImage(named: topicModel.imageOfTopicArray[indexPath.item])
        
        //customising the cell
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "subTopicSegue" {
            
            let indexPath = tableView.indexPathForSelectedRow!.row
            let subTopicVC = segue.destinationViewController as! SubTopicTableViewController
            subTopicVC.numberOfSubTopicsForTopic = Int(topicModel.numberOfSubTopicsInEachTopicArray[indexPath])!
            subTopicVC.topicImage = UIImage(named: topicModel.imageOfTopicArray[indexPath])!
            subTopicVC.topicName = topicModel.topicNameArray[indexPath]
            subTopicVC.numberOfSubTopic = topicModel.numberOfSubTopicsInEachTopicArray[indexPath]
            
            switch indexPath {
                
            case 0:
                subTopicVC.subTopicArray = subTopicModel.introductionArray
            case 1:
                subTopicVC.subTopicArray = subTopicModel.arrayArray
            case 2:
                subTopicVC.subTopicArray = subTopicModel.stringArray
            case 3:
                subTopicVC.subTopicArray = subTopicModel.decisionArray
            case 4:
                subTopicVC.subTopicArray = subTopicModel.loopArray
            case 5:
                subTopicVC.subTopicArray = subTopicModel.functionArray
            case 6:
                subTopicVC.subTopicArray = subTopicModel.classesAndObjects
            case 7:
                subTopicVC.subTopicArray = subTopicModel.inheritance
            case 8:
                subTopicVC.subTopicArray = subTopicModel.structureArray
            case 9:
                subTopicVC.subTopicArray = subTopicModel.pointerArray
            case 10:
                subTopicVC.subTopicArray = subTopicModel.filesArray
            case 11:
                subTopicVC.subTopicArray = subTopicModel.miscArray
                
            default: break
                
                
            }
        }
        
        
        
    }
    
    
}
