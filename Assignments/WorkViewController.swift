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
    var components: NSDateComponents = NSDateComponents()
    var dateFormatter: NSDateFormatter = NSDateFormatter()
    var calendar: NSCalendar = NSCalendar.autoupdatingCurrentCalendar()
    @IBOutlet weak var TimeLabel: UILabel!
    @IBOutlet weak var StudyPatternImageView: UIImageView!
    
    @IBOutlet weak var PauseResumeButton: UIButton!
    @IBOutlet weak var StartStopButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.
        dateFormatter.dateFormat = "hh:mm:ss"
        components.second = 0
        components.hour = 0
        components.minute = 0
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func StartStopButton(sender: UIButton) {
        switch(sender.titleLabel!.text!){
        case "Start":
            StartStopButton.titleLabel!.text = "Stop"
            startTimer()
        case "Stop":
            StartStopButton.titleLabel!.text = "Start"
            stopTimer()
        default: break
            
        }
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
        components.second = 0
        components.minute = 0
        components.hour = 0
       
    }
    func invalidateTimer(){
        if(timer != nil){
            timer.invalidate()
        }
    }
    func updateTime(){
        components.second++
        let a = calendar.dateFromComponents(components)
        TimeLabel.text = dateFormatter.stringFromDate(a!)
        //print(dateFormatter.stringFromDate(calendar.dateFromComponents(components)!))
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
