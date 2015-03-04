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
    var timeSpent = 0.0
    var timeToComplete = 0.0
    var isCompleted = false
    var dueDate:NSDate!
    //var assignmentType: AssignmentType
    //var forClass:Class
    
    
    
    func checkCompletion() -> Bool{
        if(timeToComplete<timeSpent || timeToComplete==timeSpent){
            return true
        }
        return false
    }
    
    
}