//
//  MainTableViewController.swift
//  Machine_Test
//
//  Created by Amitabh Pandey on 21/05/20.
//  Copyright © 2020 AmitabhPandey. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Main"
        registerCell()
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    private func registerCell() {
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: String(describing: MainTableViewCell.self))
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MainTableViewCell.self), for: indexPath) as? MainTableViewCell

        // Configure the cell...
        cell?.profileImageView.image = #imageLiteral(resourceName: "86.jpg")
        cell?.nameLabel.text = "Hello This is my view"
        cell?.descriptionLabel.text = "Hello my name is amitabh pandey how are you what's up dude. I am ios developer I am responsible for developing iOS app for my company."

        return cell!
    }
    
}

extension MainTableViewController {
    fileprivate func fetchFeed() {
        Service.shared.getFeed(urlString: BASE_URL) { [weak self] (result, error) in
            
            guard let `self` = self else {return}
        }
    }
}
