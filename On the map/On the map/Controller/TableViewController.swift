//
//  TableViewController.swift
//  On the map
//
//  Created by Bharani Nammi on 7/1/20.
//  Copyright © 2020 Bharani Nammi. All rights reserved.
//

import Foundation
import UIKit

class TableViewController: UITableViewController {
    
    
    override func viewWillAppear(_ animated: Bool) {
           
           super.viewWillAppear(animated)

           //tableView.reloadData()
       }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print("printing the count --------->")
        //print(StudentLocationModel.result.count)
        return StudentLocationModel.result.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        
        let result = StudentLocationModel.result[indexPath.row]
        
        if(result.firstName != "" && result.lastName != ""){
            
            cell.textLabel?.text = result.firstName + " " + result.lastName
            
        }
        
        return cell
    }
    

    
    
}
