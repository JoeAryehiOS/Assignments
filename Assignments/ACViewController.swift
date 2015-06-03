//
//  ACViewController.swift
//  Assignments
//
//  Created by Aryeh Lieberman on 6/3/15.
//  Copyright (c) 2015 JoeAryehiOS. All rights reserved.
//

import UIKit

class ACViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var ACSwitch: UISegmentedControl!
    @IBOutlet weak var CourseTableView: UITableView!
    @IBOutlet weak var AssignmentTableView: UITableView!
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    override func viewDidLoad() {
        CourseTableView.hidden = true
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if(ACSwitch.selectedSegmentIndex == 0){
            return CourseList.List.list.count
        }
        else{
            return 1
        }
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(ACSwitch.selectedSegmentIndex == 0){
            return CourseList.List.list[section].Assignments.count
        }else{
            return CourseList.List.list.count
        }
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(ACSwitch.selectedSegmentIndex == 0){
            return CourseList.List.list[section].courseName
        }
        else{
            return nil
        }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        <#code#>
    }
    
    

}
