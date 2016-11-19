//
//	LoginResponse.swift
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class LoginResponse : NSObject, NSCoding{

	var data : [LoginData]!
	var message : String!
	var status : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		data = [LoginData]()
		if let dataArray = dictionary["data"] as? [NSDictionary]{
			for dic in dataArray{
				let value = LoginData(fromDictionary: dic)
				data.append(value)
			}
		}
		message = dictionary["message"] as? String
		status = dictionary["status"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if data != nil{
			var dictionaryElements = [NSDictionary]()
			for dataElement in data {
				dictionaryElements.append(dataElement.toDictionary())
			}
			dictionary["data"] = dictionaryElements
		}
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
         data = aDecoder.decodeObject(forKey: "data") as? [LoginData]
         message = aDecoder.decodeObject(forKey: "message") as? String
         status = aDecoder.decodeObject(forKey: "status") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if data != nil{
			aCoder.encode(data, forKey: "data")
		}
		if message != nil{
			aCoder.encode(message, forKey: "message")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}

	}
    
    

}
