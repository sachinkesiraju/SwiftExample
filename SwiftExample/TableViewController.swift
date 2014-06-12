//
//  TableViewController.swift
//  SwiftExample
//
//  Created by Sachin Kesiraju on 6/3/14.
//  Copyright (c) 2014 Sachin Kesiraju. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var tableArray:NSMutableArray = ["Swift", "Objective -C", "Python", "Java", "Ruby"]
    
    init(style: UITableViewStyle) {
        super.init(style: style)
        // Custom initialization
    }
    
    init(coder aDecoder: NSCoder!)  {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Table View"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //#pragma mark - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        
        // Return the number of rows in the section.
        return tableArray.count;
    }
    
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool
    {
        return true;
    }
    
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!)
    {
        if(editingStyle == UITableViewCellEditingStyle.Delete)
        {
            tableArray.removeObjectAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
            tableView.reloadData()
        }
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel.text = tableArray.objectAtIndex(indexPath.row) as NSString
        
        return cell
    }

    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!)
    {
        self.showAlert(tableArray.objectAtIndex(indexPath.row) as NSString, rowToUseInAlert: indexPath.row)
    }

    //#pragma mark - UIAlertView delegate methods
    
        func alertView(alertView: UIAlertView!, didDismissWithButtonIndex buttonIndex: Int) {
            NSLog("Did dismiss button: %d", buttonIndex)
        }
        
        // Function to init a UIAlertView and show it
    func showAlert(rowTitle:NSString, rowToUseInAlert: Int) {
            var alert = UIAlertView()
            
            alert.delegate = self
            alert.title = rowTitle
            alert.message = "You selected row \(rowToUseInAlert)"
            alert.addButtonWithTitle("Cancel")
            alert.addButtonWithTitle("OK")
            
            alert.show()
        }
}
