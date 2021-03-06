//
//  TableViewController.swift
//  Assignments
//
//  Created by Aryeh Lieberman on 3/9/15.
//  Copyright (c) 2015 JoeAryehiOS. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet var ACTable: UITableView!
    @IBOutlet weak var ACSwitch: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CourseList.List.unArchiving()
        
        // Do any additional setup after loading the view, typically from a nib.
      self.navigationItem.leftBarButtonItem = self.editButtonItem()
//        
//        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject")
//        self.navigationItem.rightBarButtonItem = addButton
        
        
       


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        
        
    
    }
    
    @IBAction func Add(sender: AnyObject) {
        if(ACSwitch.selectedSegmentIndex == 0){
        let alert = UIAlertController(title: "Add", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let assignmentAction = UIAlertAction(title: "Assignment", style: UIAlertActionStyle.Default){
            action in
            self.performSegueWithIdentifier("Assignment", sender: self)
            
        }
                let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
       
        alert.addAction(assignmentAction)
        alert.addAction(cancelAction)
        presentViewController(alert, animated: true, completion: nil)
        }else{
            let alert = UIAlertController(title: "Add", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
            
            let assignmentAction = UIAlertAction(title: "Course", style: UIAlertActionStyle.Default){
                action in
                self.performSegueWithIdentifier("Course", sender: self)
                
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            
            alert.addAction(assignmentAction)
            alert.addAction(cancelAction)
            presentViewController(alert, animated: true, completion: nil)
            
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if(ACSwitch.selectedSegmentIndex == 0){
            self.performSegueWithIdentifier("ShowAssignment", sender: self)
        }else{
            self.performSegueWithIdentifier("ShowCourse", sender: self)
        }
    }
    @IBAction func ACSwitch(sender: AnyObject) {
        switch(ACSwitch.selectedSegmentIndex){
        case 0: break
        case 1: self.tableView.reloadData()
        default: break
        }
        ACTable.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        if(ACSwitch.selectedSegmentIndex == 0){
            return CourseList.List.list.count}
        else{
            return 1
        }
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        if(ACSwitch.selectedSegmentIndex == 0){
            return CourseList.List.list[section].Assignments.count}
        else{
            return CourseList.List.list.count
        }
    }
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(ACSwitch.selectedSegmentIndex == 0){
        if(!CourseList.List.list[section].Assignments.isEmpty){
            return CourseList.List.list[section].courseName}
        else{
            return nil
            }}else{
            return nil
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if(ACSwitch.selectedSegmentIndex == 0){
        let cell = tableView.dequeueReusableCellWithIdentifier("Reuse Identifier", forIndexPath: indexPath) as! UITableViewCell

        
       
        cell.textLabel?.text = CourseList.List.list[indexPath.section].Assignments[indexPath.row].assignmentName
        let detail = CourseList.List.list[indexPath.section].Assignments[indexPath.row].detail!
        let date = CourseList.List.list[indexPath.section].Assignments[indexPath.row].dueDate!
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy"
        dateFormatter.timeZone = NSTimeZone.localTimeZone()

        cell.detailTextLabel?.text = "\(dateFormatter.stringFromDate(date))   \(detail)"
            if(CourseList.List.list[indexPath.section].Assignments[indexPath.row].isCompleted){
                //let colorComponents: [CGFloat] = [0.0, 1.0, 0.0, 1.0]
                cell.backgroundColor = UIColor(red: 0.0, green: 0.8, blue: 0.3, alpha: 1.0)
                
            }
        return cell
        }else{
            let cell = tableView.dequeueReusableCellWithIdentifier("Reuse Identifier", forIndexPath: indexPath) as! UITableViewCell
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
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
        CourseList.List.save()
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if(ACSwitch.selectedSegmentIndex == 0){
        if editingStyle == .Delete {
            CourseList.List.list[indexPath.section].Assignments.removeAtIndex(indexPath.row)
            if(CourseList.List.list[indexPath.section].Assignments.isEmpty){
                editCourse(indexPath.section)
            }
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
            CourseList.List.save()
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
            }}
        else{
            
            if editingStyle == .Delete {
                CourseList.List.list.removeAtIndex(indexPath.row)
                
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
                CourseList.List.save()
            } else if editingStyle == .Insert {
                // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
            }
            
        }
    }
    override func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String! {
        return "Banana"
    }
   
    
    func editCourse(CourseIndex: Int){
        let alert = UIAlertController(title: "Edit Course", message: "Do you want to delete the course: \(CourseList.List.list[CourseIndex].courseName)", preferredStyle: UIAlertControllerStyle.Alert)
        let Delete = UIAlertAction(title: "Delete", style: UIAlertActionStyle.Default){
            action in
            CourseList.List.list.removeAtIndex(CourseIndex)
            self.tableView.reloadData()
            
        }
        let Keep = UIAlertAction(title: "Keep", style: UIAlertActionStyle.Default){
            action in
            
        }
        
        alert.addAction(Delete)
        alert.addAction(Keep)
        presentViewController(alert, animated: true, completion: nil)

    }
    
    
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
        switch (segue.identifier!){
        case "ShowAssignment":
            let indexPath = self.tableView.indexPathForSelectedRow()!
            CourseList.List.current = indexPath.section
            CourseList.List.list[CourseList.List.current].current = indexPath.row
            let dvc = segue.destinationViewController as! AssignmentTableViewController
            dvc.a = CourseList.List.list[indexPath.section].Assignments[indexPath.row]
        case "ShowCourse":
            let indexPath = self.tableView.indexPathForSelectedRow()!
            CourseList.List.current = indexPath.section
            let dvccctc = segue.destinationViewController as! CourseContentsTableViewController
            dvccctc.course = CourseList.List.list[CourseList.List.current]
        
        default: break
        }
//        if(segue.identifier == "showAssignment"){
//            let indexPath = self.tableView.indexPathForSelectedRow()!
//            CourseList.List.current = indexPath.section
//            CourseList.List.list[CourseList.List.current].current = indexPath.row
//                    }
                          }
    
    

}
