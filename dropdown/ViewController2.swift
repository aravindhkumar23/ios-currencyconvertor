//
//  ViewController2.swift
//  dropdown
//
//  Created by Administrator on 24/12/15.
//  Copyright © 2015 test. All rights reserved.
//

import UIKit

class ViewController2: UIViewController,UITableViewDelegate {

    
     var arrayfrom = ["IND","US","PAK"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrayfrom.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell=UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel?.text=arrayfrom[indexPath.row]
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let currentCell = tableView.cellForRowAtIndexPath(indexPath)! as UITableViewCell
        let txt=currentCell.textLabel!.text!
        fromvalue = txt
        self.performSegueWithIdentifier("segreturn" , sender: txt)
//        print(fromvalue)
    }
    func testingValue(sender: AnyObject?){

        print("sender fir=ind \(sender!)")
//        tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
        
        
    }
    

    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segreturn"{
             print("segue==== \(sender)"  )
//            var secondViewController : SecondViewController = segue.destinationViewController as SecondViewController
//            
//            var indexPath = self.tableview.indexPathForSelectedRow() //get index of data for selected row
//            
//            secondViewController.data = self.dataArray.objectAtIndex(indexPath.row) // get data by index and pass it to second view controller
            
        }
    }
    }



