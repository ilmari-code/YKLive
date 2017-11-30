//
//	YKCreator.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class YKCreator : NSObject, NSCoding{

	var gender : Int!
	var id : Int!
	var level : Int!
	var nick : String!
	var portrait : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		gender = dictionary["gender"] as? Int
		id = dictionary["id"] as? Int
		level = dictionary["level"] as? Int
		nick = dictionary["nick"] as? String
		portrait = dictionary["portrait"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if gender != nil{
			dictionary["gender"] = gender
		}
		if id != nil{
			dictionary["id"] = id
		}
		if level != nil{
			dictionary["level"] = level
		}
		if nick != nil{
			dictionary["nick"] = nick
		}
		if portrait != nil{
			dictionary["portrait"] = portrait
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         gender = aDecoder.decodeObject(forKey: "gender") as? Int
         id = aDecoder.decodeObject(forKey: "id") as? Int
         level = aDecoder.decodeObject(forKey: "level") as? Int
         nick = aDecoder.decodeObject(forKey: "nick") as? String
         portrait = aDecoder.decodeObject(forKey: "portrait") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if gender != nil{
			aCoder.encode(gender, forKey: "gender")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if level != nil{
			aCoder.encode(level, forKey: "level")
		}
		if nick != nil{
			aCoder.encode(nick, forKey: "nick")
		}
		if portrait != nil{
			aCoder.encode(portrait, forKey: "portrait")
		}

	}

}