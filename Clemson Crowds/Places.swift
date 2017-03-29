//
//  Places.swift
//  Clemson Crowds
//
//  Created by Shannon Beck on 1/29/17.
//  Copyright © 2017 Shannon Beck. All rights reserved.
//

import Foundation

class Places {

    class func initalizePlaces() -> [Place] {

        var places: [Place] = []

        let library = Place(name: "Clemson Cooper Library", latitude: 34.676673, longitude: -82.836364, currentCrowdLevel: 0, imageName: "books", maxCrowdNumber: 2000, currentCrowdNumber: 0, floors: [], placeImage: "http://theblacksheeponline.com/wp-content/uploads/2016/03/5D3_95441.jpg")

        library.floors.append(Place(name: "Clemson Cooper Library - Floor 1", latitude: 34.676673, longitude: -82.836364, currentCrowdLevel: 0, imageName: "books", maxCrowdNumber: 250, currentCrowdNumber: 0, floors: [], placeImage: ""))

        library.floors.append(Place(name: "Clemson Cooper Library - Floor 2", latitude: 34.676673, longitude: -82.836364, currentCrowdLevel: 0, imageName: "books", maxCrowdNumber: 250, currentCrowdNumber: 0, floors: [], placeImage: ""))

        library.floors.append(Place(name: "Clemson Cooper Library - Floor 3", latitude: 34.676673, longitude: -82.836364, currentCrowdLevel: 0, imageName: "books", maxCrowdNumber: 500, currentCrowdNumber: 0, floors: [], placeImage: ""))

        library.floors.append(Place(name: "Clemson Cooper Library - Floor 4", latitude: 34.676673, longitude: -82.836364, currentCrowdLevel: 0, imageName: "books", maxCrowdNumber: 500, currentCrowdNumber: 0, floors: [], placeImage: ""))

        library.floors.append(Place(name: "Clemson Cooper Library - Floor 5", latitude: 34.676673, longitude: -82.836364, currentCrowdLevel: 0, imageName: "books", maxCrowdNumber: 500, currentCrowdNumber: 0, floors: [], placeImage: ""))

        library.floors.append(Place(name: "Starbucks (Cooper Library)", latitude: 34.676673, longitude: -82.836364, currentCrowdLevel: 0, imageName: "books", maxCrowdNumber: 100, currentCrowdNumber: 0, floors: [], placeImage: ""))

        places.append(library)

        places.append(Place(name: "Starbucks (Cooper Library)", latitude: 34.676673, longitude: -82.836364, currentCrowdLevel: 0, imageName: "coffee", maxCrowdNumber: 100, currentCrowdNumber: 0, floors: [], placeImage: "https://clemson.campusdish.com/-/media/Images/Aramark/Higher-Education/SouthEast/Clemson/StarbucksCooper_377x350.jpg?h=350&la=en&w=377&hash=356AD0651E2379AAE8DD56860DE60FE4C5AC60FA"))

        places.append(Place(name: "Starbucks (Core)", latitude: 34.679546, longitude:  -82.839420, currentCrowdLevel: 0, imageName: "coffee", maxCrowdNumber: 100, currentCrowdNumber: 0, floors: [], placeImage: "http://www.starbucksmelody.com/wp-content/uploads/2014/07/IMAG0757-Huntington-Beach-Clover-Evenings-Starbucks-inside-facing-Clover-May-2014.jpg"))

        places.append(Place(name: "Hendrix Food Court", latitude: 34.676180, longitude: -82.832150, currentCrowdLevel: 0, imageName: "food", maxCrowdNumber: 150, currentCrowdNumber: 0, floors: [], placeImage: "http://www.dp3architects.com/wp-content/uploads/2014/05/hendrix-center-food-court2-1898x1266.jpg"))

        places.append(Place(name: "Schilletter Dining Hall", latitude: 34.676908, longitude: -82.832865, currentCrowdLevel: 0, imageName: "food", maxCrowdNumber: 300, currentCrowdNumber: 0, floors: [], placeImage: "http://www.dp3architects.com/wp-content/uploads/2014/05/schilletter-dining-hall3-1898x1266.jpg"))

        places.append(Place(name: "Wendy's", latitude: 34.677134, longitude: -82.832857, currentCrowdLevel: 0, imageName: "burger", maxCrowdNumber: 75, currentCrowdNumber: 0, floors: [], placeImage: "http://archives.thetigernews.com/photos/612.jpg"))

        places.append(Place(name: "Core Dining Hall", latitude: 34.679361, longitude: -82.839730, currentCrowdLevel: 0, imageName: "food", maxCrowdNumber: 200, currentCrowdNumber: 0, floors: [], placeImage: "http://www.clemson.edu/building-futures/images/core-campus-feature.jpg"))

