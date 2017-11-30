//
//	WeaIndexe.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct WeaIndexe{

	var abbreviation : String!
	var alias : String!
	var content : String!
	var level : String!
	var name : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		abbreviation = dictionary["abbreviation"] as? String
		alias = dictionary["alias"] as? String
		content = dictionary["content"] as? String
		level = dictionary["level"] as? String
		name = dictionary["name"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if abbreviation != nil{
			dictionary["abbreviation"] = abbreviation
		}
		if alias != nil{
			dictionary["alias"] = alias
		}
		if content != nil{
			dictionary["content"] = content
		}
		if level != nil{
			dictionary["level"] = level
		}
		if name != nil{
			dictionary["name"] = name
		}
		return dictionary
	}

}