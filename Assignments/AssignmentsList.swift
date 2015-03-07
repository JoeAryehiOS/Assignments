//
//  AssignmentsList.swift
//  Assignments
//
//  Created by Aryeh Lieberman on 3/7/15.
//  Copyright (c) 2015 JoeAryehiOS. All rights reserved.
//

import Foundation
class AssignmentsList{
    class var List: AssignmentsList{
    struct Singleton{
        static let instance = AssignmentsList()
        
    }
    return Singleton.instance
}
var Assignments: [Assignment] = Array()


}