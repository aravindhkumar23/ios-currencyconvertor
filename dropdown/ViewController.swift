//
//  ViewController.swift
//  dropdown
//
//  Created by Administrator on 24/12/15.
//  Copyright © 2015 test. All rights reserved.
//

import UIKit
var fromvalue : String = "Tap To Select"
var tovalue : String = "Tap To Select"

class ViewController: UIViewController {

   
    @IBOutlet weak var fromButton: UIButton!
    
    
    @IBOutlet weak var labelToValue: UILabel!
    @IBOutlet weak var labelFromValue: UILabel!
    
    @IBOutlet weak var labelResult: UILabel!
    
    @IBAction func toButton(sender: UIButton) {
        
    }
    @IBAction func formSubmit(sender: AnyObject) {
        let values = labelFromValue.text
        print("from valu btn click \(values)")
        let url = NSURL(string: "http://www.google.com/finance/converter?a=1&from=USD&to=INR")!
       
       let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
        
        if let url_content = data{
            let webcontent = NSString(data: url_content, encoding: NSISOLatin1StringEncoding)
//            print(webcontent)
            let websitearray = webcontent?.componentsSeparatedByString("<div id=currency_converter_result>")
//            print(websitearray![0])
//            print("--------------------")
            if websitearray?.count >  0
            {
                 let fetchedValue = websitearray![1].componentsSeparatedByString("<span class=bld>")
                if fetchedValue.count>0
                {
//                    print("-------------------->")
//                    print(fetchedValue.count)
                    let fval = fetchedValue[1].componentsSeparatedByString("</span>")
                    print(fval[0])
                      print("-------------------->")
                    let currency = fval[0]
                    print(currency)
                   dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.labelResult.text=currency
                   })
                    
//
                }
            }
           
            print(websitearray![1])
        }
        }
        
        task.resume()
        
        
        
    }
        override func viewDidLoad() {
        super.viewDidLoad()
            labelFromValue.text=fromvalue
            labelToValue.text = tovalue
            labelResult.text=""
//            toButton.setTitle(tovalue, forState: UIControlState.Normal)

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print(sender!)
        
        
        if segue.identifier == "segFirstToSecond"{
            print("to segue==== \(sender!)"  )
//            if sender as! String == "toButtonTest"{
//                 print("if condut")
//            }
            let svc = segue.destinationViewController as! ViewController2
            svc.testingValue(sender)
        }
    }


}

