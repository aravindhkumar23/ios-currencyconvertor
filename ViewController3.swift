//
//  ViewController3.swift
//  dropdown
//
//  Created by Administrator on 31/12/15.
//  Copyright © 2015 test. All rights reserved.
//

import UIKit


class ViewController3: UIViewController,UITableViewDelegate {
    
    @IBOutlet weak var tvJSON: UITableView!

var TableData:Array< String > = Array < String >()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
        jsonParsingFromFile()

        // Do any additional setup after loading the view.
//        https://api.myjson.com/bins/3nldf 
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func jsonParsingFromFile()
    {
        let path: NSString = NSBundle.mainBundle().pathForResource("tutorial", ofType: "json")!
        let data : NSData = try! NSData(contentsOfFile: path as String, options: NSDataReadingOptions.DataReadingMapped)
        print("parsing loaded")
        print(data.length)
        let parsedValue = NSString(data: data, encoding: NSUTF8StringEncoding)
        print(parsedValue)
        self.extract_json(parsedValue!)


    }
    func extract_json(data:NSString)
    {
        
        let jsonData:NSData = data.dataUsingEncoding(NSASCIIStringEncoding)!
        do {
       if let json: AnyObject? = try NSJSONSerialization.JSONObjectWithData(jsonData, options: []) as! NSArray {
        
            if let countries_list = json as? NSArray
            {
                for (var i = 0; i < countries_list.count ; i++ )
                {
                    if let country_obj = countries_list[i] as? NSDictionary
                    {
                        if let country_name = country_obj["country"] as? String
                        {
                            if let country_code = country_obj["code"] as? String
                            {
                                TableData.append(country_name + " [" + country_code + "]")
                                print("appending dara success ")
                            }
                        }
                    }
                }
            }
        
        do_table_refresh()
        }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
    }
    func do_table_refresh()
    {
        dispatch_async(dispatch_get_main_queue(), {
            self.tvJSON.reloadData()
            return
        })
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return TableData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell=UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "jsonValueCell")
        cell.textLabel?.text=TableData[indexPath.row]
        return cell
    }
//click event
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let currentCell = tableView.cellForRowAtIndexPath(indexPath)! as UITableViewCell
        let txt=currentCell.textLabel!.text!
        tovalue = txt
        self.performSegueWithIdentifier("jsonSegreturn" , sender: txt)
        //        print(fromvalue)
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
