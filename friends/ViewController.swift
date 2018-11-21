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
    @IBOutlet var emptyStateView: UIView!

    var friendService = FriendsService()

    override func viewDidLoad() {
        tableView.backgroundView = emptyStateView
    }
    
    @IBAction func runTapped(_ sender: Any) {
        tableView.backgroundView = nil
        do {
            _ = try friendService.assignRecipentsToFriends()
            tableViewDataSource.friends = friendService.friends
            tableView.reloadSections([0], with: .automatic)
        } catch {
            runTapped(self)
        }
    }

    @IBAction func undoTapped(_ sender: Any) {
        tableView.backgroundView = emptyStateView
        tableViewDataSource.friends = []
        tableView.reloadData()
    }
}

