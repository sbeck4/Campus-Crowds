//
//  Place.swift
//  Clemson Crowds
//
//  Created by Shannon Beck on 1/29/17.
//  Copyright © 2017 Shannon Beck. All rights reserved.
//

import UIKit

// Each location has:
/*  Name
 *  Latitude
 *  Longitude
 *  Current crowd level
 *  last updated time
 *  last 3 updates: (time, crowd level)
 */
import FirebaseDatabase

class Place: NSObject {

    var name: String!
    var latitude: Double!
    var longitude: Double!
    var currentCrowdLevel: Int!
    var lastUpdatedTime: Date!
    var imageName: String!

    override init() {
        super.init()
    }

    init(name: String, latitude: Double, longitude: Double, currentCrowdLevel: Int, lastUpdatedTime: Date, imageName: String) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.currentCrowdLevel = currentCrowdLevel
        self.lastUpdatedTime = lastUpdatedTime
        self.imageName = imageName
    }

    class func snapshotToPlace(snap: FIRDataSnapshot) -> Place {
        let place = Place()

        place.name = snap.childSnapshot(forPath: "name").value as? String ?? "Empty"
        place.latitude = Double(snap.childSnapshot(forPath: "latitude").value as! String)
        place.longitude = Double(snap.childSnapshot(forPath: "longitude").value as! String)
        place.currentCrowdLevel = Int(snap.childSnapshot(forPath: "currentCrowdLevel").value as! String)

        let strDate = snap.childSnapshot(forPath: "lastUpdatedTime").value as! String

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        let date = dateFormatter.date(from: strDate)
        place.lastUpdatedTime = date

        place.imageName = snap.childSnapshot(forPath: "imageName").value as! String

        return place
    }

    func dictionaryOf() -> [String: String] {
        return ["name": name!, "latitude": String(describing: latitude!), "longitude": String(describing: longitude!), "currentCrowdLevel": String(describing: currentCrowdLevel!), "lastUpdatedTime": String(describing: lastUpdatedTime!), "imageName": imageName!]
    }

    func placeImage() -> UIImage {
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


//        if components.second! < 60 {
//            returnString = "Just Now"
//        } else if components.minute! >= 1{
//            returnString = String(describing: components.minute) + " min ago"
//        } else if components.hour! >= 1{
//            returnString = String(describing: components.hour) + " hour ago"
//        } else if components.day! >= 1{
//            returnString = String(describing: components.day) + " days ago"
//        } else if components.month! >= 1{
//            returnString = String(describing: components.month) + " month ago"
//        } else if components.year! >= 1 {
//            returnString = String(describing: components.year) + " year ago"
//        }

        return returnString
    }

}
