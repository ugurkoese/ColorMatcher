//
//  MatchViewController.swift
//  ColorMatcher
//
//  Created by  on 24.10.19.
//  Copyright © 2019 Ugur. All rights reserved.
//

import UIKit

class MatchViewController: UIViewController {

    var text: String?
    @IBOutlet weak var timer: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        timer.text = text!
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
