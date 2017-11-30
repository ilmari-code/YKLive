//
//	YKLive.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class YKLive : NSObject, NSCoding{

	var actInfo : YKActInfo!
	var city : String!
	var creator : YKCreator!
	var extra : YKExtra!
	var group : Int!
	var id : String!
	var landscape : Int!
	var like : [AnyObject]!
	var link : Int!
	var liveType : String!
	var multi : Int!
	var name : String!
	var onlineUsers : Int!
	var optimal : Int!
	var roomId : Int!
	var rotate : Int!
	var shareAddr : String!
	var slot : Int!
	var streamAddr : String!
	var version : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let actInfoData = dictionary["act_info"] as? [String:Any]{
			actInfo = YKActInfo(fromDictionary: actInfoData)
		}
		city = dictionary["city"] as? String
		if let creatorData = dictionary["creator"] as? [String:Any]{
			creator = YKCreator(fromDictionary: creatorData)
		}
		if let extraData = dictionary["extra"] as? [String:Any]{
			extra = YKExtra(fromDictionary: extraData)
		}
		group = dictionary["group"] as? Int
		id = dictionary["id"] as? String
		landscape = dictionary["landscape"] as? Int
		like = dictionary["like"] as? [AnyObject]
		link = dictionary["link"] as? Int
		liveType = dictionary["live_type"] as? String
		multi = dictionary["multi"] as? Int
		name = dictionary["name"] as? String
		onlineUsers = dictionary["online_users"] as? Int
		optimal = dictionary["optimal"] as? Int
		roomId = dictionary["room_id"] as? Int
		rotate = dictionary["rotate"] as? Int
		shareAddr = dictionary["share_addr"] as? String
		slot = dictionary["slot"] as? Int
		streamAddr = dictionary["stream_addr"] as? String
		version = dictionary["version"] as? Int
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if actInfo != nil{
			dictionary["act_info"] = actInfo.toDictionary()
		}
		if city != nil{
			dictionary["city"] = city
		}
		if creator != nil{
			dictionary["creator"] = creator.toDictionary()
		}
		if extra != nil{
			dictionary["extra"] = extra.toDictionary()
		}
		if group != nil{
			dictionary["group"] = group
		}
		if id != nil{
			dictionary["id"] = id
		}
		if landscape != nil{
			dictionary["landscape"] = landscape
		}
		if like != nil{
			dictionary["like"] = like
		}
		if link != nil{
			dictionary["link"] = link
		}
		if liveType != nil{
			dictionary["live_type"] = liveType
		}
		if multi != nil{
			dictionary["multi"] = multi
		}
		if name != nil{
			dictionary["name"] = name
		}
		if onlineUsers != nil{
			dictionary["online_users"] = onlineUsers
		}
		if optimal != nil{
			dictionary["optimal"] = optimal
		}
		if roomId != nil{
			dictionary["room_id"] = roomId
		}
		if rotate != nil{
			dictionary["rotate"] = rotate
		}
		if shareAddr != nil{
			dictionary["share_addr"] = shareAddr
		}
		if slot != nil{
			dictionary["slot"] = slot
		}
		if streamAddr != nil{
			dictionary["stream_addr"] = streamAddr
		}
		if version != nil{
			dictionary["version"] = version
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         actInfo = aDecoder.decodeObject(forKey: "act_info") as? YKActInfo
         city = aDecoder.decodeObject(forKey: "city") as? String
         creator = aDecoder.decodeObject(forKey: "creator") as? YKCreator
         extra = aDecoder.decodeObject(forKey: "extra") as? YKExtra
         group = aDecoder.decodeObject(forKey: "group") as? Int
         id = aDecoder.decodeObject(forKey: "id") as? String
         landscape = aDecoder.decodeObject(forKey: "landscape") as? Int
         like = aDecoder.decodeObject(forKey: "like") as? [AnyObject]
         link = aDecoder.decodeObject(forKey: "link") as? Int
         liveType = aDecoder.decodeObject(forKey: "live_type") as? String
         multi = aDecoder.decodeObject(forKey: "multi") as? Int
         name = aDecoder.decodeObject(forKey: "name") as? String
         onlineUsers = aDecoder.decodeObject(forKey: "online_users") as? Int
         optimal = aDecoder.decodeObject(forKey: "optimal") as? Int
         roomId = aDecoder.decodeObject(forKey: "room_id") as? Int
         rotate = aDecoder.decodeObject(forKey: "rotate") as? Int
         shareAddr = aDecoder.decodeObject(forKey: "share_addr") as? String
         slot = aDecoder.decodeObject(forKey: "slot") as? Int
         streamAddr = aDecoder.decodeObject(forKey: "stream_addr") as? String
         version = aDecoder.decodeObject(forKey: "version") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if actInfo != nil{
			aCoder.encode(actInfo, forKey: "act_info")
		}
		if city != nil{
			aCoder.encode(city, forKey: "city")
		}
		if creator != nil{
			aCoder.encode(creator, forKey: "creator")
		}
		if extra != nil{
			aCoder.encode(extra, forKey: "extra")
		}
		if group != nil{
			aCoder.encode(group, forKey: "group")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if landscape != nil{
			aCoder.encode(landscape, forKey: "landscape")
		}
		if like != nil{
			aCoder.encode(like, forKey: "like")
		}
		if link != nil{
			aCoder.encode(link, forKey: "link")
		}
		if liveType != nil{
			aCoder.encode(liveType, forKey: "live_type")
		}
		if multi != nil{
			aCoder.encode(multi, forKey: "multi")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if onlineUsers != nil{
			aCoder.encode(onlineUsers, forKey: "online_users")
		}
		if optimal != nil{
			aCoder.encode(optimal, forKey: "optimal")
		}
		if roomId != nil{
			aCoder.encode(roomId, forKey: "room_id")
		}
		if rotate != nil{
			aCoder.encode(rotate, forKey: "rotate")
		}
		if shareAddr != nil{
			aCoder.encode(shareAddr, forKey: "share_addr")
		}
		if slot != nil{
			aCoder.encode(slot, forKey: "slot")
		}
		if streamAddr != nil{
			aCoder.encode(streamAddr, forKey: "stream_addr")
		}
		if version != nil{
			aCoder.encode(version, forKey: "version")
		}

	}

}