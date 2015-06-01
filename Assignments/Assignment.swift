//
//  Assignment.swift
//  Assignments
//
//  Created by Joe Erani on 3/4/15.
//  Copyright (c) 2015 JoeAryehiOS. All rights reserved.
//

import Foundation

class Assignment:NSObject, NSCoding {
    
    var assignmentName: String!
    var timeSpent: Double = 0.0
    var timeToComplete = 0.0
    var isCompleted = false
    var dueDate:NSDate!
    var forCourse:Course!
    var detail: String?
    
    
    func increaseTime(d:Double) {
        timeToComplete+=d
    }
    
    init(assignmentName name: String, dueDate due: NSDate, timeToComplete time: Double, Details: String?){
        assignmentName = name
        timeToComplete = time
        dueDate = due
        if let a = Details{
           self.detail = Details
        }
    }
    func checkCompletion() -> Bool{
        if(timeToComplete<timeSpent || timeToComplete==timeSpent){
            return true
        }
        return false
    }
    
    func setTimeToComplete(newTimeHours : Double, newTimeMinutes : Double){
        timeToComplete = newTimeMinutes + (newTimeHours*60)
    }
    func getDescription() -> String{
        if let a = detail{
            return assignmentName + "\n   " + a}
        else{
            return assignmentName
        }
    }
    func checkPercentage() -> Double{
        return timeSpent/timeToComplete
            }
    required convenience init(coder decoder: NSCoder) {
        let name = decoder.decodeObjectForKey("assignmentName") as! String!
        let timespent = decoder.decodeObjectForKey("timeSpent") as! Double
        let timeTo = decoder.decodeObjectForKey("timeToComplete") as! Double
        let isComplete = decoder.decodeObjectForKey("isCompleted") as! Bool
        let dueDate = decoder.decodeObjectForKey("dueDate") as! NSDate!
        let forCourse = decoder.decodeObjectForKey("forCourse") as! Course!
        let detail = decoder.decodeObjectForKey("detail") as! String?
        self.init(assignmentName: name, dueDate: dueDate, timeToComplete: timeTo, Details: detail)
        
        self.timeSpent = timespent
        self.isCompleted = isComplete
        self.forCourse = forCourse
        
        
        
    }
    
    func encodeWithCoder(coder: NSCoder) {
        // coder.encodeObject(self.title, forKey: "title")
        coder.encodeObject(self.assignmentName, forKey: "assignmentName")
        coder.encodeObject(self.detail, forKey: "detail")
        coder.encodeObject(self.dueDate, forKey: "dueDate")
        coder.encodeObject(self.forCourse, forKey: "forCourse")
        coder.encodeObject(self.isCompleted, forKey: "isCompleted")
        coder.encodeObject(self.timeSpent, forKey: "timeSpent")
        coder.encodeObject(self.timeToComplete, forKey: "timeToComplete")
        
        
    }
    
    func getPriority() ->Int{
        //NEED TO FIND A WAY TO DO THIS WELL
        return 0
    }

}
