//
//  MapAccessoryView.swift
//  Clemson Crowds
//
//  Created by Shannon Beck on 3/30/17.
//  Copyright © 2017 Shannon Beck. All rights reserved.
//

import UIKit
import MapKit

class MapAccessoryView: MKAnnotationView {

    @IBOutlet var placeView: UIView!
    @IBOutlet var crowdView: UIView!
    @IBOutlet var moreInfoButton: UIButton!
    @IBOutlet var placeNameLabel: UILabel!
    @IBOutlet var crowdLabel: UILabel!
    @IBOutlet var placeIconImage: UIImageView!
    @IBOutlet var crowdIconImage: UIImageView!

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        // Check if it hit our annotation detail view components.

        // details button
        if let result = moreInfoButton.hitTest(convert(point, to: moreInfoButton), with: event) {
            print("HI")
            return result
        }

        print("YO")
        // fallback to our background content view
        return crowdIconImage.hitTest(convert(point, to: crowdIconImage), with: event)
    }


}
