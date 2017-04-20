//
//  ViewController.swift
//  Bucket List
//
//  Created by Robert G Tichy on 4/15/17.
//  Copyright © 2017 Robert G Tichy. All rights reserved.
//

import UIKit

class BucketListViewController: UITableViewController, AddCategoryDelegate {
    
    var items = ["Sky diving", "Live in Hawaii"]
    
    @IBAction func AddButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "EditAddSegue", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Selected Row")
    }
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        
        performSegue(withIdentifier: "EditAddSegue", sender: indexPath)
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        items.remove(at: indexPath.row)
        tableView.reloadData()
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // dequeue the cell from our storyboard
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell")!
        // All UITableViewCell objects have a build in textLabel so set it to the model that is corresponding to the row in array
        cell.textLabel?.text = items[indexPath.row]
        // return cell so that Table View knows what to draw in each row
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let AddCategoryTableViewController = navigationController.topViewController as! AddCategoryTableViewController
        AddCategoryTableViewController.delegate = self
//        if segue.identifier == "AddSegue" {
            
//            let navigationController = segue.destination as! UINavigationController
//            let AddCategoryTableViewController = navigationController.topViewController as!       AddCategoryTableViewController
            
//            AddCategoryTableViewController.delegate = self
            
//        }
//        else if segue.identifier == "EditSegue" {
            if sender is NSIndexPath {
            
//            let navigationController = segue.destination as! UINavigationController
//            let AddCategoryTableViewController = navigationController.topViewController as! AddCategoryTableViewController
            let indexPath = sender as! NSIndexPath
            
//            AddCategoryTableViewController.delegate = self
            AddCategoryTableViewController.passedItem = items[indexPath.row]
            AddCategoryTableViewController.indexPath = indexPath
        
        }

    }
    func cancelButtonPressed(controller: AddCategoryTableViewController) {
        print("usurping the cancelButtonPressed from the lower view controller")
        dismiss(animated: true, completion: nil)
    }
    func saveButtonPressed(controller: AddCategoryTableViewController, category: String?, atRow: NSIndexPath?) {
        if let indexPath = atRow {
            print("update")
            items[indexPath.row] = category!
        }
        else {
            if category != "" {
                print("save")
                items.append(category!)
            }
        }
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
}

