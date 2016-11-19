//
//	LoginData.swift
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class LoginData : NSObject, NSCoding{

	var coverImage : String!
	var email : String!
	var fullName : String!
	var isActive : String!
	var parentMid : String!
	var profileImage : String!
	var userId : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		coverImage = dictionary["cover_image"] as? String
		email = dictionary["email"] as? String
		fullName = dictionary["full_name"] as? String
		isActive = dictionary["is_active"] as? String
		parentMid = dictionary["parent_mid"] as? String
		profileImage = dictionary["profile_image"] as? String
		userId = dictionary["user_id"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if coverImage != nil{
			dictionary["cover_image"] = coverImage
		}
		if email != nil{
			dictionary["email"] = email
		}
		if fullName != nil{
			dictionary["full_name"] = fullName
		}
		if isActive != nil{
			dictionary["is_active"] = isActive
		}
		if parentMid != nil{
			dictionary["parent_mid"] = parentMid
		}
		if profileImage != nil{
			dictionary["profile_image"] = profileImage
		}
		if userId != nil{
			dictionary["user_id"] = userId
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         coverImage = aDecoder.decodeObject(forKey: "cover_image") as? String
         email = aDecoder.decodeObject(forKey: "email") as? String
         fullName = aDecoder.decodeObject(forKey: "full_name") as? String
         isActive = aDecoder.decodeObject(forKey: "is_active") as? String
         parentMid = aDecoder.decodeObject(forKey: "parent_mid") as? String
         profileImage = aDecoder.decodeObject(forKey: "profile_image") as? String
         userId = aDecoder.decodeObject(forKey: "user_id") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if coverImage != nil{
			aCoder.encode(coverImage, forKey: "cover_image")
		}
		if email != nil{
			aCoder.encode(email, forKey: "email")
		}
		if fullName != nil{
			aCoder.encode(fullName, forKey: "full_name")
		}
		if isActive != nil{
			aCoder.encode(isActive, forKey: "is_active")
		}
		if parentMid != nil{
			aCoder.encode(parentMid, forKey: "parent_mid")
		}
		if profileImage != nil{
			aCoder.encode(profileImage, forKey: "profile_image")
		}
		if userId != nil{
			aCoder.encode(userId, forKey: "user_id")
		}

	}

}
