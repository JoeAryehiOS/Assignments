//
//  CourseContentsTableViewController.swift
//  Assignments
//
//  Created by Aryeh Lieberman on 5/26/15.
//  Copyright (c) 2015 JoeAryehiOS. All rights reserved.
//

import UIKit

class CourseContentsTableViewController: UITableViewController {
    var course: Course!
    
    
    @IBOutlet weak var CourseName: UITextField!
    
    @IBOutlet weak var CourseNumber: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        course = CourseList.List.list[CourseList.List.current]
        self.navigationController?.title = course.courseName
        CourseName.text = course.courseName
        CourseNumber.text = course.courseNumber
        CourseName.userInteractionEnabled = false
        CourseNumber.userInteractionEnabled = false
        Save()
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    func DismissKeyboard(){
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func Save(){
        CourseNumber.userInteractionEnabled = false
        CourseName.userInteractionEnabled = false
        let editButton = UIBarButtonItem(barButtonSystemItem: .Edit, target: self, action: "Edit")
        self.navigationItem.rightBarButtonItem = editButton
    }
    func Edit(){
        CourseName.userInteractionEnabled = true
        CourseName.userInteractionEnabled = true
               let saveButton = UIBarButtonItem(barButtonSystemItem: .Save, target: self, action: "Save")
        self.navigationItem.rightBarButtonItem = saveButton
    }

    
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
