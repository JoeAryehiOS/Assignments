//
//  Course.swift
//  Assignments
//
//  Created by Joe Erani on 3/5/15.
//  Copyright (c) 2015 JoeAryehiOS. All rights reserved.
//

import Foundation


class Course{
    
    var courseName: String
    var courseNumber: Int?
    var Assignments: [Assignment] = []
    var current: Int = 0
    //TODO MAKE THIS USEFUL
    init(courseName name: String, courseNumber number: Int?){
        courseName = name
        courseNumber = number
    }
    
}
