//
//  DetailViewController.swift
//  C
//
//  Created by Deepak Dewani on 24/01/16.
//  Copyright © 2016 Deepak Dewani. All rights reserved.
//

import UIKit

///*------------------------------------------------------------------------------------------------*///
//MARK: to find the height of the given string
extension NSString {
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.max)
        
        let boundingBox = self.boundingRectWithSize(constraintRect, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        
        return boundingBox.height
    }
}
///*------------------------------------------------------------------------------------------------*///


class DetailViewController: UIViewController {
    
//    @IBOutlet weak var descriptionBackgroungHeight: NSLayoutConstraint!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var syntaxLabel: UILabel!
    @IBOutlet weak var exampleLabel: UILabel!
    @IBOutlet weak var compileButton: UIButton!
    @IBOutlet weak var exampleHeadingLabel: UILabel!
    @IBOutlet weak var syntaxHeadingLabel: UILabel!
    @IBOutlet weak var backgroundDescriptionView: UIView!
    
    
    var allStrings = [NSMutableAttributedString]()
    var fileNames = [String]()
    var fileArray = [NSString]()
    var range = [NSMakeRange(0,0)]
    let paragraphStyle = NSMutableParagraphStyle()
    var replacements: [String : [NSObject : AnyObject]]!
    
    var deviceName = ""
    
    
    var topicName = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
               
        if deviceName == "iPad" {
            descriptionLabel.font = UIFont(name: "Verdana", size: 22)
            syntaxLabel.font = UIFont(name: "Menlo", size: 20)
            exampleLabel.font = UIFont(name: "Menlo", size: 20)
            
            
            exampleHeadingLabel.font = UIFont(name: "Verdana", size: 32)
            syntaxHeadingLabel.font = UIFont(name: "Verdana", size: 32)
            
            
        }
        else {
            
            exampleHeadingLabel.font = UIFont(name: "Verdana", size: 22)
            syntaxHeadingLabel.font = UIFont(name: "Verdana", size: 22)
            
            descriptionLabel.font = UIFont(name: "Menlo", size: 13)
            syntaxLabel.font = UIFont(name: "Menlo", size: 13)
            exampleLabel.font = UIFont(name: "Menlo", size: 13)
            
        }
        
        createHighlightPatterns()
        
        compileButton.layer.cornerRadius = 5
        
        
        for i in 0 ..< 4  {
            getStringFromFile(fileNames[i] as String,index:i)
            
        }
        descriptionLabel.attributedText = allStrings[0]
        syntaxLabel.attributedText = allStrings[1]
        exampleLabel.attributedText = allStrings[2]
        
//        let textHeight = heightForView(fileArray[2] as String, font: UIFont(name: "Menlo", size: 13)!, width: 380)
//        
//        let lineView: UIView = UIView(frame: CGRectMake(22, 0, 1, textHeight))
//        lineView.backgroundColor = UIColor.lightGrayColor()
        
//        self.view!.addSubview(lineView)
        
//        self.exampleLabel.addSubview(lineView)
        
        self.navigationController?.navigationBar.topItem?.title = ""
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        //        let textColor = UIColor(red: 101/255.0, green: 13/255.0, blue: 0/255.0, alpha:1.0)
        //        let attributes = [
        //            NSForegroundColorAttributeName : textColor,
        //            NSFontAttributeName : UIFont(name: "Verdana", size: 22)!,
        //            NSTextEffectAttributeName : NSTextEffectLetterpressStyle
        //        ]
        //
        //        let attributedExampleString = NSMutableAttributedString(string: "Example", attributes: attributes)
        //        exampleHeadingLabel.attributedText = attributedExampleString
        //
        //        let attributedSyntaxString = NSMutableAttributedString(string: "Syntax", attributes: attributes)
        //        syntaxHeadingLabel.attributedText = attributedSyntaxString
    }
    

    
    // function to calculate label height
