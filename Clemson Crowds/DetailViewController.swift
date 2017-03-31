//
//  DetailViewController.swift
//  Clemson Crowds
//
//  Created by Shannon Beck on 3/29/17.
//  Copyright © 2017 Shannon Beck. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var placeImage: UIImageView!
    var place: Place = Place()
    @IBOutlet var hoursLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.title = place.name
        placeImage.loadImageFromUrl(url: place.placeImage)
        hoursLabel.text = place.hours
        addressLabel.text = place.address
        self.title = place.name
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailListCell") as! ListTableViewCell

        let place = self.place.floors[indexPath.row]
        cell.iconView.layer.cornerRadius = cell.iconView.frame.width/2
        cell.iconImageView.image = place.placeImageIcon()
        cell.crowdLevelView.layer.cornerRadius = cell.crowdLevelView.frame.width/2
        cell.crowdLevelImageView.image = place.crowdImage()
        cell.placeNameLabel.text = place.name

        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return place.floors.count
    }

}
