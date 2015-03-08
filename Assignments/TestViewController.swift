//
//  TestViewController.swift
//  Assignments
//
//  Created by Aryeh Lieberman on 3/7/15.
//  Copyright (c) 2015 JoeAryehiOS. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var Assignmentlabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func TestAssignment(sender: AnyObject) {
        var a: Assignment = Assignment(assignmentName: "10.2", dueDate: NSDate(), timeToComplete: 2.2, details: "#1,2,3")
            a.setTimeToComplete(10.0, newTimeMinutes: 10.0)
        println(a.timeToComplete)
        Assignmentlabel.text = a.getDescription()
            
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
