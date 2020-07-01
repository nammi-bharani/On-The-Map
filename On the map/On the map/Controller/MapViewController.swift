//
//  MapViewController.swift
//  On the map
//
//  Created by Bharani Nammi on 6/30/20.
//  Copyright © 2020 Bharani Nammi. All rights reserved.
//

import Foundation
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // The "locations" array is an array of dictionary objects that are similar to the JSON
        // data that you can download from parse.
        

        
        
         print("outside the get location")
        print(StudentLocationModel.result.count)
        let locations = hardCodedLocationData()
        
        print("-------Printing data count-------")
        print(locations.count)
        //print(StudentLocationModel.result)
        
        // We will create an MKPointAnnotation for each dictionary in "locations". The
        // point annotations will be stored in this array, and then provided to the map view.
        var annotations = [MKPointAnnotation]()
        
        // The "locations" array is loaded with the sample data below. We are using the dictionaries
        // to create map annotations. This would be more stylish if the dictionaries were being
        // used to create custom structs. Perhaps StudentLocation structs.
        
        ParseClient.getStudentLocation { (result, error) in
            
            for dictionary in StudentLocationModel.result {
                let lat = CLLocationDegrees(dictionary.latitude)
            //print(lat)
            //print("")
                let long = CLLocationDegrees(dictionary.longitude)
//            print("")
//            print(lat)
//            print("")
            
                let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
            
                let first = dictionary.firstName
                let last = dictionary.lastName
                let mediaURL = dictionary.mediaURL
                           
                let annotation = MKPointAnnotation()
                annotation.coordinate = coordinate
                annotation.title = "\(first) \(last)"
                annotation.subtitle = mediaURL
                annotations.append(annotation)
            
            }
            
             self.mapView.addAnnotations(annotations)
        }
                
        // When the array is complete, we add the annotations to the map.
        self.mapView.addAnnotations(annotations)
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let reuseId = "pin"
        
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView

        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.canShowCallout = true
            pinView!.pinTintColor = .red
            pinView!.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        else {
            pinView!.annotation = annotation
        }
        
        return pinView
    }

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {
            let app = UIApplication.shared
            if let toOpen = view.annotation?.subtitle! {
                app.openURL(URL(string: toOpen)!)
            }
        }
    }
    
    func hardCodedLocationData() -> [Result]{
        
        _ = ParseClient.getStudentLocation() { result, error in
            StudentLocationModel.result = result
            
            
        }
        print("printing outside the get method")
        print(StudentLocationModel.result.count)
        return StudentLocationModel.result
    }
    
    func handleStudentLocation(result: [Result], error: Error?){
        
        print(StudentLocationModel.result.count)
        
        StudentLocationModel.result = result
        
        print(StudentLocationModel.result.count)

        
    }

}
