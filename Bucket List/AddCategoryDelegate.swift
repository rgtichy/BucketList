//
//  AddCategoryDelegate.swift
//  Bucket List
//
//  Created by Robert G Tichy on 4/17/17.
//  Copyright © 2017 Robert G Tichy. All rights reserved.
//

import UIKit

protocol AddCategoryDelegate: class {
    func cancelButtonPressed(controller: AddCategoryTableViewController)
    func saveButtonPressed(controller: AddCategoryTableViewController, category: String?, atRow: NSIndexPath?)
}
