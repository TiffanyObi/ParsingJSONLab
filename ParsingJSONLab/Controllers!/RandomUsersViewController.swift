//
//  RandomUsersViewController.swift
//  ParsingJSONLab
//
//  Created by Tiffany Obi on 11/29/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import UIKit

class RandomUsersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var displayUsers = [User]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        loadData()
        super.viewDidLoad()
        tableView.dataSource = self
       

   
    }
    
    func loadData() {
        displayUsers = Results.getUsers()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let userDetails = segue.destination as? RandomDetailViewController,
            let indexPath = tableView.indexPathForSelectedRow else {
                fatalError("could not locate detail view controller")
        }
        
        userDetails.user = displayUsers[indexPath.row]
        
    }
}

extension RandomUsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        displayUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let userCell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        
        let user = displayUsers[indexPath.row]
        
        userCell.textLabel?.text = "\(String(describing: user.name.first)) \(String(describing: user.name.last)) "
        userCell.detailTextLabel?.text = user.email
        
        return userCell
    }
    
    
}
