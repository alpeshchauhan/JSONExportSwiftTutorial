//
//	Login.swift
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Login : NSObject, NSCoding{

	var response : LoginResponse!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		if let responseData = dictionary["response"] as? NSDictionary{
			response = LoginResponse(fromDictionary: responseData)
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
         response = aDecoder.decodeObject(forKey: "response") as? LoginResponse

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
    static func get(successHandler:(_ login:
        Login,_ isSuccess:Bool)-> Void) -> Void {
        
        if let path = Bundle.main.path(forResource: "Login", ofType: "json") {
            do {
                let jsonData = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
                do {
                    let jsonResult: NSDictionary = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                    
                    let login = Login.init(fromDictionary: jsonResult) as Login
                    
                    successHandler(login, true)
                    
                    print(jsonResult)
                    
                } catch {}
            } catch {}
        }
    }

}
