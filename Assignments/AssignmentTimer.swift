//
//  AssignmentTimer.swift
//  Assignments
//
//  Created by Joe Erani on 5/28/15.
//  Copyright (c) 2015 JoeAryehiOS. All rights reserved.
//

import Foundation
import UIKit

class AssignmentTimer {
    
    private var workTime = 600.0
    private var selectedAssignment:Assignment!
    
    
    func runOneWorkPeriod(){
<<<<<<< HEAD
        var time:NSTimer = NSTimer.scheduledTimerWithTimeInterval(workTime, target: self, selector: Selector("finishWorkTime"), userInfo: nil, repeats: false)
=======
        //var time:NSTimer = NSTimer.scheduledTimerWithTimeInterval( workTime, target: self, selector: Selector("finishWorkTime"), userInfo: nil, repeats: false)   
>>>>>>> origin/master
    }
    
    func finishWorkTime(){
        selectedAssignment.timeSpent+=workTime/60
        if(selectedAssignment.checkCompletion()){
            var notDone = UIAlertController()
            notDone.addAction(UIAlertAction(title:"OK", style: .Default, handler:  {selectedAssignment.increaseTime(workTime)}, sender: self)
        var alert = UIAlertView()
        alert.title = "Done Working"
        alert.message = "Time for a break"
        alert.addButtonWithTitle("YAY!")
        alert.show()
    }
    func getTimeForWork() -> Double{
        return workTime
    }
    
    func getTimeForBreak() ->Double{
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
