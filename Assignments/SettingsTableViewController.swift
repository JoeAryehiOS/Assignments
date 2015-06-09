//
//  SettingsTableViewController.swift
//  Assignments
//
//  Created by Aryeh Lieberman on 6/9/15.
//  Copyright (c) 2015 JoeAryehiOS. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    
    
    @IBOutlet weak var ShowCompletedAssignmentsSwitch: UISwitch!
        @IBOutlet weak var WorkPatternSwitch: UISwitch!
   
    @IBOutlet weak var WorkPatternPeriodSlider: UISlider!
    
    @IBOutlet weak var onPercentageSlider: UISlider!
    
    @IBOutlet weak var WorkPatternCell: UITableViewCell!
    
    @IBOutlet weak var WorkPatternPeriodCell: UITableViewCell!
    @IBOutlet weak var onPercentageCell: UITableViewCell!
    @IBOutlet weak var WorkPatternPeriodLabel: UILabel!
    @IBOutlet weak var onPercentageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func WorkPatternSwitchChanged(sender: AnyObject) {
        WorkPatternPeriodCell.hidden = !WorkPatternSwitch.on
        onPercentageCell.hidden = !WorkPatternSwitch.on
        CourseList.List.useWorkPeriod = WorkPatternSwitch.on
    }
    @IBAction func ShowCompletedSwitchChanged(sender: AnyObject) {
        CourseList.List.showCompleted = ShowCompletedAssignmentsSwitch.on
    }

    @IBAction func WorkPatternPeriodSliderChanged(sender: AnyObject) {
        WorkPatternPeriodLabel.text = "\(Int(WorkPatternPeriodSlider.value))"
        CourseList.List.workPeriod = Int(WorkPatternPeriodSlider.value * 60)
    }
    
    @IBAction func onPercentageSliderChanged(sender: AnyObject) {
        let value = onPercentageSlider.value
        
        let rounded = round(value * 100)/100
        
        CourseList.List.onPercentage = Double(rounded)
        onPercentageLabel.text = "\(rounded)%"
    }
    // MARK: - Table view data source

   
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
