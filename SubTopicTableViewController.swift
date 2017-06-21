//
//  SubTopicTableViewController.swift
//  C
//
//  Created by Deepak Dewani on 24/01/16.
//  Copyright © 2016 Deepak Dewani. All rights reserved.
//

import UIKit

class SubTopicTableViewController: UITableViewController {

    @IBOutlet weak var topicImageView: UIImageView!
    @IBOutlet weak var topicNameLabel: UILabel!
    @IBOutlet weak var numberOfSubTopics: UILabel!
    @IBOutlet weak var bookMarkImageView: UIImageView!
    
    var subTopicModel = SubTopicModel()
    var topicModel = TopicModel()
    var fileNamesModel = FileNamesModel()
    
    var numberOfSubTopicsForTopic = 0
    var subTopicArray = []
    var number = 0
    var topicImage = UIImage()
    var topicName = ""
    var numberOfSubTopic = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(subTopicArray.count)
        //assigning the logo the title of the view
//        let logoImage = UIImage(named:"navigation-bar-icon")
//        self.navigationItem.titleView = UIImageView(image: logoImage)
        
        
        tableView.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1.0)
        tableView.separatorColor = UIColor.clearColor()
        
        topicImageView.image = topicImage
        topicNameLabel.text = topicName
        numberOfSubTopics.text = numberOfSubTopic
        
    }
    
    override func viewDidAppear(animated: Bool) {
//        self.animateTable()
    }
    
    override func viewWillAppear(animated: Bool) {
        
        tableView.reloadData()
        self.animateTable()
    }
    
    override func viewDidDisappear(animated: Bool) {
        number = 0
    }
    
    //animating the table
    
    func animateTable() {
        
        topicImageView.alpha = 0
        topicNameLabel.alpha = 0
        numberOfSubTopics.alpha = 0
        bookMarkImageView.alpha = 0
        
        UIView.animateWithDuration(0.7) { () -> Void in
            self.topicImageView.alpha = 1
            self.topicNameLabel.alpha = 1
            self.numberOfSubTopics.alpha = 1
            self.bookMarkImageView.alpha = 1
        }
        
        let cells = tableView.visibleCells
        
        for cell in cells {
            let myCell: SubTopicTableViewCell = cell as! SubTopicTableViewCell
            myCell.numberImageview.transform = CGAffineTransformMakeScale(0, 0)
        }
        
        var index = 0
        
        for cell in cells {
            let cell: SubTopicTableViewCell = cell as! SubTopicTableViewCell
            UIView.animateWithDuration(0.5, delay: 0.05 * Double(index), usingSpringWithDamping: 2, initialSpringVelocity: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                cell.numberImageview.transform = CGAffineTransformIdentity
                }, completion: nil)
            
            index += 1
        }
        
    }
    
    
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return numberOfSubTopicsForTopic
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("subTopicCell", forIndexPath: indexPath) as! SubTopicTableViewCell

        // Configure the cell...
        
        cell.subTopicLabel.text = subTopicArray[indexPath.item] as? String
        
        //customising the cell
        cell.numberLabel.text = "0" + String(++number)
        
//        cell.numberImageview.layer.cornerRadius = cell.numberImageview.bounds.width / 2
//        cell.numberImageview.clipsToBounds = true
        
        cell.backgroundColor = UIColor.clearColor()

        return cell
    }
    
//    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        
//        
//        let  headerCell = tableView.dequeueReusableCellWithIdentifier("headerCell") as! SubTopicDetailTableViewCell
//        headerCell.backgroundColor = UIColor.whiteColor()
//        
//        switch (section) {
//        case 0:
//            headerCell.headerLabel.text = "Europe";
//            //return sectionHeaderView
//        case 1:
//            headerCell.headerLabel.text = "Asia";
//            //return sectionHeaderView
//        case 2:
//            headerCell.headerLabel.text = "South America";
//            //return sectionHeaderView
//        default:
//            headerCell.headerLabel.text = "Other";
//        }
//        
//        return headerCell
//    }
//    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let indexPath = tableView.indexPathForSelectedRow!.row
        let detailVC = segue.destinationViewController as! DetailViewController
        detailVC.topicName = topicName
        
        
        switch topicName {
            
        case "Introduction":
            detailVC.fileNames = fileNamesModel.introductionFileNames[indexPath]
            
        case "Arrays":
            detailVC.fileNames = fileNamesModel.arrayFileNames[indexPath]

            
        case "Strings":
            detailVC.fileNames = fileNamesModel.stringFileNames[indexPath]

            
        case "Decision":
            detailVC.fileNames = fileNamesModel.decisionFileNames[indexPath]

            
        case "Loops":
            detailVC.fileNames = fileNamesModel.loopFileNames[indexPath]

            
        case "Functions":
            detailVC.fileNames = fileNamesModel.functionFileNames[indexPath]

            
        case "Structures":
            detailVC.fileNames = fileNamesModel.structureFileNames[indexPath]

            
        case "Pointers":
            detailVC.fileNames = fileNamesModel.pointerFileNames[indexPath]

            
        case "Files I/O":
            detailVC.fileNames = fileNamesModel.filesFileNames[indexPath]

            
        case "Miscellaneous":
            detailVC.fileNames = fileNamesModel.miscellaneousFileNames[indexPath]

            
        default: break
            
            
            
        }
        
        
    }
    

}
