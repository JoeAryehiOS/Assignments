//
//  CourseViewController.swift
//  Assignments
//
//  Created by Aryeh Lieberman on 4/30/15.
//  Copyright (c) 2015 JoeAryehiOS. All rights reserved.
//

import UIKit

class CourseViewController: UIViewController {

    @IBOutlet weak var CourseNumberField: UITextField!
    @IBOutlet weak var CourseNameField: UITextField!
    var fromAssignment = false
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    func DismissKeyboard(){
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func DidEndOnExit(sender: AnyObject) {
        CourseNameField.resignFirstResponder()
        CourseNumberField.resignFirstResponder()
    }
    
    
    @IBAction func Add(sender: AnyObject) {
        let course = Course(courseName: CourseNameField.text, courseNumber: CourseNumberField.text)
        CourseList.List.list.append(course)
        
        
        dismissViewControllerAnimated(true, completion: nil)
                   }
}
