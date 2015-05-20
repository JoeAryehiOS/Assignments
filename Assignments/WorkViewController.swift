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
    var calendar: NSCalendar = NSCalendar()
    @IBOutlet weak var TimeLabel: UILabel!
    @IBOutlet weak var StudyPatternImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = "hh:mm:ss"
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func StartStopButton(sender: UIButton) {
        switch(sender.titleLabel!.text!){
        case "Start":
            sender.titleLabel!.text = "Stop"
        case "Stop":
            sender.titleLabel!.text = "Start"
        default: break
            
        }
    }
    @IBAction func PauseButtonPressed(sender: UIButton) {
    }
    func startTimer(){
        timer = NSTimer(timeInterval: 1, target: self, selector: Selector("updateTime"), userInfo: nil, repeats: true)
    }
    func pauseTimer(){
        invalidateTimer()
        
    }
    func stopTimer(){
        invalidateTimer()
        TimeLabel.text = "00:00:00"
        components.second = 0
       
    }
    func invalidateTimer(){
        if(timer != nil){
            timer.invalidate()
        }
    }
    func updateTime(){
        components.second++
        TimeLabel.text = dateFormatter.stringFromDate(calendar.dateFromComponents(components)!)
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
