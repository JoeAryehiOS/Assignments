//
//  WorkViewController.swift
//  Assignments
//
//  Created by Aryeh Lieberman on 6/9/15.
//  Copyright (c) 2015 JoeAryehiOS. All rights reserved.
//

import UIKit

//
//  WorkViewController.swift
//  Assignments
//
//  Created by Aryeh Lieberman on 5/20/15.
//  Copyright (c) 2015 JoeAryehiOS. All rights reserved.
//

import UIKit

class WorkViewController: UIViewController {
    var timer: NSTimer!
    
    @IBOutlet weak var TimeLabel: UILabel!
    @IBOutlet weak var StudyPatternImageView: UIImageView!
    
    @IBOutlet weak var PauseResumeButton: UIButton!
    
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    var time: Int = 0
    var workTime:Int!
    var selectedAssignment:Assignment!
    override func viewDidLoad() {
        super.viewDidLoad()
        time = 0
        stopButton.hidden = true
        workTime = 10
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func Start(sender: AnyObject) {
        startTimer()
        startButton.hidden = true
        stopButton.hidden = false
    }
    @IBAction func Stop(sender: AnyObject) {
        stopTimer()
        startButton.hidden = false
        stopButton.hidden = true
    }
    
    @IBAction func PauseButtonPressed(sender: UIButton) {
    }
    func startTimer(){
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("updateTime"), userInfo: nil, repeats: true)
        
    }
    func pauseTimer(){
        invalidateTimer()
        
    }
    func stopTimer(){
        invalidateTimer()
        TimeLabel.text = "00:00:00"
        
    }
    func invalidateTimer(){
        if(timer != nil){
            timer.invalidate()
        }
    }
    func updateTime(){
        time++
        TimeLabel.text = formatTime(time)
        if(time.minute == workTime){
            invalidateTimer()
            selectedAssignment.timeSpent = Double(Int(selectedAssignment.timeSpent) + workTime/60)
            if(selectedAssignment.checkCompletion()){
                let doneController: UIAlertController = UIAlertController(title: "Are You finished?", message: "Select the appropriate option", preferredStyle: .ActionSheet)
                
                //Create and add the Cancel action
                let cancelAction: UIAlertAction = UIAlertAction(title: "Yes", style: .Cancel) { action -> Void in
                    //Just dismiss the action sheet
                }
                doneController.addAction(cancelAction)
                //Create and add first option actionself.selectedAssignment.increaseTime(self.workTime/60)
                let takePictureAction = UIAlertAction(title: "No", style: UIAlertActionStyle.Default){
                    action in
                    self.selectedAssignment.increaseTime(Double(self.workTime/60))
                }
                
                doneController.addAction(takePictureAction)
            }
            var alert = UIAlertView()
            alert.title = "Done Working"
            alert.message = "Time for a break"
            alert.addButtonWithTitle("YAY!")
            alert.show()
            
        }
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    func formatTime(time: Int)-> String{
        var h: String{
            if((time.hour / 10) < 1){
                return "0\(time.hour)"
            }else{
                return "\(time.hour)"
            }
        }
        var m: String{
            if((time.minute / 10) < 1){
                return "0\(time.minute)"
            }else{
                return "\(time.minute)"
            }
        }
        var s: String{
            if((time.second / 10) < 1){
                return "0\(time.second)"
            }else{
                return "\(time.second)"
            }
        }
        var t = "\(h):\(m):\(s)"
        
        
        return t
    }
}
extension Int{
    var second: Int{ return self % 60}
    var minute: Int{ return self / 60}
    var hour: Int{ return minute / 60}
    
}