//
//  WeaCitys.swift
//  YKLive
//
//  Created by Mr_Jia on 2017/11/30.
//  Copyright © 2017年 Mr_Jia. All rights reserved.
//

import UIKit

struct WeaCitys {
    var cities : [WeaCity]!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        cities = [WeaCity]()
        if let citiesArray = dictionary["cities"] as? [[String:Any]]{
            for dic in citiesArray{
                let value = WeaCity(fromDictionary: dic)
                cities.append(value)
            }
        }
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if cities != nil{
            var dictionaryElements = [[String:Any]]()
            for citiesElement in cities {
                dictionaryElements.append(citiesElement.toDictionary())
            }
            dictionary["cities"] = dictionaryElements
        }
        return dictionary
    }


}
