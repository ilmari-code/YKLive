//
//	WeaCity.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct WeaCity : Codable{

	var city : String!
	var cityid : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
    init(fromDictionary dictionary: [String:Any]){
        city = dictionary["city"] as? String
        cityid = dictionary["cityid"] as? String
    }

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if city != nil{
            dictionary["city"] = city
        }
        if cityid != nil{
            dictionary["cityid"] = cityid
        }
        return dictionary
    }

}
