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
    func addCourse(name: String, number: Int?){
        list.append(Course(courseName: name, courseNumber: number))
        
    }
    
    func deleteCoursewith(CourseName: String){
        for i in enumerate(list){
            if (i.element.courseName == CourseName){
                list.removeAtIndex(i.index)
            }
        }
        
        
    }
    
    func deleteCoursewith(CourseNumber: Int){
        for i in enumerate(list){
            if let a = i.element.courseNumber{
                if(a == CourseNumber){
                    list.removeAtIndex(i.index)
                }
            }
        }
    }
    /*
    func save(){
        var paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        var path = paths[0].stringByAppendingPathComponent("colonies")
        NSKeyedArchiver.archiveRootObject(colonyList, toFile: path)
        
    }
    func unArchiving(){
        var paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        var path = paths[0].stringByAppendingPathComponent("colonies")
        if let archived = NSKeyedUnarchiver.unarchiveObjectWithFile(path) as? [Colony]{
            colonyList = archived
            
        }*/
}