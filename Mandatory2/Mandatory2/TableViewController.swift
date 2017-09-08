//
//  TableViewController.swift
//  Mandatory2
//
//  Created by eak on 06/09/2017.
//  Copyright © 2017 Casian. All rights reserved.
//

import UIKit

var cats = ["Rhea","Pufi","Zoza"]
var catsColor = ["Tiger","White","Grayblue"]
var myIndex = 0

class TableViewController: UITableViewController {


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cats.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = cats[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }

}
