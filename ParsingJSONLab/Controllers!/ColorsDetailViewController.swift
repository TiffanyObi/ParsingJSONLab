//
//  DetailViewController.swift
//  ParsingJSONLab
//
//  Created by Tiffany Obi on 11/27/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import UIKit

class ColorsDetailViewController: UIViewController {

    var colorsInfo: Colors!
    
    @IBOutlet var backGroundView: UIView!
    
    @IBOutlet weak var hexValueLabel: UILabel!
    
    @IBOutlet weak var rgbValuesLabel: UILabel!
    
    @IBOutlet weak var revealDataButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
updateUI()
    }
    
    func updateUI() {
      
        backGroundView.backgroundColor = UIColor(displayP3Red: CGFloat(colorsInfo.rgb.r)/255, green: CGFloat(colorsInfo.rgb.g)/255, blue: CGFloat(colorsInfo.rgb.b)/255, alpha: 1)
}
    
    @IBAction func revealButtonPressed(_ sender: UIButton) {
        hexValueLabel.text = "The Hex Value is :\( colorsInfo.hex.clean)"
        
        rgbValuesLabel.text = "The RGB Values are - red:\(CGFloat(colorsInfo.rgb.r)/255),  blue:\(CGFloat(colorsInfo.rgb.b)/255),  green: \(CGFloat(colorsInfo.rgb.g)/255) "
    }
}
