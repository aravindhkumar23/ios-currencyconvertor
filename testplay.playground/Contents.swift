//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
print(str)


let url = "http://www.google.com"
get(url);
func get(url : String){
    let url = NSURL(string: url)
    let request = NSMutableURLRequest(URL: url!);
    request.HTTPMethod = "GET"
    
    let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
        data, response, error in
        
        //in case of error
        if error != nil {
            return
        }
        
        let responseString : String = String(data: data!, encoding: NSUTF8StringEncoding)!
        successHandler(response: responseString)
    }
    task.resume();
}