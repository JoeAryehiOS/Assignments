//
//  AssignmentTimer.swift
//  Assignments
//
//  Created by Joe Erani on 5/28/15.
//  Copyright (c) 2015 JoeAryehiOS. All rights reserved.
//

import Foundation

class AssignmentTimer {
    
    private var workTime = 600000

    
    func getTimeForWork() -> Int{
        return workTime
    }
    
    func getTimeForBreak() ->Int{
        return workTime/3
    }
    
    func setWorkTime(newVal:Int){
        switch newVal{
        case 10:
            workTime = 600000
        case 15:
            workTime = 900000
        case 20:
            workTime = 1200000
        case 30:
            workTime = 1800000
        default:
            print("ERROR IN SETTING WORK TIME")
        }
    }
    
    
}
