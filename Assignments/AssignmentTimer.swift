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
        var time:NSTimer = NSTimer.scheduledTimerWithTimeInterval(workTime, target: self, selector: Selector("finishWorkTime"), userInfo: nil, repeats: false)
        //var time:NSTimer = NSTimer.scheduledTimerWithTimeInterval( workTime, target: self, selector: Selector("finishWorkTime"), userInfo: nil, repeats: false)
    }
    
    func finishWorkTime(){
        selectedAssignment.timeSpent+=workTime/60
        if(selectedAssignment.checkCompletion()){
            let doneController: UIAlertController = UIAlertController(title: "Are You finished?", message: "Select the appropriate option", preferredStyle: .ActionSheet)
            
            //Create and add the Cancel action
            let cancelAction: UIAlertAction = UIAlertAction(title: "Yes", style: .Cancel) { action -> Void in
                //Just dismiss the action sheet
            }
           doneController.addAction(cancelAction)
            //Create and add first option action
            let takePictureAction: UIAlertAction = UIAlertAction(title: "No", style: .Default) { action -> Void in
                self.selectedAssignment.increaseTime(self.workTime/60)
            }
            doneController.addAction(takePictureAction)
        }
        var alert = UIAlertView()
        alert.title = "Done Working"
        alert.message = "Time for a break"
        alert.addButtonWithTitle("YAY!")
        alert.show()
    }
    func getTimeForWork() -> Double{
        return workTime
    }
    
    init(a:Assignment){
        selectedAssignment = a
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
