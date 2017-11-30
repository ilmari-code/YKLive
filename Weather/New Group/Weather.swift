//
//	Weather.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Weather{

	var date : String!
	var img : String!
	var sunDownTime : String!
	var sunRiseTime : String!
	var tempDayC : String!
	var tempDayF : String!
	var tempNightC : String!
	var tempNightF : String!
	var wd : String!
	var weather : String!
	var week : String!
	var ws : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		date = dictionary["date"] as? String
		img = dictionary["img"] as? String
		sunDownTime = dictionary["sun_down_time"] as? String
		sunRiseTime = dictionary["sun_rise_time"] as? String
		tempDayC = dictionary["temp_day_c"] as? String
		tempDayF = dictionary["temp_day_f"] as? String
		tempNightC = dictionary["temp_night_c"] as? String
		tempNightF = dictionary["temp_night_f"] as? String
		wd = dictionary["wd"] as? String
		weather = dictionary["weather"] as? String
		week = dictionary["week"] as? String
		ws = dictionary["ws"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if date != nil{
			dictionary["date"] = date
		}
		if img != nil{
			dictionary["img"] = img
		}
		if sunDownTime != nil{
			dictionary["sun_down_time"] = sunDownTime
		}
		if sunRiseTime != nil{
			dictionary["sun_rise_time"] = sunRiseTime
		}
		if tempDayC != nil{
			dictionary["temp_day_c"] = tempDayC
		}
		if tempDayF != nil{
			dictionary["temp_day_f"] = tempDayF
		}
		if tempNightC != nil{
			dictionary["temp_night_c"] = tempNightC
		}
		if tempNightF != nil{
			dictionary["temp_night_f"] = tempNightF
		}
		if wd != nil{
			dictionary["wd"] = wd
		}
		if weather != nil{
			dictionary["weather"] = weather
		}
		if week != nil{
			dictionary["week"] = week
		}
		if ws != nil{
			dictionary["ws"] = ws
		}
		return dictionary
	}

}