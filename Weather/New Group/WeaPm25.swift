//
//	WeaPm25.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct WeaPm25{

	var advice : String!
	var aqi : String!
	var citycount : Int!
	var cityrank : Int!
	var co : String!
	var color : String!
	var level : String!
	var no2 : String!
	var o3 : String!
	var pm10 : String!
	var pm25 : String!
	var quality : String!
	var so2 : String!
	var timestamp : String!
	var upDateTime : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		advice = dictionary["advice"] as? String
		aqi = dictionary["aqi"] as? String
		citycount = dictionary["citycount"] as? Int
		cityrank = dictionary["cityrank"] as? Int
		co = dictionary["co"] as? String
		color = dictionary["color"] as? String
		level = dictionary["level"] as? String
		no2 = dictionary["no2"] as? String
		o3 = dictionary["o3"] as? String
		pm10 = dictionary["pm10"] as? String
		pm25 = dictionary["pm25"] as? String
		quality = dictionary["quality"] as? String
		so2 = dictionary["so2"] as? String
		timestamp = dictionary["timestamp"] as? String
		upDateTime = dictionary["upDateTime"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if advice != nil{
			dictionary["advice"] = advice
		}
		if aqi != nil{
			dictionary["aqi"] = aqi
		}
		if citycount != nil{
			dictionary["citycount"] = citycount
		}
		if cityrank != nil{
			dictionary["cityrank"] = cityrank
		}
		if co != nil{
			dictionary["co"] = co
		}
		if color != nil{
			dictionary["color"] = color
		}
		if level != nil{
			dictionary["level"] = level
		}
		if no2 != nil{
			dictionary["no2"] = no2
		}
		if o3 != nil{
			dictionary["o3"] = o3
		}
		if pm10 != nil{
			dictionary["pm10"] = pm10
		}
		if pm25 != nil{
			dictionary["pm25"] = pm25
		}
		if quality != nil{
			dictionary["quality"] = quality
		}
		if so2 != nil{
			dictionary["so2"] = so2
		}
		if timestamp != nil{
			dictionary["timestamp"] = timestamp
		}
		if upDateTime != nil{
			dictionary["upDateTime"] = upDateTime
		}
		return dictionary
	}

}