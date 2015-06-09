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
    
    @IBOutlet weak var ACTableView: UITableView!
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    override func viewDidLoad() {
        ACTableView.reloadData()
        CourseList.List.unArchiving()
            }
    
    @IBAction func ACSwitchChanged(sender: AnyObject) {
        ACTableView.reloadData()
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
        
        if(ACSwitch.selectedSegmentIndex == 0){
            let cell = tableView.dequeueReusableCellWithIdentifier("AssignmentIdentifier", forIndexPath: indexPath) as! UITableViewCell
            
            
            
            cell.textLabel?.text = CourseList.List.list[indexPath.section].Assignments[indexPath.row].assignmentName
            let detail = CourseList.List.list[indexPath.section].Assignments[indexPath.row].detail!
            let date = CourseList.List.list[indexPath.section].Assignments[indexPath.row].dueDate!
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "MM/dd/yy"
            dateFormatter.timeZone = NSTimeZone.localTimeZone()
            
            cell.detailTextLabel?.text = "\(dateFormatter.stringFromDate(date))   \(detail)"
            if(CourseList.List.list[indexPath.section].Assignments[indexPath.row].isCompleted){
            if(CourseList.List.showCompleted){
                cell.tintColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
            }else{
                
                cell.hidden = true
                }}
            return cell
        }else{
            let cell = tableView.dequeueReusableCellWithIdentifier("CourseIdentifier", forIndexPath: indexPath) as! UITableViewCell
            cell.textLabel?.text = CourseList.List.list[indexPath.row].courseName
            if(CourseList.List.list[indexPath.row].courseNumber != nil){
                cell.detailTextLabel?.text = "\(CourseList.List.list[indexPath.row].courseNumber!)"
            }else{
                cell.detailTextLabel?.hidden = true
            }
            // Configure the cell...
            
            return cell
        }
        

    }
    
    
    

}
