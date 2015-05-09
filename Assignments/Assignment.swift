//
//  Assignment.swift
//  Assignments
//
//  Created by Joe Erani on 3/4/15.
//  Copyright (c) 2015 JoeAryehiOS. All rights reserved.
//

import Foundation

class Assignment {
    
    var assignmentName: String!
    var timeSpent: Double = 0.0
    var timeToComplete = 0.0
    var isCompleted = false
    var dueDate:NSDate!
    var forCourse:Course!
    var detail: String?
    
    
    
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
}
