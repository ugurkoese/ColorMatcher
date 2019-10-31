//
//  ViewController.swift
//  ColorMatcher
//
//  Created by  on 24.10.19.
//  Copyright © 2019 Ugur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var rValueLabel: UILabel!
    @IBOutlet weak var gValueLabel: UILabel!
    @IBOutlet weak var bValueLabel: UILabel!
    
    var r: CGFloat = 0.0
    var g: CGFloat = 0.0
    var b: CGFloat = 0.0
    
    var randomR: CGFloat = CGFloat.random(in: 0...1)
    var randomG: CGFloat = CGFloat.random(in: 0...1)
    var randomB: CGFloat = CGFloat.random(in: 0...1)

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("Did load")
        
        rValueLabel.text = "\(r)"
        gValueLabel.text = "\(g)"
        bValueLabel.text = "\(b)"
        
        topView.backgroundColor = UIColor(red: randomR, green: randomG, blue: randomB, alpha:  1.0)
        print("after: \(topView.backgroundColor)")
    }
    
    
    @IBAction func changeRedValue(_ sender: UISlider) {
        r = CGFloat(sender.value)
        rValueLabel.text = "\(r)"
    }
    
    
    @IBAction func changeGreenValue(_ sender: UISlider) {
        g = CGFloat(sender.value)
        gValueLabel.text = "\(g)"
    }
    
    
    @IBAction func changeBlueValue(_ sender: UISlider) {
        b = CGFloat(sender.value)
        bValueLabel.text = "\(b)"
    }
    
    
    @IBAction func matchColors(_ sender: UIButton) {
        let roundR = Double(round(1000*r)/1000)
        let roundG = Double(round(1000*g)/1000)
        let roundB = Double(round(1000*b)/1000)

        let roundRandomR = Double(round(1000*randomR)/1000)
        let roundRandomG = Double(round(1000*randomG)/1000)
        let roundRandomB = Double(round(1000*randomB)/1000)

        print("roundR: \(roundR)\nroundG: \(roundG)\nroundB: \(roundB)")
        print("roundandomR: \(roundRandomR)\nroundRandomG: \(roundRandomG)\nroundRandomB: \(roundRandomB)")
        bottomView.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1.0)
        
        if (roundR == roundRandomR && roundG == roundRandomG && roundB == roundRandomB) {
            print("Colors matched!")
        } else {
            print("Colors don't match!")
        }
    }
    


}

