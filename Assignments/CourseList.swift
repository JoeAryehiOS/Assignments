//
//  CourseList.swift
//  Assignments
//
//  Created by Aryeh Lieberman on 3/7/15.
//  Copyright (c) 2015 JoeAryehiOS. All rights reserved.
//

import Foundation
class CourseList{
    class var List: CourseList{
        struct Singleton{
            static let instance = CourseList()
            
        }
        return Singleton.instance
    }
    var list: [Course] = Array()
    var current: Int = 0
    var showCompleted: Bool = true
    var useWorkPeriod: Bool = true
    var workPeriod: Int = 15 * 60
    var onPercentage: Double = 0.75
    func addCourse(name: String, number: String?){
        list.append(Course(courseName: name, courseNumber: number))
        
    }
    
    func deleteCoursewith(CourseName: String){
        for i in enumerate(list){
            if (i.element.courseName == CourseName){
                list.removeAtIndex(i.index)
            }
        }
        
        
    }
    
    func deleteCoursewithNumber(CourseNumber: String){
        for i in enumerate(list){
            if let a = i.element.courseNumber{
                if(CourseNumber == a){
                    list.removeAtIndex(i.index)
                }
            }
        }
    }
    
    func save(){
        var paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        var path = paths[0].stringByAppendingPathComponent("courses")
        NSKeyedArchiver.archiveRootObject(list, toFile: path)
        
    }
    func unArchiving(){
        var paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        var path = paths[0].stringByAppendingPathComponent("courses")
        if let archived = NSKeyedUnarchiver.unarchiveObjectWithFile(path) as? [Course]{
            list = archived
            
        }
    }
}