        places.append(Place(name: "Einstein Bros Bagels", latitude: 34.676291, longitude: -82.831941, currentCrowdLevel: 0, imageName: "bagel", maxCrowdNumber: 150, currentCrowdNumber: 0, floors: [], placeImage: "http://cdn.hercampus.com/s3fs-public/styles/full_width_embed/public/2016/04/05/677211.jpg"))

        places.append(Place(name: "McAdams Hall Computer Lab", latitude: 34.675962, longitude: -82.834376, currentCrowdLevel: 0, imageName: "computer", maxCrowdNumber: 100, currentCrowdNumber: 0, floors: [], placeImage: "https://www.cs.clemson.edu/dpa/images/mcadams2015.jpg"))

        places.append(Place(name: "Academic Success Center", latitude: 34.675845, longitude: -82.835782, currentCrowdLevel: 0, imageName: "study", maxCrowdNumber: 300, currentCrowdNumber: 0, floors: [], placeImage: "https://s-media-cache-ak0.pinimg.com/originals/0e/b7/21/0eb721dd2eec2c0806c89124be333b77.jpg"))

        places.append(Place(name: "Union Food Court", latitude: 34.679773, longitude: -82.838469, currentCrowdLevel: 0, imageName: "food", maxCrowdNumber: 150, currentCrowdNumber: 0, floors: [], placeImage: "https://c1.staticflickr.com/3/2479/12970294745_c3176f1415_b.jpg"))

        let wfic = Place(name: "Watt Family Innovation Center", latitude: 34.676134, longitude: -82.836939, currentCrowdLevel: 0, imageName: "study", maxCrowdNumber: 500, currentCrowdNumber: 0, floors: [], placeImage: "http://newsstand.clemson.edu/wp-content/uploads/2016/01/Watt-Center-at-dusk-500x330.jpg")

        wfic.floors.append(Place(name: "WFIC - Floor 1", latitude: 34.676134, longitude: -82.836939, currentCrowdLevel: 0, imageName: "study", maxCrowdNumber: 0, currentCrowdNumber: 250, floors: [], placeImage: "http://newsstand.clemson.edu/wp-content/uploads/2016/01/Watt-Center-at-dusk-500x330.jpg"))

        wfic.floors.append(Place(name: "WFIC - Floor 2", latitude: 34.676134, longitude: -82.836939, currentCrowdLevel: 0, imageName: "study", maxCrowdNumber: 0, currentCrowdNumber: 125, floors: [], placeImage: ""))

        wfic.floors.append(Place(name: "WFIC - Floor 3", latitude: 34.676134, longitude: -82.836939, currentCrowdLevel: 0, imageName: "study", maxCrowdNumber: 0, currentCrowdNumber: 125, floors: [], placeImage: ""))

        places.append(wfic)

        places.append(Place(name: "Fike Recreation Center", latitude: 34.680638, longitude: -82.841980, currentCrowdLevel: 0, imageName: "fitness", maxCrowdNumber: 2000, currentCrowdNumber: 0, floors: [], placeImage: "http://theblacksheeponline.com/wp-content/uploads/2015/11/fike.jpg"))


        return places
    }
}

/*
 
 Bus Stop at Sikes (away from Downtown)
 Latitiude: 34.679501
 Longitude: -82.834776
 

 Bus Stop at Sikes (towards Downtown)
 Latitiude: 34.679688
 Longitude: -82.834676
 

 Bus Stop at Cherry Road (towards Downtown)
 Latitiude: 34.677594
 Longitude: -82.830099
 
 
 Bus Stop at Cherry Road (away from Downtown)
 Latitiude: 34.677824
 Longitude: -82.830347

 
 McAdams Hall Computer Lab
 Latitiude: 34.675962
 Longitude: -82.834376
 

 Academic Success Center Study Areas
 Latitiude: 34.675845
 Longitude: -82.835782
 
 
 Union Food Court
 Latitiude: 34.679773
 Longitude: -82.838469
 
 
 Fike Recreation Center
 Latitiude: 34.680638
 Longitude: -82.841980
 
 Clemson Cooper Library
 Latitude: 34.676673
 Longitude: -82.836364


 Starbucks (Cooper Library)
 Latitiude: 34.676673
 Longitude: -82.836364


 Starbucks (Core)
 Latitiude: 34.679546
 Longitude: -82.839420


 Hendrix Food Court
 Latitiude: 34.676180
 Longitude: -82.832150


 Schilletter Dining Hall
 Latitiude: 34.676908
 Longitude: -82.832865


 Wendy's
 Latitude: 34.677134
 Longitude: -82.832857


 Core Dining Hall
 Latitiude: 34.679361
 Longitude: -82.839730


 Einstein Bros Bagels
 Latitiude: 34.676291
 Longitude: -82.831941


 */
 
 
 
 
 
 
 
 
 
 
 
