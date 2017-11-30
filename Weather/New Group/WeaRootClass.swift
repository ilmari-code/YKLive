//
//	WeaRootClass.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct WeaRootClass{

	var code : String!
	var message : String!
	var redirect : String!
	var value : [WeaValue]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		code = dictionary["code"] as? String
		message = dictionary["message"] as? String
		redirect = dictionary["redirect"] as? String
		value = [WeaValue]()
		if let valueArray = dictionary["value"] as? [[String:Any]]{
			for dic in valueArray{
				let value1 = WeaValue(fromDictionary: dic)
				value.append(value1)
			}
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if code != nil{
			dictionary["code"] = code
		}
		if message != nil{
			dictionary["message"] = message
		}
		if redirect != nil{
			dictionary["redirect"] = redirect
		}
		if value != nil{
			var dictionaryElements = [[String:Any]]()
			for valueElement in value {
				dictionaryElements.append(valueElement.toDictionary())
			}
			dictionary["value"] = dictionaryElements
		}
		return dictionary
	}

}
