//
//	YKRootClass.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class YKRootClass : NSObject, NSCoding{

	var dmError : Int!
	var errorMsg : String!
	var expireTime : Int!
	var lives : [YKLive]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		dmError = dictionary["dm_error"] as? Int
		errorMsg = dictionary["error_msg"] as? String
		expireTime = dictionary["expire_time"] as? Int
		lives = [YKLive]()
		if let livesArray = dictionary["lives"] as? [[String:Any]]{
			for dic in livesArray{
				let value = YKLive(fromDictionary: dic)
				lives.append(value)
			}
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if dmError != nil{
			dictionary["dm_error"] = dmError
		}
		if errorMsg != nil{
			dictionary["error_msg"] = errorMsg
		}
		if expireTime != nil{
			dictionary["expire_time"] = expireTime
		}
		if lives != nil{
			var dictionaryElements = [[String:Any]]()
			for livesElement in lives {
				dictionaryElements.append(livesElement.toDictionary())
			}
			dictionary["lives"] = dictionaryElements
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         dmError = aDecoder.decodeObject(forKey: "dm_error") as? Int
         errorMsg = aDecoder.decodeObject(forKey: "error_msg") as? String
         expireTime = aDecoder.decodeObject(forKey: "expire_time") as? Int
         lives = aDecoder.decodeObject(forKey :"lives") as? [YKLive]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if dmError != nil{
			aCoder.encode(dmError, forKey: "dm_error")
		}
		if errorMsg != nil{
			aCoder.encode(errorMsg, forKey: "error_msg")
		}
		if expireTime != nil{
			aCoder.encode(expireTime, forKey: "expire_time")
		}
		if lives != nil{
			aCoder.encode(lives, forKey: "lives")
		}

	}

}