//
//	WeaAlarm.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct WeaAlarm{

	var alarmContent : String!
	var alarmDesc : String!
	var alarmId : String!
	var alarmLevelNo : String!
	var alarmLevelNoDesc : String!
	var alarmType : String!
	var alarmTypeDesc : String!
	var precaution : String!
	var publishTime : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		alarmContent = dictionary["alarmContent"] as? String
		alarmDesc = dictionary["alarmDesc"] as? String
		alarmId = dictionary["alarmId"] as? String
		alarmLevelNo = dictionary["alarmLevelNo"] as? String
		alarmLevelNoDesc = dictionary["alarmLevelNoDesc"] as? String
		alarmType = dictionary["alarmType"] as? String
		alarmTypeDesc = dictionary["alarmTypeDesc"] as? String
		precaution = dictionary["precaution"] as? String
		publishTime = dictionary["publishTime"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if alarmContent != nil{
			dictionary["alarmContent"] = alarmContent
		}
		if alarmDesc != nil{
			dictionary["alarmDesc"] = alarmDesc
		}
		if alarmId != nil{
			dictionary["alarmId"] = alarmId
		}
		if alarmLevelNo != nil{
			dictionary["alarmLevelNo"] = alarmLevelNo
		}
		if alarmLevelNoDesc != nil{
			dictionary["alarmLevelNoDesc"] = alarmLevelNoDesc
		}
		if alarmType != nil{
			dictionary["alarmType"] = alarmType
		}
		if alarmTypeDesc != nil{
			dictionary["alarmTypeDesc"] = alarmTypeDesc
		}
		if precaution != nil{
			dictionary["precaution"] = precaution
		}
		if publishTime != nil{
			dictionary["publishTime"] = publishTime
		}
		return dictionary
	}

}