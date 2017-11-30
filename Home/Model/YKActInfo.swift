//
//	YKActInfo.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class YKActInfo : NSObject, NSCoding{

	var icon : String!
	var uid : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		icon = dictionary["icon"] as? String
		uid = dictionary["uid"] as? Int
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if icon != nil{
			dictionary["icon"] = icon
		}
		if uid != nil{
			dictionary["uid"] = uid
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         icon = aDecoder.decodeObject(forKey: "icon") as? String
         uid = aDecoder.decodeObject(forKey: "uid") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if icon != nil{
			aCoder.encode(icon, forKey: "icon")
		}
		if uid != nil{
			aCoder.encode(uid, forKey: "uid")
		}

	}

}