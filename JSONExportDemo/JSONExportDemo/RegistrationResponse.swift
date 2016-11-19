//
//	RegistrationResponse.swift
//
//	Create by Yoshemaite on 12/11/2016
//	Copyright © 2016. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class RegistrationResponse : NSObject, NSCoding{

	var message : String!
	var status : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		message = dictionary["message"] as? String
		status = dictionary["status"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if message != nil{
			dictionary["message"] = message
		}
		if status != nil{
			dictionary["status"] = status
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         message = aDecoder.decodeObject(forKey: "message") as? String
         status = aDecoder.decodeObject(forKey: "status") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if message != nil{
			aCoder.encode(message, forKey: "message")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}

	}
}
