//
//  RegistrationViewController.swift
//  JSONExportDemo
//
//  Created by Tejas on 10/30/16.
//  Copyright © 2016 Tejas. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    //1.Service Call
    @IBOutlet weak var lblstatus: UILabel!
    @IBOutlet weak var lblmessage: UILabel!
    
    @IBAction func callWebserviceTapped(_ sender: Any) {
        
    }
    
    //2.Copy Object
    @IBOutlet weak var lblstatusCopy: UILabel!
    @IBOutlet weak var lblmessageCopy: UILabel!
    
    @IBAction func CopyObjectTapped(_ sender: Any) {
        
    }

    //3.Get Object From File(NSCoding)
    @IBOutlet weak var lblstatusSaveGet: UILabel!
    @IBOutlet weak var lblmessageSaveGet: UILabel!
    
    @IBAction func saveObjectTapped(_ sender: Any) {
        
    }
    
    @IBAction func getObjectTapped(_ sender: AnyObject) {
        //Try To get object from file
    }
    
    @IBAction func clearObjectTapped(_ sender: AnyObject) {
        //Clear object from disk
        
        //Try To get object from file
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /// Set Data to UI
    ///
    /// - Parameter helloWorld:- HelloWorld Object
    func setDatatoUI(helloWorld:HelloWorld) {
    
    }



}

