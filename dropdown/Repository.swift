//
//  Repository.swift
//  dropdown
//
//  Created by Administrator on 31/12/15.
//  Copyright © 2015 test. All rights reserved.
//

import Foundation
import UIKit

class Repository {
    
    var name: String?
    var description: String?
    var html_url: String?
    
    init(json: NSDictionary) {
        self.name = json["name"] as? String
        self.description = json["description"] as? String
        self.html_url = json["html_url"] as? String
    }
}