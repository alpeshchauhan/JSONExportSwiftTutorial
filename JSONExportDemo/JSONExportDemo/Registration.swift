//
//	Registration.swift
//
//	Create by Yoshemaite on 12/11/2016
//	Copyright © 2016. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Registration : NSObject, NSCoding{

	var response : RegistrationResponse!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		if let responseData = dictionary["response"] as? NSDictionary {
			response = RegistrationResponse(fromDictionary: responseData)
		}
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if response != nil{
			dictionary["response"] = response.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         response = aDecoder.decodeObject(forKey: "response") as? RegistrationResponse

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if response != nil{
			aCoder.encode(response, forKey: "response")
		}
	}
    
    
    
    /// Webservice Call
    ///
    /// - parameter successHandler: Return Closure
    static func get(successHandler:(_ registration:
        Registration,_ isSuccess:Bool)-> Void) -> Void {
        
        if let path = Bundle.main.path(forResource: "Registration", ofType: "json") {
            do {
                let jsonData = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
                do {
                    let jsonResult: NSDictionary = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                    
                    let registration = Registration.init(fromDictionary: jsonResult) as Registration
                    
                    successHandler(registration, true)
                    
                    print(jsonResult)
                    
                } catch {}
            } catch {}
        }
    }

}
