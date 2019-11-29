//
//  RandomDetailViewController.swift
//  ParsingJSONLab
//
//  Created by Tiffany Obi on 11/29/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import UIKit

class RandomDetailViewController: UIViewController {

    
    @IBOutlet var userDetailView: UIView!
    
    @IBOutlet weak var fullAddressLabel: UILabel!
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    func updateUI(){
        fullAddressLabel.text = "Street Adress: \(user.location.street.number) \(user.location.street.name) \n City: \(user.location.city) \n State: \(user.location.state) \n Country: \(user.location.country)"
        
        phoneNumberLabel.text = "Phone Number:\(user.phone)"
        dateOfBirthLabel.text = "Birthday: \(user.dob.date)"
    }
    
}
