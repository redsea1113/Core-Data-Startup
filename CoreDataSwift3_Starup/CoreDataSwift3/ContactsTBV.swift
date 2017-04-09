//
//  ContactsTBV.swift
//  CoreDataSwift3
//
//  Created by Ali Farhat on 4/9/17.
//  Copyright © 2017 HCT. All rights reserved.
//

import UIKit

class ContactsTBV: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        
        cell.textLabel?.text = "HI"
        cell.detailTextLabel?.text = "55555"
        cell.imageView?.image = UIImage(named: "swift.png")
        

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    /*********************************************************************
     *
     * This function Display Action Controller to get a contact name
     *
     *********************************************************************/
    
    @IBAction func searchRecords(_ sender: AnyObject) {
        
        
        // create the alert controller
        
        let v = UIAlertController(title: "Search", message: "Enter  part of a contact name", preferredStyle: UIAlertControllerStyle.alert)
        
        
        // Add the text field
        
        v.addTextField { (storeName:UITextField!) -> Void in
            
            storeName.placeholder = "Contact Name"
            
        }
        
        
        // Create the button - Alert Action
        
        let okAc = UIAlertAction(title: "Search", style: UIAlertActionStyle.default)
        { (alert: UIAlertAction) in
            
            let contactName = v.textFields![0]
            
           // self.filterContacts(contactName.text!)
            
            v.dismiss(animated: true, completion: nil)
        }
        
        
        // Add it to the controller
        
        v.addAction(okAc)
        
        
        // only one cancel action style allowed
        
        let cancelAc = UIAlertAction(title: "cancel", style: UIAlertActionStyle.cancel) { (alert: UIAlertAction) in
            
            v.dismiss(animated: true, completion: nil)
            
        }
        
        v.addAction(cancelAc)
        
        present(v, animated: true , completion: nil)
        
    }

    
}
