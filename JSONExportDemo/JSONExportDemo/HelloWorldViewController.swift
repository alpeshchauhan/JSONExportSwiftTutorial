//
//  HelloWorldViewController.swift
//  JSONExportDemo
//
//  Created by Tejas on 11/12/16.
//  Copyright © 2016 Tejas. All rights reserved.
//

import UIKit

class HelloWorldViewController: UIViewController {
    
    static let ObjectName = "HelloWorld"
    
    //1.Service Call
    @IBOutlet weak var lblHelloWorld: UILabel!
    
    @IBAction func callWebserviceTapped(_ sender: Any) {
        
        _ = HelloWorld.get { (helloWorld, success) in
            
            print(helloWorld.message)
            
            self.setDatatoUI(helloWorld: helloWorld)
        }
    }
    
    //2.Copy Object
    @IBOutlet weak var lblHelloWorldCopy: UILabel!
    
    @IBAction func CopyObjectTapped(_ sender: Any) {
        
        _ = HelloWorld.get { (helloWorld, success) in
            
            //let helloWorldCopy = helloWorld.copy()
            //let helloWorldCopy = helloWorld.mutableCopy()
            
            //helloWorld.message = "test"
        }
    }
    
    
    //3.Get Object From File(NSCoding)
    @IBOutlet weak var lblHelloWorldSaveGet: UILabel!
    
    @IBAction func saveObjectTapped(_ sender: Any) {
        
        _ = HelloWorld.get { (helloWorld, success) in
            
            if HelloWorld.save(helloWorld: helloWorld, toFileName: "HelloWorld") {
                print("HelloWorld object Saved!")
            } else {
                print("Error")
            }
        }
    }
    
    @IBAction func getObjectTapped(_ sender: Any) {
        
        //Try To get object from file
        if let helloWorld = HelloWorld.loadFrom(fileName: "HelloWorld") {
            print(helloWorld.message)
        } else {
            print("Error")
        }
    }
    
    @IBAction func clearObjectTapped(_ sender: Any) {
        
        //Clear object from disk
        if HelloWorld.clearFrom(fileName: "HelloWorld") {
            print("HelloWorld object Cleared!")
        } else {
            print("Error")
        }
        
        //Try To get object from file
        if let helloWorld = HelloWorld.loadFrom(fileName: "HelloWorld") {
            print(helloWorld.message)
        } else {
            print("Error")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /// Set Data to UI
    ///
    /// - Parameter helloWorld:- HelloWorld Object
    func setDatatoUI(helloWorld:HelloWorld) {
        
        self.lblHelloWorld.text = helloWorld.message
    }
}
