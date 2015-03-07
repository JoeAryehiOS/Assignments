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
    func addCourse(name: String){
        list.append(Course(courseName: name))
        
    }
    func deleteCoursewith(CourseName: String){
        for i in enumerate(list){
            if (i.element.courseName == CourseName){
                list.removeAtIndex(i.index)
            }
        }
        
        
    }
    func deleteCoursewith(Index: Int){
        list.removeAtIndex(Index)
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