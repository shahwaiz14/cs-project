//
//  PeopleTableViewController.swift
//  TestCoreData3
//
//  Created by Robert Seitsinger on 2/25/17.
//  Copyright © 2017 cs378. All rights reserved.
//

import UIKit
import CoreData

class PeopleTableViewController: UITableViewController {

    var nameTextField: UITextField? = nil
    var ageTextField: UITextField? = nil

    var people = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the nav bar title
        self.title = "Core Data Demo"
        
        // Load the people array - to get data previously stored.
        loadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func btnAddAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "New Person",
                                      message: "Add a new Person",
                                      preferredStyle: .alert)
        
        // Core Data version of the saveAction
        let saveAction = UIAlertAction(title: "Save",
                                       style: .default) { (action: UIAlertAction!) -> Void in
                let nameTextField = alert.textFields![0]
                let ageTextField = alert.textFields![1]
                self.savePerson(name: nameTextField.text!, age: ageTextField.text!)
                self.tableView.reloadData()  // causes the table data source methods to execute
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .default) { (action: UIAlertAction!) -> Void in
        }
        
        alert.addTextField { (textField) -> Void in
            self.nameTextField = textField
            self.nameTextField?.placeholder = "Name"
        }
        alert.addTextField { (textField) -> Void in
            self.ageTextField = textField
            self.ageTextField?.placeholder = "Age"
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert,
                animated: true,
                completion: nil)

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath)

        // Get person object to display in table cell.
        let person = people[indexPath.row]
        
        // Configure the cell...
        cell.textLabel?.text = person.value(forKey: "name") as? String
        
        // Need to convert Int to String to be able to set to 'text' property.
        cell.detailTextLabel?.text = String((person.value(forKey: "age") as? Int)!)

        return cell
    }
    
    fileprivate func savePerson(name: String, age: String) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // Create the entity we want to save
        let entity =  NSEntityDescription.entity(forEntityName: "Person", in: managedContext)
        
        let person = NSManagedObject(entity: entity!, insertInto: managedContext)
        
        // Set the attribute values
        person.setValue(name, forKey: "name")
        person.setValue(Int(age), forKey: "age")
        
        // Commit the changes.
        do {
            try managedContext.save()
        } catch {
            // what to do if an error occurs?
            let nserror = error as NSError
            print("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
        // Add the new entity to our array of managed objects
        people.append(person)
    }
    
    fileprivate func loadData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"Person")
        
        var fetchedResults:[NSManagedObject]? = nil
        
        do {
            try fetchedResults = managedContext.fetch(fetchRequest) as? [NSManagedObject]
        } catch {
            // what to do if an error occurs?
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
        if let results = fetchedResults {
            people = results
        } else {
            print("Could not fetch")
        }
    }

}
