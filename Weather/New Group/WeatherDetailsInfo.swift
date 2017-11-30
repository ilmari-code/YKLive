//
//	WeatherDetailsInfo.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct WeatherDetailsInfo{

	var publishTime : String!
	var weather3HoursDetailsInfos : [Weather3HoursDetailsInfo]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		publishTime = dictionary["publishTime"] as? String
		weather3HoursDetailsInfos = [Weather3HoursDetailsInfo]()
		if let weather3HoursDetailsInfosArray = dictionary["weather3HoursDetailsInfos"] as? [[String:Any]]{
			for dic in weather3HoursDetailsInfosArray{
				let value = Weather3HoursDetailsInfo(fromDictionary: dic)
				weather3HoursDetailsInfos.append(value)
			}
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if publishTime != nil{
			dictionary["publishTime"] = publishTime
		}
		if weather3HoursDetailsInfos != nil{
			var dictionaryElements = [[String:Any]]()
			for weather3HoursDetailsInfosElement in weather3HoursDetailsInfos {
				dictionaryElements.append(weather3HoursDetailsInfosElement.toDictionary())
			}
			dictionary["weather3HoursDetailsInfos"] = dictionaryElements
		}
		return dictionary
	}

}