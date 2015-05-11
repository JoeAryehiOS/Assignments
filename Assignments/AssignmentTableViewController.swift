//
//  AssignmentTableViewController.swift
//  Assignments
//
//  Created by Aryeh Lieberman on 5/9/15.
//  Copyright (c) 2015 JoeAryehiOS. All rights reserved.
//

import UIKit

class AssignmentTableViewController: UITableViewController {

    @IBOutlet weak var NameField: UITextField!
    @IBOutlet weak var CourseField: UITextField!
    @IBOutlet weak var DetailView: UITextView!
    @IBOutlet weak var DueDatePicker: UIDatePicker!
   
    @IBOutlet weak var editButton: UIBarButtonItem!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let a = CourseList.List.list[CourseList.List.current].Assignments[CourseList.List.list[CourseList.List.current].current]
        NameField.text = a.assignmentName
        CourseField.text = CourseList.List.list[CourseList.List.current].courseName
        DetailView.text = a.detail
        DueDatePicker.date = a.dueDate
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.title = a.assignmentName
        DueDatePicker.userInteractionEnabled = false
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Edit(sender: UIBarButtonItem) {
        DueDatePicker.userInteractionEnabled = true
        sender.title = "Save"
    }
    
    // MARK: - Table view data source

   /* override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 0
    }

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 0
    }
*/
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...

        return cell
    }
    */

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
