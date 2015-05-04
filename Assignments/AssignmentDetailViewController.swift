//
//  AssignmentDetailViewController.swift
//  Assignments
//
//  Created by Aryeh Lieberman on 3/11/15.
//  Copyright (c) 2015 JoeAryehiOS. All rights reserved.
//

import UIKit

class AssignmentDetailViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var ac: assignmentCourse?
        override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    var courseIndex: Int?
    @IBOutlet weak var CourseField: UITextField!
    @IBOutlet weak var TimePicker: UIPickerView!
    @IBOutlet weak var DatePicker: UIDatePicker!
    @IBOutlet weak var DetailField: UITextView!
    @IBOutlet weak var NameField: UITextField!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Add(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        var time: Double = Double(TimePicker.selectedRowInComponent(0) * 60) + Double(TimePicker.selectedRowInComponent(1))
        let assignment = Assignment(assignmentName: NameField.text, dueDate: DatePicker.date, timeToComplete: time, Details: DetailField.text)
        //need to add timeToComplete
      CourseList.List.list[courseIndex!].Assignments.append(assignment)
           }
    @IBAction func CourseSelection(sender: AnyObject) {
        let alert = UIAlertController(title: nil, message: "Choose Course", preferredStyle: UIAlertControllerStyle.ActionSheet)
        for i in enumerate(CourseList.List.list){
            alert.addAction(UIAlertAction(title: i.element.courseName, style: UIAlertActionStyle.Default){
                action in
                self.CourseField.text = i.element.courseName
                self.courseIndex = i.index
                         })
        }
        alert.addAction(UIAlertAction(title: "Other", style: .Default){
            action in
            self.performSegueWithIdentifier("CourseFromAssignment", sender: self)
           
            })
        presentViewController(alert, animated: true){
            action in
           
        }
    }
    
    
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(component == 0){
            return 100
        }
        else{
            return 60
        }
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        if(component == 0){
            return "\(row) hours"
        }else{
            return "\(row) minutes"
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

}
enum assignmentCourse{
    case Course, Assignment
}
