//
//  CameraViewController.swift
//  SwiftExample
//
//  Created by Sachin Kesiraju on 6/24/14.
//  Copyright (c) 2014 Sachin Kesiraju. All rights reserved.
//

import UIKit
import MobileCoreServices

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UIAlertViewDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var backgroundImage:UIImageView?
    
    var cameraUI:UIImagePickerController = UIImagePickerController()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }

    //pragma mark - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presentCamera()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cameraShow()
    {
        self.presentCamera()
    }
    
    //pragma mark - Camera
    
    func presentCamera()
    {
        cameraUI = UIImagePickerController()
        cameraUI.delegate = self
        cameraUI.sourceType = UIImagePickerControllerSourceType.Camera
        cameraUI.mediaTypes = [kUTTypeImage]
        cameraUI.allowsEditing = false
        
        self.presentViewController(cameraUI, animated: true, completion: nil)
    }
    
    //pragma mark- Image
    
    func imagePickerControllerDidCancel(picker:UIImagePickerController)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        var mediaType:String = editingInfo[UIImagePickerControllerEditedImage] as! String
        var imageToSave:UIImage
        
        imageToSave = editingInfo[UIImagePickerControllerOriginalImage]as! UIImage
        
        UIImageWriteToSavedPhotosAlbum(imageToSave, nil, nil, nil)
        self.savedImage()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func savedImage()
    {
        var alert:UIAlertView = UIAlertView()
        alert.title = "Saved!"
        alert.message = "Your picture was saved to Camera Roll"
        alert.delegate = self
        alert.addButtonWithTitle("Awesome")
        alert.show()
    }
    
    func alertView(alertView: UIAlertView!, didDismissWithButtonIndex buttonIndex: Int)
    {
        NSLog("Did dismiss button: %d", buttonIndex)
        self.presentCamera()
    }
}
