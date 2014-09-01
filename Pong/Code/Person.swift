//
//  Person.swift
//  Pong
//
//  Created by Bryce Hammond on 8/31/14.
//  Copyright (c) 2014 Imulus. All rights reserved.
//

import UIKit

class Person: NSObject {
    
    init(config: NSDictionary!) {
        self.config = config
        super.init()
    }
    
    var config : NSDictionary!
    
    lazy var image : UIImage! = {
       return UIImage(named: self.config["image"] as String)
    }()
    
    lazy var name : String = {
        return self.config["name"] as String
    }()
    
    class var allPeople : [Person] {
        get {
            
            let peopleConfigs = NSArray(contentsOfFile: NSBundle.mainBundle().pathForResource("people", ofType: "plist")!)
            var people = [Person]()
            
            for personConfig in peopleConfigs as [NSDictionary!] {
                people.append(Person(config: personConfig))
            }
            
            return people
        }
    }

}
