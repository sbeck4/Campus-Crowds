//
//  ViewController.swift
//  Clemson Crowds
//
//  Created by Shannon Beck on 1/24/17.
//  Copyright © 2017 Shannon Beck. All rights reserved.
//

// Hello team!

import UIKit
import FirebaseDatabase


class ViewController: UIViewController {

    var ref: FIRDatabaseReference!


    override func viewDidLoad() {
        super.viewDidLoad()

//        ref = FIRDatabase.database().reference()
//        self.ref.child("Shannon").setValue(["isCool": "Yes"])

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

