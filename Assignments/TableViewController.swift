//
//  TableViewController.swift
//  Assignments
//
//  Created by Aryeh Lieberman on 3/9/15.
//  Copyright (c) 2015 JoeAryehiOS. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        // Do any additional setup after loading the view, typically from a nib.
//        self.navigationItem.leftBarButtonItem = self.editButtonItem()
//        
//        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject")
//        self.navigationItem.rightBarButtonItem = addButton
        
        
       


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        
        
    
    }
    @IBAction func Add(sender: AnyObject) {
        let alert = UIAlertController(title: "Add", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        let courseAction = UIAlertAction(title: "Course", style: UIAlertActionStyle.Default){
            action in
           self.performSegueWithIdentifier("Course", sender: self)
            
        }
        let assignmentAction = UIAlertAction(title: "Assignment", style: UIAlertActionStyle.Default){
            action in
            self.performSegueWithIdentifier("Assignment", sender: self)
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alert.addAction(courseAction)
        alert.addAction(assignmentAction)
        alert.addAction(cancelAction)
        presentViewController(alert, animated: true, completion: nil)
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return CourseList.List.list.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return CourseList.List.list[section].Assignments.count
    }
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return CourseList.List.list[section].courseName
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Reuse Identifier", forIndexPath: indexPath) as! UITableViewCell

        
       
        cell.textLabel?.text = CourseList.List.list[indexPath.section].Assignments[indexPath.row].assignmentName
        var detail = CourseList.List.list[indexPath.section].Assignments[indexPath.row].detail!
        var date = CourseList.List.list[indexPath.section].Assignments[indexPath.row].dueDate!
        
        cell.detailTextLabel?.text = "\(date)   \(detail)"
        return cell
    }
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    // Override to support conditional editing of the table view.
    /*override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }*/
    
    
    
    // Override to support editing the table view.
    
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "showAssignment"){
            let indexPath = self.tableView.indexPathForSelectedRow()!
            CourseList.List.current = indexPath.section
            CourseList.List.list[CourseList.List.current].current = indexPath.row
                    }
                          }
    
    

}
