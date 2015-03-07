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
    var Assignments: [Assignment] = []
    //TODO MAKE THIS USEFUL
    init(courseName name: String){
        courseName = name
    }
    
}
