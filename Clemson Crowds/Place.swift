//
//  Place.swift
//  Clemson Crowds
//
//  Created by Shannon Beck on 1/29/17.
//  Copyright © 2017 Shannon Beck. All rights reserved.
//

import UIKit
import MapKit

// Each location has:
/*  Name
 *  Latitude
 *  Longitude
 *  Current crowd level
 *  last updated time
 */
import FirebaseDatabase

class Place: NSObject, MKAnnotation {

    var name: String!
    var latitude: Double!
    var longitude: Double!
    var currentCrowdLevel: Int!
    var imageName: String!
    var maxCrowdNumber: Int!
    var currentCrowdNumber: Int!
    var floors: [Place]!
    var placeImage: String!
    var coordinate: CLLocationCoordinate2D {
        get {
            return CLLocationCoordinate2D.init(latitude: CLLocationDegrees.init(latitude), longitude: CLLocationDegrees.init(longitude))
        }
    }
    var title: String?
    var subtitle: String?

    override init() {
        super.init()
    }


    init(name: String, latitude: Double, longitude: Double, currentCrowdLevel: Int, imageName: String, maxCrowdNumber: Int, currentCrowdNumber: Int, floors: [Place], placeImage: String) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.currentCrowdLevel = currentCrowdLevel
        self.imageName = imageName
        self.floors = floors
        self.maxCrowdNumber = maxCrowdNumber
        self.currentCrowdNumber = currentCrowdNumber
        self.placeImage = placeImage
        self.title = name
        self.subtitle = ""

        super.init()

    }

    class func snapshotToPlace(snap: FIRDataSnapshot) -> Place {
        let place = Place()

        place.name = snap.childSnapshot(forPath: "name").value as? String ?? "Empty"
        place.latitude = Double(snap.childSnapshot(forPath: "latitude").value as! String)
        place.longitude = Double(snap.childSnapshot(forPath: "longitude").value as! String)
        place.currentCrowdLevel = Int(snap.childSnapshot(forPath: "currentCrowdLevel").value as! String)
        place.imageName = snap.childSnapshot(forPath: "imageName").value as! String
        place.floors = []
        if snap.childSnapshot(forPath: "floors").childrenCount > 0 {
            let floors = snap.childSnapshot(forPath: "floors").children
            for (_, floor) in floors.enumerated() {
                let dict = (floor as! FIRDataSnapshot).value! as! [String:String]
                let aFloor = Place.init(name: dict["name"]!, latitude: Double(dict["latitude"]! as String)!, longitude: Double(dict["longitude"]! as String)!, currentCrowdLevel: Int(dict["currentCrowdLevel"]! as String)!, imageName: dict["imageName"]!, maxCrowdNumber: Int(dict["maxCrowdNumber"]! as String)!, currentCrowdNumber: Int(dict["currentCrowdLevel"]! as String)!, floors: [], placeImage: dict["placeImage"]!)
                place.floors.append(aFloor)
            }
        }
        place.maxCrowdNumber = Int(snap.childSnapshot(forPath: "maxCrowdNumber").value as! String)
        place.currentCrowdNumber = Int(snap.childSnapshot(forPath: "currentCrowdNumber").value as! String)
        place.placeImage = snap.childSnapshot(forPath: "placeImage").value as! String

        return place
    }

    func dictionaryOf() -> [String: String] {
        return ["name": name!, "latitude": String(describing: latitude!), "longitude": String(describing: longitude!), "currentCrowdLevel": String(describing: currentCrowdLevel!), "imageName": imageName!, "maxCrowdNumber": String(describing: maxCrowdNumber!), "currentCrowdNumber": String(describing: currentCrowdNumber!), "placeImage": String(describing: placeImage!)]
    }

    func placeImageIcon() -> UIImage {
        switch self.imageName! {
        case "food":
            return #imageLiteral(resourceName: "food")
        case "fitness":
            return #imageLiteral(resourceName: "fitness")
        case "bus":
            return #imageLiteral(resourceName: "bus")
        case "burger":
            return #imageLiteral(resourceName: "burger")
        case "bagel":
            return #imageLiteral(resourceName: "bagel")
        case "study":
            return #imageLiteral(resourceName: "study")
        case "books":
            return #imageLiteral(resourceName: "books")
        case "computer":
            return #imageLiteral(resourceName: "computer")
        case "coffee":
            return #imageLiteral(resourceName: "coffee")
        default:
            return #imageLiteral(resourceName: "food")
        }
    }

    func crowdImage() -> UIImage {
        switch self.currentCrowdLevel {
        case 0:
            return #imageLiteral(resourceName: "notCrowded")
        case 1:
            return #imageLiteral(resourceName: "regularCrowd")
        case 2:
            return #imageLiteral(resourceName: "crowded")
        case 3:
            return #imageLiteral(resourceName: "veryCrowded")
        default:
            return #imageLiteral(resourceName: "notCrowded")
        }
    }

    class func dateformatter(date: Date) -> String {

        let date1: Date = Date()
        let date2: Date = date

        let calender: Calendar = Calendar.current
        let components: DateComponents = calender.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date2, to: date1)

        var returnString: String = ""

        if components.year! >= 1 {
            returnString = String(describing: components.year!) + " year ago"
        } else if components.month! >= 1{
            returnString = String(describing: components.month!) + " month ago"
        } else if components.day! >= 1{
            returnString = String(describing: components.day!) + " days ago"
        } else if components.hour! >= 1{
            returnString = String(describing: components.hour!) + " hour ago"
        } else if components.minute! >= 1{
            returnString = String(describing: components.minute!) + " min ago"
        } else {
            returnString = "Just Now"
        }

        return returnString
    }

}

extension UIImageView {

    func loadImageFromUrl(url: String){

        // Create Url from string
        let url = NSURL(string: url)!

        // Download task:
        // - sharedSession = global NSURLCache, NSHTTPCookieStorage and NSURLCredentialStorage objects.
        let task = URLSession.shared.dataTask(with: url as URL) { (responseData, responseUrl, error) -> Void in
            // if responseData is not null...
            if let data = responseData{

                // execute in UI thread
                DispatchQueue.main.async(execute: { () -> Void in
                    self.image = UIImage(data: data)
                })
            }
        }

        // Run task
        task.resume()
    }
    
}

