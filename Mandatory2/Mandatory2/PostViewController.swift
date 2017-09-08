//
//  PostViewController.swift
//  Mandatory2
//
//  Created by eak on 08/09/2017.
//  Copyright © 2017 Casian. All rights reserved.
//

import UIKit
import Firebase

class PostViewController: UIViewController {

    @IBOutlet weak var titleLbl: UITextField!
    @IBOutlet weak var descLbl: UITextField!
    
    @IBAction func Post(_ sender: UIButton) {
        let title = titleLbl.text
        let desc = descLbl.text
        let userid = Auth.auth().currentUser?.uid
        var ref: DatabaseReference
        //print(title,desc,userid)
        
        ref = Database.database().reference()
        let post =  [
            "userid": userid!,
            "title": title,
            "description":desc
        ]
        let childUpdate = ["/notes/\(title!)":post]
        ref.updateChildValues(childUpdate)
        
        let alert = UIAlertController(title: "Post", message: "The post had been stored, proceede to post's view", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
            //NSLog("The \"OK\" alert occured.")
            self.performSegue(withIdentifier: "viewPosts", sender: self)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
