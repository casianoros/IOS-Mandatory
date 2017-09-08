//
//  ViewController.swift
//  Mandatory2
//
//  Created by eak on 06/09/2017.
//  Copyright © 2017 Casian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var PetName: UILabel!
    @IBOutlet weak var PetDescription: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        PetName?.text = cats[myIndex]
        PetDescription?.text = catsColor[myIndex]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

