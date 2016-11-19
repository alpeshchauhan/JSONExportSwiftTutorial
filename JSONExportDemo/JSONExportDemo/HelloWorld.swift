//
//	HelloWorld.swift
//
//	Create by Yoshemaite on 12/11/2016
//	Copyright © 2016. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class HelloWorld : NSObject, NSCoding, NSCopying, NSMutableCopying{

    // MARK: Var
	var message : String!

    // MARK: Init
    override init() {
        
    }
    
	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		message = dictionary["message"] as? String
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
		return dictionary
	}

    // MARK: NSCoding
    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         message = aDecoder.decodeObject(forKey: "message") as? String
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
	}
    
    // MARK: NSCopying
    /**
     * NSCopying required method.
     * Copy mode properties
     */
    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
    
    /**
     * NSMutableCopying required method.
     * Copy mode properties
     */
    func mutableCopy(with zone: NSZone? = nil) -> Any {
        
        let helloWorld = HelloWorld()
        
        helloWorld.message = self.message
        
        return helloWorld
    }
    
    // MARK: Save Object
    class func filePath(fileName : String) -> URL {
        
        let paths = URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])
        
        let getImagePath = paths.appendingPathComponent(fileName as String)
        
        return getImagePath
    }
    
    class func loadFrom(fileName:String)-> HelloWorld?  {
        
        // load your custom object from the file
        if let temp = NSKeyedUnarchiver.unarchiveObject(withFile: filePath(fileName: fileName).path) {
            return temp as? HelloWorld
        } else {
            return nil
        }
    }
    
   class func save(helloWorld:HelloWorld, toFileName:String)-> Bool {
        
        let file = HelloWorld.filePath(fileName: toFileName)
        
        // save your custom object in a file
        let isPrefSaved =  NSKeyedArchiver.archiveRootObject(helloWorld, toFile: file.path)
        
        return isPrefSaved
    }
    
   class func clearFrom(fileName:String)-> Bool {
        
        let filePath = HelloWorld.filePath(fileName: fileName)
        
        if FileManager.default.fileExists(atPath: (filePath.path)) {
            do {
                try FileManager.default.removeItem(at: filePath)
                return true
            } catch _ {
                return false
            }
        }
        
        return false
    }
    
    // MARK: Webservice
    class func get(successHandler:(_ helloWorld:
        HelloWorld,_ isSuccess:Bool)-> Void) -> Void {
        
        if let path = Bundle.main.path(forResource: "HelloWorld", ofType: "json") {
            do {
                let jsonData = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
                do {
                    let jsonResult: NSDictionary = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                    
                    let helloWorld = HelloWorld.init(fromDictionary: jsonResult) as HelloWorld
                    
                    successHandler(helloWorld, true)
                    
                    print(jsonResult)
                    
                } catch {}
            } catch {}
        }
    }

}
