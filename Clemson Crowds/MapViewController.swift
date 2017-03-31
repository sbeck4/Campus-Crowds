//
//  MapViewController.swift
//  Clemson Crowds
//
//  Created by Shannon Beck on 3/29/17.
//  Copyright © 2017 Shannon Beck. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var mapView: MKMapView!
    var places: [Place] = []
    let initialLocation = CLLocation(latitude: 34.676099, longitude: -82.836976)
    let regionRadius: CLLocationDistance = 900
    var locationManager: CLLocationManager!
    var location: CLLocation?
    var tappedPlace: Place?
    var calloutView: MapAccessoryView?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        getLocation()
        
        mapView.delegate = self
        mapView.showsUserLocation = true;
        centerMapOnLocation(location: initialLocation)
        addPins()

        self.title = "Map View"
    }

    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }

    func addPins() {
        for place in places {
            mapView.addAnnotation(place)
        }
    }
    
    func mapView(_ mapView: MKMapView, annotationView: MKAnnotationView, calloutAccessoryControlTapped control: UIControl)
    {
        for place in places
        {
            if(place.name == (annotationView.annotation?.title)!)
            {
                tappedPlace = place
            }
        }
        
        self.performSegue(withIdentifier: "showDetailFromMap", sender: nil)
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? Place {
            let identifier = "pin"
            annotation.title = annotation.name!
            var view: MKPinAnnotationView

            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
                as? MKPinAnnotationView { // 2
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                // 3
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.pinTintColor = UIColor.orange

                let button = UIButton.init(type: .detailDisclosure)
                button.tintColor = UIColor.orange
                view.rightCalloutAccessoryView = button

                let detailViews = Bundle.main.loadNibNamed("DetailAccessoryView", owner: nil, options: nil)
                let detailView = (detailViews?[0] as? DetailAccessoryView)!
                detailView.placeView.layer.cornerRadius = detailView.placeView.frame.size.width/2
                detailView.placeView.clipsToBounds = true

                detailView.crowdView.layer.cornerRadius = detailView.crowdView.frame.size.width/2
                detailView.crowdView.clipsToBounds = true

                detailView.placeIconView.image = annotation.placeImageIcon()
                detailView.crowdIconView.image = annotation.crowdImage()
                detailView.crowdDescriptionLabel.text = annotation.crowdDescription()

                let widthConstraint = NSLayoutConstraint(item: detailView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 179)
                detailView.addConstraint(widthConstraint)

                let heightConstraint = NSLayoutConstraint(item: detailView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 118)
                detailView.addConstraint(heightConstraint)

                view.detailCalloutAccessoryView = detailView

                view.canShowCallout = true
            }

            return view
        }
        return nil
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "showDetailFromMap"
        {
            let destVC = segue.destination as! DetailViewController
            destVC.place = tappedPlace!
        }
    }
    
    func getLocation()
    {
        if CLLocationManager.authorizationStatus() == .authorizedAlways ||
            CLLocationManager.authorizationStatus() == .authorizedWhenInUse
        {
            
            if (CLLocationManager.locationServicesEnabled())
            {
                
                locationManager.startUpdatingLocation()

                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0)
                {
                    self.locationManager!.stopUpdatingLocation()
                }
            }
        }
        else
        {
            locationManager.requestWhenInUseAuthorization()
        }
    }

}


extension MapViewController: CLLocationManagerDelegate
{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        location = locations.last! as CLLocation
        centerMapOnLocation(location: location!)
    }
}

