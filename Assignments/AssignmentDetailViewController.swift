//
//  AssignmentDetailViewController.swift
//  Assignments
//
//  Created by Aryeh Lieberman on 3/11/15.
//  Copyright (c) 2015 JoeAryehiOS. All rights reserved.
//

import UIKit

class AssignmentDetailViewController: UIViewController {

    @IBOutlet weak var Title: UINavigationItem!
    @IBOutlet weak var details: UILabel!
    @IBOutlet weak var DueDate: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        Title.title = CourseList.List.list[CourseList.List.current].Assignments[CourseList.List.list[CourseList.List.current].current].assignmentName
        // Do any additional setup after loading the view.
        details.text = CourseList.List.list[CourseList.List.current].Assignments[CourseList.List.list[CourseList.List.current].current].detail
        DueDate.text = CourseList.List.list[CourseList.List.current].Assignments[CourseList.List.list[CourseList.List.current].current].dueDate.description
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
