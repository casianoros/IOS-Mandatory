//
//  TableViewController.swift
//  Mandatory2
//
//  Created by eak on 06/09/2017.
//  Copyright © 2017 Casian. All rights reserved.
//

import UIKit
import Firebase

var cats = ["Rhea","Pufi","Zoza"]
var catsColor = ["Tiger","White","Grayblue"]
var myIndex = 0
var letter:Bool = true
var ref: DatabaseReference!
var dataStorage = [Array<Any>]()
class TableViewController: UITableViewController {
    
    
    
    override func viewDidLoad() {
        
        tableView.register(UserCell.self, forCellReuseIdentifier: "cell")
        dataStorage.removeAll()
        ref = Database.database().reference()
        ref.child("notes").observe(.childAdded, with: { (data) in
            //print(data)
            print("  ")
            var tempArray = [String]()
            let value = data.value as? NSDictionary
            let title = value?["title"] as? String ?? ""
            let description = value?["description"] as? String ?? ""
            //print("one value showen")
            tempArray.append(title)
            tempArray.append(description)
            
            dataStorage.append(tempArray)
            
            //print(dataStorage[0][0])
            
            //this crash because of background thread.
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            //print(title)
            //print(description)
        })
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataStorage.count
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = dataStorage[indexPath.row][0] as! String
        cell.detailTextLabel?.text = dataStorage[indexPath.row][1] as! String
        //let title = dataStorage[indexPath.row]
        //print("hello")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }
}

class UserCell: UITableViewCell{
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
