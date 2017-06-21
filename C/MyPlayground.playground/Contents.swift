//: Playground - noun: a place where people can play

import UIKit

let text = "We tried to make this app as most intuitive as possible for you. If you have any questions don't hesitate to ask us. For a detailed manual just click here."
let linkTextWithColor = "click here"
var we = "We tried"

let range1 = (text as NSString).rangeOfString(linkTextWithColor)
let range2 = (text as NSString).rangeOfString(we)


let attributedString = NSMutableAttributedString(string:text)
attributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor() , range: range1)
attributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor.yellowColor() , range: range2)


var helpText = UILabel(frame: CGRect(x: 10, y: 10, width: 1500, height: 30))
//helpText.numberOfLines = 0


helpText.attributedText = attributedString

var string = "hello Swift"

if string.rangeOfString("Swift") != nil{
    print("exists")
}

// alternative: not case sensitive
if string.lowercaseString.rangeOfString("swift") != nil {
    print("exists")
}


var names = "deepak dinaish vinaish"

let fullName = "First Last"
let fullNameArr = text.characters.split{$0 == " "}.map(String.init)
// or simply:
// let fullNameArr = fullName.characters.split{" "}.map(String.init)

fullNameArr[0] // First
fullNameArr[1] // Last

func rangeFromNSRange(nsRange: NSRange, forString str: String) -> Range<String.Index>? {
    let fromUTF16 = str.utf16.startIndex.advancedBy(nsRange.location, limit: str.utf16.endIndex)
    let toUTF16 = fromUTF16.advancedBy(nsRange.length, limit: str.utf16.endIndex)
    
    
    if let from = String.Index(fromUTF16, within: str),
        let to = String.Index(toUTF16, within: str) {
            return from ..< to
    }
    
    return nil
}
//swift2


var dict = ["\\bdeepak\\b":"dewani","\\bdinesh\\b":"turshani"]
var str = "deepak is dewani,dinesh is turshani"
func matchesForRegexInText(regex: String!, text: String!) -> [String] {
    
    do {
        let regex = try NSRegularExpression(pattern: regex, options: [])
        let nsString = text as NSString
        let results = regex.matchesInString(text,
            options: [], range: NSMakeRange(0, nsString.length))
        return results.map { nsString.substringWithRange($0.range)}
    } catch let error as NSError {
        print("invalid regex: \(error.localizedDescription)")
        return []
    }
}

for (name,surname) in dict{
    print(matchesForRegexInText(name, text: str))
}


let string1 = "My name is deepak dewani. deepak"
let matches = matchesForRegexInText("\\bdeepak\\b", text: string1)
print(matches)

let dataSource = [
    "Domain CheckService",
    "IMEI check",
    "Compliant about service provider",
    "Compliant about TRA",
    "Enquires",
    "Suggestion",
    "SMS Spam",
    "Poor Coverage",
    "Help Salim"
]
let searchString = "Enq"
let predicate = NSPredicate(format: "SELF contains %@", searchString)
let searchDataSource = dataSource.filter { data in
    predicate.evaluateWithObject(data) }
print(searchDataSource)



let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".characters.map({ String($0) })

let words = ["Apple", "Banana", "Blueberry", "Eggplant","Ape"]

var result = [String:[String]]()

for letter in alphabet {
    result[letter] = []
    let matches = words.filter({ $0.hasPrefix(letter) })
    if !matches.isEmpty {
        for word in matches {
            result[letter]?.append(word)
        }
    }
}

print(result)



var duplicate = ["A","B","C","A","B","C"]

//var set =

var nonDuplicate = Array(Set(duplicate))

nonDuplicate.sort {
    return $0 < $1
}



func unique<S : SequenceType, T : Hashable where S.Generator.Element == T>(source: S) -> [T] {
    var buffer = [T]()
    var added = Set<T>()
    for elem in source {
        if !added.contains(elem) {
            buffer.append(elem)
            added.insert(elem)
        }
    }
    return buffer
}

let vals = [1, 4, 2, 2, 6, 24, 15, 2, 60, 15, 6]

let alphabets = ["a","b","c","a","b","c"]
let uniqueVals = unique(alphabets) // [1, 4, 2, 6, 24, 15, 60]


var counts:[String:Int] = [:]

for item in alphabets {
    counts[item] = (counts[item] ?? 0) + 1
}

print(counts)  // "[BAR: 1, FOOBAR: 1, FOO: 2]"

for (key, value) in counts {
    print("\(key) occurs \(value) time(s)")
}


