//
//	YKLabel.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class YKLabel : NSObject, NSCoding{

	var cl : [Int]!
	var tabKey : String!
	var tabName : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		cl = dictionary["cl"] as? [Int]
		tabKey = dictionary["tab_key"] as? String
		tabName = dictionary["tab_name"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if cl != nil{
			dictionary["cl"] = cl
		}
		if tabKey != nil{
			dictionary["tab_key"] = tabKey
		}
		if tabName != nil{
			dictionary["tab_name"] = tabName
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         cl = aDecoder.decodeObject(forKey: "cl") as? [Int]
         tabKey = aDecoder.decodeObject(forKey: "tab_key") as? String
         tabName = aDecoder.decodeObject(forKey: "tab_name") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if cl != nil{
			aCoder.encode(cl, forKey: "cl")
		}
		if tabKey != nil{
			aCoder.encode(tabKey, forKey: "tab_key")
		}
		if tabName != nil{
			aCoder.encode(tabName, forKey: "tab_name")
		}

	}

}