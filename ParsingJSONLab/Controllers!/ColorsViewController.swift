//
//  ColorsViewController.swift
//  ParsingJSONLab
//
//  Created by Tiffany Obi on 11/26/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import UIKit

class ColorsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var displayLabel: UILabel!
    
    var displayColors = [Colors]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    func loadData() {
        displayColors = GroupOfColors.getColors()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorInfo = segue.destination as? ColorsDetailViewController,
            let indexpath = tableView.indexPathForSelectedRow
            else {
            fatalError("could not locate detail view controller")
        }
        colorInfo.colorsInfo = displayColors[indexpath.row]
    }
    
}

extension ColorsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        displayColors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let colorCell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)

        let color = displayColors[indexPath.row]
        
        colorCell.textLabel?.text = color.name.value
        colorCell.backgroundColor = UIColor(displayP3Red: CGFloat(color.rgb.r)/255, green: CGFloat(color.rgb.g)/255, blue: CGFloat(color.rgb.b)/255, alpha: 1)
        
        return colorCell
    }
    
    
}
