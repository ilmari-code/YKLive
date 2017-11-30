//
//	YKExtra.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class YKExtra : NSObject, NSCoding{

	var cover : AnyObject!
	var label : [YKLabel]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		cover = dictionary["cover"] as? AnyObject
		label = [YKLabel]()
		if let labelArray = dictionary["label"] as? [[String:Any]]{
			for dic in labelArray{
				let value = YKLabel(fromDictionary: dic)
				label.append(value)
			}
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if cover != nil{
			dictionary["cover"] = cover
		}
		if label != nil{
			var dictionaryElements = [[String:Any]]()
			for labelElement in label {
				dictionaryElements.append(labelElement.toDictionary())
			}
			dictionary["label"] = dictionaryElements
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         cover = aDecoder.decodeObject(forKey: "cover") as? AnyObject
         label = aDecoder.decodeObject(forKey :"label") as? [YKLabel]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if cover != nil{
			aCoder.encode(cover, forKey: "cover")
		}
		if label != nil{
			aCoder.encode(label, forKey: "label")
		}

	}

}