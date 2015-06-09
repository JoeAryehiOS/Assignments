//
//  AssignmentDetailViewController.swift
//  Assignments
//
//  Created by Aryeh Lieberman on 3/11/15.
//  Copyright (c) 2015 JoeAryehiOS. All rights reserved.
//

import UIKit

class AssignmentDetailViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var ac: assignmentCourse?
        override func viewDidLoad() {
        super.viewDidLoad()
            var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
            view.addGestureRecognizer(tap)
    }
    

    var courseIndex: Int?
    var fromCourse = false
    @IBOutlet weak var CourseField: UITextField!
    @IBOutlet weak var TimePicker: UIPickerView!
    @IBOutlet weak var DatePicker: UIDatePicker!
    @IBOutlet weak var DetailField: UITextView!
    @IBOutlet weak var NameField: UITextField!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func DismissKeyboard(){
        view.endEditing(true)
    }
    
    @IBAction func Add(sender: AnyObject) {
        let time = Double(TimePicker.selectedRowInComponent(0) * 60 * 60) + Double(TimePicker.selectedRowInComponent(1) * 60)
        let assignment = Assignment(assignmentName: NameField.text, dueDate: DatePicker.date, timeToComplete: time , Details: DetailField.text)
        //need to add timeToComplete
      CourseList.List.list[courseIndex!].Assignments.append(assignment)
        self.navigationController?.popToRootViewControllerAnimated(true)
        
           }
    
    @IBAction func Cancel(sender: AnyObject) {
       self.navigationController?.popToRootViewControllerAnimated(true)
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
            self.fromCourse = true
            self.performSegueWithIdentifier("CourseFromAssignment", sender: self)
            
            })
        presentViewController(alert, animated: true, completion: nil)    }
    
    
    override func viewDidAppear(animated: Bool) {
        if(fromCourse){
            CourseField.text = CourseList.List.list[CourseList.List.list.count - 1].courseName
            courseIndex = CourseList.List.list.count - 1
            fromCourse = false
        }
    }
    
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
   /* override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if(segue.identifier == )
    }*/

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
        }
        else{
            return "\(row) minutes"
        }
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    @IBAction func DidEndOnExit(sender: AnyObject) {
        NameField.resignFirstResponder()
        
    }
    
}
enum assignmentCourse{
    case Course, Assignment
}
