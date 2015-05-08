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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func Add(sender: AnyObject) {
        let course = Course(courseName: CourseNameField.text, courseNumber: CourseNumberField.text.toInt())
        CourseList.List.list.append(course)
        dismissViewControllerAnimated(true){
             action in
              let a = self.navigationController?.viewControllers[self.navigationController!.viewControllers.endIndex! - 1] as AssignmentDetailViewController
            a.CourseField.text = CourseList.List.list[CourseList.List.list.count - 1].courseName
            a.courseIndex = CourseList.List.list.count - 1

        }
            }
    

    /*
    // MARK: - Nav  igation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
