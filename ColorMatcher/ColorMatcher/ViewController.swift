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
    
    let randomR: CGFloat = CGFloat.random(in: 0...1)
    let randomG: CGFloat = CGFloat.random(in: 0...1)
    let randomB: CGFloat = CGFloat.random(in: 0...1)
    let start = Date()
    
    var highScoreArray: [Double]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("Did load")
        print(highScoreArray!)
        
        topView.backgroundColor = UIColor(red: randomR, green: randomG, blue: randomB, alpha:  1.0)
        print("after: \(topView.backgroundColor!)")
        
    }
    
    @IBAction func changeColor(_ sender: UISlider) {
        switch sender.tag {
        case 1:
             r = CGFloat(sender.value)
            rValueLabel.text = "\(r)"
        case 2:
             g = CGFloat(sender.value)
            gValueLabel.text = "\(g)"
        case 3:
             b = CGFloat(sender.value)
            bValueLabel.text = "\(b)"
        default:
            print("something went wrong")
        }

        bottomView.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
    
    @IBAction func matchColors(_ sender: UIButton) {
        print("r: \(r)\ng: \(g)\nb: \(b)")
        print("randomR: \(randomR)\nrandomG: \(randomG)\nrandomB: \(randomB)")
        bottomView.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1.0)
        
        if (abs(r-randomR) <= 0.02 && abs(g-randomG) <= 0.02 && abs(b - randomB) <= 0.02) {
            self.performSegue(withIdentifier: "congratsView", sender: self)
        } else {
            print("Colors don't match!")
        }
    }
    
    func showElapsedTime() -> Double {
        return Date().timeIntervalSince(start).rounded()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "congratsView" {
            let viewControllerB = segue.destination as! MatchViewController
            let time = showElapsedTime()
            addTimeToTable(time: time)
            viewControllerB.time = time
            viewControllerB.highScoreArray = highScoreArray!
        }
    }

    func addTimeToTable(time: Double) {
        highScoreArray!.append(time)
        highScoreArray!.sort()
        while highScoreArray!.count > 10 {
            highScoreArray!.removeLast()
        }
    }
}