//    func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat{
//        let label:UILabel = UILabel(frame: CGRectMake(0, 0, width, CGFloat.max))
//        label.numberOfLines = 0
//        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
//        label.font = font
//        label.text = text
//        
//        label.sizeToFit()
//        return label.frame.height
//    }
    
    //function to get the string from file
    func getStringFromFile(fileName:String, index:Int) {
        
        let bundle = NSBundle.mainBundle()
        let path = bundle.pathForResource(fileName, ofType: "txt")
        do {
            fileArray.append(try NSString(contentsOfFile: path!, encoding: NSUTF8StringEncoding))
            allStrings.append(NSMutableAttributedString(string: fileArray[index] as String))
            
            let lengthOfString = allStrings[index].length
            range.append(NSMakeRange(0, lengthOfString))
            paragraphStyle.lineSpacing = 2
            allStrings[index].addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: range[index+1])
            performReplacementsForRange(range[index+1], myString: fileArray[index] as String, attString: allStrings[index])
        }
        catch {/* error handling here */}
        
    }
    
    //applying styles to the string using the regexes
    func applyStylesToRange(searchRange: NSRange, originalString: String, attributedString: NSMutableAttributedString) {
        // iterate over each replacement
        for (pattern, attributes) in replacements {
            do {
                let regex = try NSRegularExpression(pattern: pattern, options: [])
                regex.enumerateMatchesInString(originalString, options: [], range: searchRange) {
                    match, flags, stop in
                    // apply the style
                    let matchRange = match!.rangeAtIndex(1)
                    attributedString.addAttributes(attributes as! [String:AnyObject], range: matchRange)
                    
                }
            }
            catch let error as NSError{
                print(error)
                
            }
        }
        
    }
    
    func performReplacementsForRange(changedRange: NSRange, myString: String, attString: NSMutableAttributedString) {
        
        
        var extendedRange = NSUnionRange(changedRange, NSString(string: myString).lineRangeForRange(NSMakeRange(changedRange.location, 0)))
        
        extendedRange = NSUnionRange(changedRange, NSString(string: myString).lineRangeForRange(NSMakeRange(NSMaxRange(changedRange), 0)))
        
        applyStylesToRange(extendedRange, originalString: myString, attributedString: attString)
    }
    
    
    
    //adding attributed style
    func createAttributesForFontStyle(style: String, withTrait trait: UIFontDescriptorSymbolicTraits) -> [String : AnyObject] {
        let fontDescriptor = UIFontDescriptor.preferredFontDescriptorWithTextStyle(UIFontTextStyleBody)
        let descriptorWithTrait = fontDescriptor.fontDescriptorWithSymbolicTraits(trait)
        let font = UIFont(descriptor: descriptorWithTrait, size: 0)
        return [NSFontAttributeName : font]
    }
    
    func createHighlightPatterns() {
        
        //        let scriptFontDescriptor = UIFontDescriptor(fontAttributes: [UIFontDescriptorFamilyAttribute : "Zapfino"])
        
        // 1. base our script font on the preferred body font size
        //        let bodyFontDescriptor = UIFontDescriptor.preferredFontDescriptorWithTextStyle(UIFontTextStyleBody)
        //        let bodyFontSize = bodyFontDescriptor.fontAttributes()[UIFontDescriptorSizeAttribute] as! NSNumber
        //        let scriptFont = UIFont(descriptor: scriptFontDescriptor, size: CGFloat(bodyFontSize.floatValue))
        
        // 2. create the attributes
                let boldAttributes = createAttributesForFontStyle(UIFontTextStyleBody, withTrait:.TraitBold)
        //        let italicAttributes = createAttributesForFontStyle(UIFontTextStyleBody, withTrait:.TraitItalic)
        //        let strikeThroughAttributes = [NSStrikethroughStyleAttributeName : 1]
        //        let scriptAttributes = [NSFontAttributeName : scriptFont]
        //        let redTextAttributes = [NSForegroundColorAttributeName : UIColor.redColor()]
        
        let numberAttributes = [NSForegroundColorAttributeName : UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1.0)]
        
        let includeAttributes = [NSForegroundColorAttributeName : UIColor(red: 140/255, green: 74/255, blue: 55/255, alpha: 1.0)]
        
        let angleBracketsAttributes = [NSForegroundColorAttributeName : UIColor(red: 14/255, green: 97/255, blue: 38/255, alpha: 1.0)]
        
        let mainAttributes = [NSForegroundColorAttributeName : UIColor(red: 191/255, green: 80/255, blue: 35/255, alpha: 1.0)]
        
        let keywordsAttributes = [NSForegroundColorAttributeName : UIColor(red: 167/255, green: 29/255, blue: 94/255, alpha: 1.0)]
        
        let decimalAttributes = [NSForegroundColorAttributeName : UIColor(red: 129/255, green: 32/255, blue: 35/255, alpha: 1.0)]
        
        let functionsAttributes = [NSForegroundColorAttributeName : UIColor(red: 130/255, green: 57/255, blue: 25/255, alpha: 1.0)]
        
        let quotesAttributes = [NSForegroundColorAttributeName : UIColor(red: 14/255, green: 97/255, blue: 38/255, alpha: 1.0)]
        
        let percentageAttributes = [NSForegroundColorAttributeName : UIColor(red: 105/255, green: 105/255, blue: 105/255, alpha: 1.0)]
        
        let forAttributes = [NSForegroundColorAttributeName : UIColor(red: 130/255, green: 74/255, blue: 55/255, alpha: 1.0)]
        
        let returnAttributes = [NSForegroundColorAttributeName : UIColor(red: 130 / 255, green: 74/255, blue: 55/255, alpha: 1.0)]
        
        
        // construct a dictionary of replacements based on regexes
        
        replacements = [
//            "(\\?*\\w+\\?*)" : boldAttributes,
            //            "(_\\w+(\\s\\w+)*_)" : italicAttributes,
            //            "(-\\w+(\\s\\w+)*-)" : strikeThroughAttributes,
            //            "(~\\w+(\\s\\w+)*~)" : scriptAttributes,
            //            "\\s([A-Z]{2,})\\s" : redTextAttributes,
            
            "([0-9]+\\.)\\s" : numberAttributes,
            "(\\bmain\\b)" : mainAttributes,
            "(\\breturn\\b)" : returnAttributes,
            "(\\bloop(s)*\\b)" : keywordsAttributes,
            "(\\bfor\\b)" : forAttributes,
            "(\\bint\\b)" : keywordsAttributes,
            "(\\bfloat\\b)" : keywordsAttributes,
            "(\\bdouble\\b)" : keywordsAttributes,
            "(\\bwhile\\b)" : keywordsAttributes,
            "(\\bdo\\b)" : keywordsAttributes,
            "(\\bif\\b)" : keywordsAttributes,
            "(\\belse\\b)" : keywordsAttributes,
            "(\\bprintf\\b)" : functionsAttributes,
            "(\\bscanf\\b)" : functionsAttributes,
            "(\\binclude\\b)" : includeAttributes,
            "([0-9](?=;))" : decimalAttributes,
//            "(\"\\w+(\\s\\w+)*[.:-=]*(\\\\)*(\\w)*\")" : quotesAttributes,
            "(\".*\")" : quotesAttributes,
            "(\\%\\w)" : percentageAttributes,
            "(\\<\\w+\\.\\w\\>)" : angleBracketsAttributes,
            "(\\bstring.h\\b)" : angleBracketsAttributes,
            "(\\bmath.h\\b)" : angleBracketsAttributes
            
        ]
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
