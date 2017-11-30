//
//	WeaRealtime.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct WeaRealtime{

	var img : String!
	var sD : String!
	var sendibleTemp : String!
	var temp : String!
	var time : String!
	var wD : String!
	var wS : String!
	var weather : String!
	var ziwaixian : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		img = dictionary["img"] as? String
		sD = dictionary["sD"] as? String
		sendibleTemp = dictionary["sendibleTemp"] as? String
		temp = dictionary["temp"] as? String
		time = dictionary["time"] as? String
		wD = dictionary["wD"] as? String
		wS = dictionary["wS"] as? String
		weather = dictionary["weather"] as? String
		ziwaixian = dictionary["ziwaixian"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if img != nil{
			dictionary["img"] = img
		}
		if sD != nil{
			dictionary["sD"] = sD
		}
		if sendibleTemp != nil{
			dictionary["sendibleTemp"] = sendibleTemp
		}
		if temp != nil{
			dictionary["temp"] = temp
		}
		if time != nil{
			dictionary["time"] = time
		}
		if wD != nil{
			dictionary["wD"] = wD
		}
		if wS != nil{
			dictionary["wS"] = wS
		}
		if weather != nil{
			dictionary["weather"] = weather
		}
		if ziwaixian != nil{
			dictionary["ziwaixian"] = ziwaixian
		}
		return dictionary
	}

}