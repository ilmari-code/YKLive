//
//  Content.swift
//  YKLive
//
//  Created by Mr_Jia on 2017/11/29.
//  Copyright © 2017年 Mr_Jia. All rights reserved.
//

import UIKit

struct Content : Codable {
    var read_count : Int!
    var media_name : String!
    var abstract   : String!
    var title      : String!
    var share_url  : String!
    init(fromDictionary dictionary: [String:Any]){
        media_name = (dictionary["media_name"] as? String)!
        read_count = dictionary["read_count"] as? Int
        abstract = dictionary["abstract"] as? String
        title    = dictionary["title"] as? String
        share_url    = dictionary["share_url"] as? String
    }

}
