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
    var calendar: NSCalendar = NSCalendar.autoupdatingCurrentCalendar()
    var dateFormatter = NSDateFormatter()
    var timeComponents = NSDateComponents()
    @IBOutlet weak var TimeLabel: UILabel!
    @IBOutlet weak var StudyPatternImageView: UIImageView!
    
    @IBOutlet weak var PauseResumeButton: UIButton!
    
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    var time: Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        time = 0
        stopButton.hidden = true
        dateFormatter.dateFormat = "HH:mm:ss"
        timeComponents.second = 0
        timeComponents.minute = 0
        timeComponents.hour = 0
        timeComponents.nanosecond = 0

        
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
                timeComponents.second++
        let date = (calendar.dateFromComponents(timeComponents))
        TimeLabel.text = dateFormatter.stringFromDate(date!)
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

