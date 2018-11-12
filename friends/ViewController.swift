//
//  ViewController.swift
//  friends
//
//  Created by Derik Flanary on 12/5/16.
//  Copyright © 2016 Derik Flanary. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var tableViewDataSource: TableViewDataSource!
    
    var friendService = FriendsService()

    override func viewDidLoad() {
        tableViewDataSource.friends = friendService.friends
        tableView.reloadData()
    }
    
    @IBAction func runTapped(_ sender: Any) {
        do {
            _ = try friendService.assignRecipentsToFriends()
            tableViewDataSource.friends = friendService.friends
            tableView.reloadData()
        } catch {
            runTapped(self)
        }
    }

    @IBAction func undoTapped(_ sender: Any) {
        tableViewDataSource.friends = []
        tableView.reloadData()
    }
}

