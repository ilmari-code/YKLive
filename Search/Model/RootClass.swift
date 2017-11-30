//
//	RootClass.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct RootClass{

	var actionToLastStick : Int!
	var data : [NewsData]!
	var feedFlag : Int!
	var hasMore : Bool!
	var hasMoreToRefresh : Bool!
	var loginStatus : Int!
	var message : String!
	var postContentHint : String!
	var showEtStatus : Int!
	var tips : Tip!
	var totalNumber : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		actionToLastStick = dictionary["action_to_last_stick"] as? Int
		data = [NewsData]()
		if let dataArray = dictionary["data"] as? [[String:Any]]{
			for dic in dataArray{
				let value = NewsData(fromDictionary: dic)
				data.append(value)
			}
		}
		feedFlag = dictionary["feed_flag"] as? Int
		hasMore = dictionary["has_more"] as? Bool
		hasMoreToRefresh = dictionary["has_more_to_refresh"] as? Bool
		loginStatus = dictionary["login_status"] as? Int
		message = dictionary["message"] as? String
		postContentHint = dictionary["post_content_hint"] as? String
		showEtStatus = dictionary["show_et_status"] as? Int
		if let tipsData = dictionary["tips"] as? [String:Any]{
				tips = Tip(fromDictionary: tipsData)
			}
		totalNumber = dictionary["total_number"] as? Int
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if actionToLastStick != nil{
			dictionary["action_to_last_stick"] = actionToLastStick
		}
		if data != nil{
			var dictionaryElements = [[String:Any]]()
			for dataElement in data {
				dictionaryElements.append(dataElement.toDictionary())
			}
			dictionary["data"] = dictionaryElements
		}
		if feedFlag != nil{
			dictionary["feed_flag"] = feedFlag
		}
		if hasMore != nil{
			dictionary["has_more"] = hasMore
		}
		if hasMoreToRefresh != nil{
			dictionary["has_more_to_refresh"] = hasMoreToRefresh
		}
		if loginStatus != nil{
			dictionary["login_status"] = loginStatus
		}
		if message != nil{
			dictionary["message"] = message
		}
		if postContentHint != nil{
			dictionary["post_content_hint"] = postContentHint
		}
		if showEtStatus != nil{
			dictionary["show_et_status"] = showEtStatus
		}
		if tips != nil{
			dictionary["tips"] = tips.toDictionary()
		}
		if totalNumber != nil{
			dictionary["total_number"] = totalNumber
		}
		return dictionary
	}

}
