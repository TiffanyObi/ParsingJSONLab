//
//  WeatherDetailViewController.swift
//  ParsingJSONLab
//
//  Created by Tiffany Obi on 11/27/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController {

    @IBOutlet weak var weatherLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    var chosenCity: List?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        weatherLabel.text = "This cities weather is \(chosenCity?.weather.first?.description ?? "")"

        temperatureLabel.text = "This cities temperature is \(chosenCity?.main.temp ?? 0.0) C"    }
}
