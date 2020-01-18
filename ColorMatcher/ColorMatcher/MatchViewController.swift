//
//  MatchViewController.swift
//  ColorMatcher
//
//  Created by  on 24.10.19.
//  Copyright © 2019 Ugur. All rights reserved.
//

import UIKit

class MatchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    var time: Double?
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var highscoreTable: UITableView!
    
    var highScoreArray: [Double]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(highScoreArray!)

        
        // Do any additional setup after loading the view.
        timer.text = "your time: \(time!) seconds"
        highscoreTable.delegate = self
        highscoreTable.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return highScoreArray != nil ? highScoreArray!.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let currentScore = highScoreArray![indexPath.row]
        cell.textLabel?.text = "\(currentScore)"
        cell.textLabel?.sizeToFit()
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "colorView" { // wrong identifier
             let viewControllerB = segue.destination as! ViewController
             viewControllerB.highScoreArray = highScoreArray!
         } else {
            print("wrong identifier")
        }
     }
}
