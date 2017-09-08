//
//  StartViewController.swift
//  Mandatory2
//
//  Created by eak on 08/09/2017.
//  Copyright © 2017 Casian. All rights reserved.
//

import UIKit
import Firebase

class StartViewController: UIViewController {

    @IBOutlet weak var userLbl: UILabel!
    var user:String = "casian@boss.com"
    var pass:String = "Testing22"
    override func viewDidLoad() {
        super.viewDidLoad()

        Auth.auth().createUser(withEmail: user, password: pass) { (user, error) in
            if (error == nil){
                print("Succesful Created")
            }else{
                print("Not Created")
                print(error!)
            }
        }
        
        
        Auth.auth().signIn(withEmail: user, password: pass ) { (user, error) in
            if (error == nil){
                print("Succesful Authenticate")
                print(user!.uid)
            }else{
                print("Not Authenticated")
                print(error!)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // USER : casian@yahoo.com   PASS:  test22
}
