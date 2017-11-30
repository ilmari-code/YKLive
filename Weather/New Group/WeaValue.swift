//
//	WeaValue.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct WeaValue{

	var alarms : [WeaAlarm]!
	var city : String!
	var cityid : Int!
	var indexes : [WeaIndexe]!
	var pm25 : WeaPm25!
	var provinceName : String!
	var realtime : WeaRealtime!
	var weatherDetailsInfo : WeatherDetailsInfo!
//    var weathers : [WeaSunRiseSet]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		alarms = [WeaAlarm]()
		if let alarmsArray = dictionary["alarms"] as? [[String:Any]]{
			for dic in alarmsArray{
				let value = WeaAlarm(fromDictionary: dic)
				alarms.append(value)
			}
		}
		city = dictionary["city"] as? String
		cityid = dictionary["cityid"] as? Int
		indexes = [WeaIndexe]()
		if let indexesArray = dictionary["indexes"] as? [[String:Any]]{
			for dic in indexesArray{
				let value = WeaIndexe(fromDictionary: dic)
				indexes.append(value)
			}
		}
		if let pm25Data = dictionary["pm25"] as? [String:Any]{
				pm25 = WeaPm25(fromDictionary: pm25Data)
			}
		provinceName = dictionary["provinceName"] as? String
		if let realtimeData = dictionary["realtime"] as? [String:Any]{
				realtime = WeaRealtime(fromDictionary: realtimeData)
			}
		if let weatherDetailsInfoData = dictionary["weatherDetailsInfo"] as? [String:Any]{
				weatherDetailsInfo = WeatherDetailsInfo(fromDictionary: weatherDetailsInfoData)
			}
//        weathers = [WeaSunRiseSet]()
//        if let weathersArray = dictionary["weathers"] as? [[String:Any]]{
//            for dic in weathersArray{
//                let value = WeaSunRiseSet(fromDictionary: dic)
//                weathers.append(value)
//            }
//        }
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if alarms != nil{
			var dictionaryElements = [[String:Any]]()
			for alarmsElement in alarms {
				dictionaryElements.append(alarmsElement.toDictionary())
			}
			dictionary["alarms"] = dictionaryElements
		}
		if city != nil{
			dictionary["city"] = city
		}
		if cityid != nil{
			dictionary["cityid"] = cityid
		}
		if indexes != nil{
			var dictionaryElements = [[String:Any]]()
			for indexesElement in indexes {
				dictionaryElements.append(indexesElement.toDictionary())
			}
			dictionary["indexes"] = dictionaryElements
		}
		if pm25 != nil{
			dictionary["pm25"] = pm25.toDictionary()
		}
		if provinceName != nil{
			dictionary["provinceName"] = provinceName
		}
		if realtime != nil{
			dictionary["realtime"] = realtime.toDictionary()
		}
		if weatherDetailsInfo != nil{
			dictionary["weatherDetailsInfo"] = weatherDetailsInfo.toDictionary()
		}
//        if weathers != nil{
//            var dictionaryElements = [[String:Any]]()
//            for weathersElement in weathers {
//                dictionaryElements.append(weathersElement.toDictionary())
//            }
//            dictionary["weathers"] = dictionaryElements
//        }
		return dictionary
	}

}
