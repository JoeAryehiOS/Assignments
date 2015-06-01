//
//  AssignmentTimer.swift
//  Assignments
//
//  Created by Joe Erani on 5/28/15.
//  Copyright (c) 2015 JoeAryehiOS. All rights reserved.
//

import Foundation

class AssignmentTimer {
    
    private var workTime = 600
    private var selectedAssignment:Assignment!
    
    func runOneWorkPeriod(){
        //var time:NSTimer = NSTimer.scheduledTimerWithTimeInterval( workTime, target: self, selector: Selector("finishWorkTime"), userInfo: nil, repeats: false)   
    }
    
    func finishWorkTime(){
        selectedAssignment.timeSpent+=Double(workTime/60)
        
    }
    func getTimeForWork() -> Int{
        return workTime
    }
    
    func getTimeForBreak() ->Int{
        return workTime/3
    }
    
    func setWorkTime(newVal:Int){
        switch newVal{
        case 10:
            workTime = 600
        case 15:
            workTime = 900
        case 20:
            workTime = 1200
        case 30:
            workTime = 1800
        default:
            print("ERROR IN SETTING WORK TIME")
        }
    }
    
    
}
