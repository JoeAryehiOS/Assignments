//
//  Course.swift
//  Assignments
//
//  Created by Joe Erani on 3/5/15.
//  Copyright (c) 2015 JoeAryehiOS. All rights reserved.
//

import Foundation


class Course: NSObject, NSCoding{
    
    var courseName: String
    var courseNumber: String?
    var Assignments: [Assignment] = []
    var current: Int = 0
    //TODO MAKE THIS USEFUL
    init(courseName name: String, courseNumber number: String?){
        courseName = name
        courseNumber = number
    }
    required convenience init(coder decoder: NSCoder) {
        let Name = decoder.decodeObjectForKey("courseName") as! String
        let Number = decoder.decodeObjectForKey("courseNumber") as! String?
        self.init(courseName: Name, courseNumber: Number)
        self.Assignments = decoder.decodeObjectForKey("Assignments") as! [Assignment]
        self.current = decoder.decodeObjectForKey("current") as! Int
        //self.title = decoder.decodeObjectForKey("title") as String?
        
        
        
    }
    
    func encodeWithCoder(coder: NSCoder) {
        // coder.encodeObject(self.title, forKey: "title")
        coder.encodeObject(self.courseName, forKey: "courseName")
        coder.encodeObject(self.Assignments, forKey: "Assignments")
        coder.encodeObject(self.courseNumber, forKey: "courseNumber")
        coder.encodeObject(self.current, forKey: "current")
     
        
    }

    
}
