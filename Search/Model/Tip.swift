//
//	Tip.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Tip{

	var appName : String!
	var displayDuration : Int!
	var displayInfo : String!
	var displayTemplate : String!
	var downloadUrl : String!
	var openUrl : String!
	var packageName : String!
	var type : String!
	var webUrl : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		appName = dictionary["app_name"] as? String
		displayDuration = dictionary["display_duration"] as? Int
		displayInfo = dictionary["display_info"] as? String
		displayTemplate = dictionary["display_template"] as? String
		downloadUrl = dictionary["download_url"] as? String
		openUrl = dictionary["open_url"] as? String
		packageName = dictionary["package_name"] as? String
		type = dictionary["type"] as? String
		webUrl = dictionary["web_url"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if appName != nil{
			dictionary["app_name"] = appName
		}
		if displayDuration != nil{
			dictionary["display_duration"] = displayDuration
		}
		if displayInfo != nil{
			dictionary["display_info"] = displayInfo
		}
		if displayTemplate != nil{
			dictionary["display_template"] = displayTemplate
		}
		if downloadUrl != nil{
			dictionary["download_url"] = downloadUrl
		}
		if openUrl != nil{
			dictionary["open_url"] = openUrl
		}
		if packageName != nil{
			dictionary["package_name"] = packageName
		}
		if type != nil{
			dictionary["type"] = type
		}
		if webUrl != nil{
			dictionary["web_url"] = webUrl
		}
		return dictionary
	}

}