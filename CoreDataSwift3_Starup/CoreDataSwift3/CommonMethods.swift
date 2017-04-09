//
//  Usercontact.swift
//  CoreDataSwift3
//
//  Created by Ali Farhat on 4/5/17.
//  Copyright © 2017 HCT. All rights reserved.
//

import UIKit
import CoreData

class CommonMethods: NSObject {
    
    
    // 1 - Define attributes 
    
    var  lastName   :   String!
    var  firstName  :   String!
    var  image      :   Data!
    var  email      :   String!
    var  phone      :   String!

    
    // 2 - Define Core Data elements
    
    var  contacts   :  [NSManagedObject] = []
    var  contact    :  NSManagedObject!
    
    
    // The Managed Object Context retrieved from the app delegate
    
    let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
  
    
    

    //  This Function searches for a particular name
    /***********************************************************************
     *
     * This function search core data
     *
     **********************************************************************/

    func find(name:String) -> NSManagedObject!
    {
        
        // Create the request and the query that will fetch the records 
        
        let search   = NSPredicate(format: "firstName == %@", name)
        let query    = NSFetchRequest<NSManagedObject>(entityName: "ContactEntity")
        
        query.predicate = search
        
        
        do {
            contacts  = try managedContext.fetch(query)
            if contacts.count > 0
            {
                return contacts[0]
            }
            
        } catch let error as NSError {
            
            print("Could not fetch. \(error), \(error.userInfo)")
            
        }
        
        return nil
        
        
        
    }
    
    /***********************************************************************
     *
     * This function search core data
     *
     **********************************************************************/

    func saveNew() -> Bool {
        
        let entity = NSEntityDescription.entity(forEntityName: "ContactEntity", in: managedContext)!
        
        contact = NSManagedObject(entity: entity, insertInto: managedContext)
     
        self.updateRecord()
        // Save Context
        do {
            try managedContext.save()
            return true
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
            return false
            
        }
    }
    /***********************************************************************
     *
     * This function search core data
     *
     **********************************************************************/
 
    func update() -> Bool {
        
        self.updateRecord()
       
        do {
            try managedContext.save()
            return true
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
            return false
            
        }
    }
    /***********************************************************************
     *
     * This function search core data
     *
     **********************************************************************/
    
    func updateInfo()
    {
        
     
        firstName   =   contact.value(forKeyPath: "firstName") as! String
        lastName    =   contact.value(forKeyPath: "lastName") as! String
        email       =   contact.value(forKeyPath: "email") as! String
        image       =   contact.value(forKeyPath: "image") as! Data
        phone       =   contact.value(forKeyPath: "phone") as! String
        let img     =   UIImage(data: image)
    
    }
    
    /***********************************************************************
     *
     * This function search core data
     *
     **********************************************************************/

    func updateRecord()
    {
        
        let img = UIImage(named: "logo.jpeg")
        image = UIImageJPEGRepresentation(img!, 1)
        contact.setValue(firstName, forKeyPath: "firstName")
        contact.setValue(lastName, forKeyPath: "lastName")
        contact.setValue(email, forKeyPath: "email")
        contact.setValue(image, forKeyPath: "image")
        contact.setValue(phone, forKeyPath: "phone")
        
    }
    
    /***********************************************************************
     *
     * This function search core data
     *
     **********************************************************************/

    func gettAllRecords() -> [NSManagedObject]
    {
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ContactEntity")
        
        do {
            contacts  = try managedContext.fetch(fetchRequest)
            
            
            for contact in contacts
            {
                // Do something with the data
            }
            
        } catch let error as NSError {
            
            print("Could not fetch. \(error), \(error.userInfo)")
            
        }
        
        return contacts
        
        
        
    }
    
    
    /***********************************************************************
     *
     * This function search core data
     *
     **********************************************************************/
    
    func filterContacts(_ searchText: String)
    {
        
        let request = NSFetchRequest<NSManagedObject>(entityName: "ContactEntity")
        
        let predicate = NSPredicate(format: "firstName  contains %@", searchText)
        
        request.predicate = predicate
        
        do {
            contacts  = try managedContext.fetch(request)
            
            for contact in contacts
            {
                // Do something with the data
            }
            
        } catch let error as NSError {
            
            print("Could not fetch. \(error), \(error.userInfo)")
            
        }
        
        
        
        
    }
    
    
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
            
            self.filterContacts(contactName.text!)
            
            v.dismiss(animated: true, completion: nil)
        }
        
        
        // Add it to the controller
        
        v.addAction(okAc)
        
        
        // only one cancel action style allowed
        
        let cancelAc = UIAlertAction(title: "cancel", style: UIAlertActionStyle.cancel) { (alert: UIAlertAction) in
            
            v.dismiss(animated: true, completion: nil)
            
        }
        
        v.addAction(cancelAc)
        
       // present(v, animated: true , completion: nil)
        
    }


  

}
