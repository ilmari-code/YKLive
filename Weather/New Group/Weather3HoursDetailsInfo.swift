//
//	Weather3HoursDetailsInfo.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Weather3HoursDetailsInfo{

	var endTime : String!
	var highestTemperature : String!
	var img : String!
	var isRainFall : String!
	var lowerestTemperature : String!
	var precipitation : String!
	var startTime : String!
	var wd : String!
	var weather : String!
	var ws : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		endTime = dictionary["endTime"] as? String
		highestTemperature = dictionary["highestTemperature"] as? String
		img = dictionary["img"] as? String
		isRainFall = dictionary["isRainFall"] as? String
		lowerestTemperature = dictionary["lowerestTemperature"] as? String
		precipitation = dictionary["precipitation"] as? String
		startTime = dictionary["startTime"] as? String
		wd = dictionary["wd"] as? String
		weather = dictionary["weather"] as? String
		ws = dictionary["ws"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if endTime != nil{
			dictionary["endTime"] = endTime
		}
		if highestTemperature != nil{
			dictionary["highestTemperature"] = highestTemperature
		}
		if img != nil{
			dictionary["img"] = img
		}
		if isRainFall != nil{
			dictionary["isRainFall"] = isRainFall
		}
		if lowerestTemperature != nil{
			dictionary["lowerestTemperature"] = lowerestTemperature
		}
		if precipitation != nil{
			dictionary["precipitation"] = precipitation
		}
		if startTime != nil{
			dictionary["startTime"] = startTime
		}
		if wd != nil{
			dictionary["wd"] = wd
		}
		if weather != nil{
			dictionary["weather"] = weather
		}
		if ws != nil{
			dictionary["ws"] = ws
		}
		return dictionary
	}

}