//
//  MapViewController.swift
//  SwiftExample
//
//  Created by Sachin Kesiraju on 7/15/14.
//  Copyright (c) 2014 Sachin Kesiraju. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var mapView : MKMapView?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }
    
    required init(coder aDecoder: NSCoder)  {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        self.mapView.delegate = self
        let location = "1 Infinity Loop, Cupertino, CA"
        var geocoder:CLGeocoder = CLGeocoder()
        geocoder.geocodeAddressString(location, {(placemarks, error) -> Void in
            
            if((error) != nil){
                
                println("Error", error)
            }
                
            else if let placemark = placemarks?[0] as? CLPlacemark {
                
                var placemark:CLPlacemark = placemarks[0] as CLPlacemark
                var coordinates:CLLocationCoordinate2D = placemark.location.coordinate
                
                var pointAnnotation:MKPointAnnotation = MKPointAnnotation()
                pointAnnotation.coordinate = coordinates
                pointAnnotation.title = "Apple HQ"
                
                self.mapView?.addAnnotation(pointAnnotation)
                self.mapView?.centerCoordinate = coordinates
                self.mapView?.selectAnnotation(pointAnnotation, animated: true)
                
                println("Added annotation to map view")
            }
            
            })
    }
    
    func mapView (mapView: MKMapView!,
        viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
            
            var pinView:MKPinAnnotationView = MKPinAnnotationView()
            pinView.annotation = annotation
            pinView.pinColor = MKPinAnnotationColor.Red
            pinView.animatesDrop = true
            pinView.canShowCallout = true
            
            return pinView
    }
    
    func mapView(mapView: MKMapView!,
        didSelectAnnotationView view: MKAnnotationView!){
            
            println("Selected annotation")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
