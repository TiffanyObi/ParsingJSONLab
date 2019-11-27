//
//  ViewController.swift
//  ParsingJSONLab
//
//  Created by Tiffany Obi on 11/26/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var cityData = [List]() {
        didSet {
            tableView.reloadData()
        }
    }
        
    func loadData() {
        cityData = ListOfCities.getCities()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.dataSource = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let weatherCell = segue.destination as? WeatherDetailViewController,
            let indexPath = tableView.indexPathForSelectedRow
            else {
    fatalError("could not locate detail view controller")
                
        }
        weatherCell.chosenCity = cityData[indexPath.row]
    }
}

extension WeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cityData.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let weatherCell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
       
        let city = cityData[indexPath.row]
        
        weatherCell.textLabel?.text = city.name
       
        return weatherCell
    }
    
    
}
