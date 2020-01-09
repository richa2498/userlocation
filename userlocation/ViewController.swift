//
//  ViewController.swift
//  userlocation
//
//  Created by MacStudent on 2020-01-09.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit
import  CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {

    @IBOutlet weak var attitude_lbl: UILabel!
    @IBOutlet weak var latitude_lbl: UILabel!
    var locationManager = CLLocationManager()
    @IBOutlet weak var address_lbl: UILabel!
    @IBOutlet weak var spped_lbl: UILabel!
    @IBOutlet weak var course_lbl: UILabel!
    @IBOutlet weak var long_lbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
       
        latitude_lbl.text = String(location.coordinate.latitude)
        long_lbl.text = String(location.coordinate.longitude)
        spped_lbl.text = String(location.speed)
        course_lbl.text = String(location.course)
        attitude_lbl.text = String(location.altitude)
        
        CLGeocoder().reverseGeocodeLocation(location) { (placemarks, error) in
            if let error = error {
                     print(error)
                 } else {
                     if let placemark = placemarks?[0] {
                         
                         var  address = ""
                         if placemark.subThoroughfare != nil {
                             address += placemark.subThoroughfare! + "\n"
                         }
                        
                         if placemark.thoroughfare != nil {
                             address += placemark.thoroughfare! + "\n"
                         }
                     
                         if placemark.subLocality != nil {
                             address += placemark.subLocality! + "\n"
                         }
                    
                         if placemark.subAdministrativeArea != nil {
                             address += placemark.subAdministrativeArea! + "\n"
                         }
                   
                         if placemark.postalCode != nil{
                             address += placemark.postalCode! + "\n"
                             
                         }
                      
                         if placemark.country != nil{
                             address += placemark.country! + "\n"
                         }
                      
                        self.address_lbl.text = address
                        print(address)
                     }
                 }
                 
        }
    }

}

