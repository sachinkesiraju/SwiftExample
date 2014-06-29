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
    var snapshot:UIView = UIView()
    var sourceIndexPath:NSIndexPath = NSIndexPath()
    
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

    /*@IBAction func longPressRecognized(sender:AnyObject){
        
        var longGesture:UILongPressGestureRecognizer = sender as UILongPressGestureRecognizer
        var gestureState:UIGestureRecognizerState = longGesture.state
        
        var point:CGPoint = longGesture.locationInView(self.tableView)
        var indexPath:NSIndexPath = self.tableView.indexPathForRowAtPoint(point)
        
        switch(gestureState){
            
        case UIGestureRecognizerState.Began:
        {
            
            if(indexPath)
            {
                sourceIndexPath = indexPath
                var cell:UITableViewCell = self.tableView.cellForRowAtIndexPath(indexPath)
                snapshot = self.customSnapshotFromView(cell)
                
                var center:CGPoint = cell.center
                snapshot.center = center
                snapshot.alpha = 0.0
                self.tableView.addSubview(snapshot)
                UIView.animateWithDuration(0.25, animations: {(
                    
                    center.y = point.y,
                    snapshot.center = center,
                    snapshot.transform = CGAffineTransformMakeScale(1.05, 1.05),
                    snapshot.alpha = 0.98,
                    
                    cell.backgroundColor = UIColor.blackColor()
                    
                    )})
            }
        }
        break
        
    }
    
    func customSnapshotFromView(inputView:UIView) -> UIView
    {
        var snapshot:UIView = inputView.snapshotViewAfterScreenUpdates(true)
        snapshot.layer.masksToBounds = false
        snapshot.layer.cornerRadius = 0.0
        snapshot.layer.shadowOffset = CGSizeMake(-5.0, 0.0)
        snapshot.layer.shadowRadius = 5.0
        snapshot.layer.shadowOpacity = 0.4
        
        return snapshot
    }
    
*/
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
    
    override func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool
    {
        if(indexPath.row == 0)
        {
            return false
        }
        else
        {
            return true
        }
    }
    
    override func tableView(tableView: UITableView!, moveRowAtIndexPath sourceIndexPath: NSIndexPath!, toIndexPath destinationIndexPath: NSIndexPath!)
    {
        var stringToMove:NSString = self.tableArray.objectAtIndex(sourceIndexPath.row) as NSString
        self.tableArray.removeObjectAtIndex(sourceIndexPath.row)
        self.tableArray.insertObject(stringToMove, atIndex: sourceIndexPath.row)
    }
    
    override func tableView(tableView: UITableView!, targetIndexPathForMoveFromRowAtIndexPath sourceIndexPath: NSIndexPath!, toProposedIndexPath proposedDestinationIndexPath: NSIndexPath!) -> NSIndexPath!
    {
        return proposedDestinationIndexPath
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
            alert.addButtonWithTitle("OK")
            
            alert.show()
        }
}
