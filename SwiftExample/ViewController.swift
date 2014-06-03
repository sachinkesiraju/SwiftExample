//
//  ViewController.swift
//  SwiftExample
//
//  Created by Sachin Kesiraju on 6/3/14.
//  Copyright (c) 2014 Sachin Kesiraju. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Swift Demo"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!)
    {
        NSLog("Preparing for segue")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

