//
//  LocationVC.swift
//  SampleSearchDetails
//
//  Created by Doru Cojocaru on 24/08/2017.
//  Copyright © 2017 Doru Cojocaru. All rights reserved.
//

import UIKit
import MapKit

class LocationVC: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    var locationString = ""
    let regionRadius: CLLocationDistance = 3000

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let initialLocation = CLLocation(latitude: 51.509865, longitude: -0.118092)
        centerMapOnLocation(location: initialLocation)
        
        let tapGestureRec = UITapGestureRecognizer(target: self, action: #selector(tap(_:)))
        tapGestureRec.delegate = self
        mapView.addGestureRecognizer(tapGestureRec)
        
    }
    
    func tap(_ gestureRecognizer: UITapGestureRecognizer) {
        let location = gestureRecognizer.location(in: mapView)
        let coordinate = mapView.convert(location, toCoordinateFrom: mapView)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
        getLocationAddress(location: CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude))
    }
    
    func getLocationAddress(location: CLLocation) {
        let geocoder = CLGeocoder()
        var addressString = ""
        print("getting the location.................")
        
        DispatchQueue.main.async {
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            var placemark: CLPlacemark!
            
            if error == nil && placemarks!.count > 0 {
                placemark = placemarks![0] as CLPlacemark
                
                
                let place = placemark.addressDictionary!["Name"] as! String
                addressString += place + ", "
                let city = placemark.addressDictionary!["City"] as! String
                addressString += city + "."
                
                self.locationString = addressString
                print(addressString)
            }
        }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? ChooseDetailsTableVC
        destination?.location = locationString
        destination?.titlesAndValues![0][2].1 = locationString
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
 }

extension LocationVC: UIGestureRecognizerDelegate {
}
