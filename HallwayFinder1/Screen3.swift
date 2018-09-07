//
//  Screen3.swift
//  HallwayFinder1
//
//  Created by Benjamin Weissman on 9/3/18.
//  Copyright © 2018 Benjamin Weissman. All rights reserved.
//

import UIKit

class Screen3: UIViewController {

    @IBOutlet weak var title3Label: UILabel!
    @IBOutlet weak var directions: UITextView!
    var idk = "There is an error with your directions. Please try again. \nPossible Errors:\n -App currently only works for rooms with numbers and the cafeteria (not auditorium, gym, research, etc.) \n -Mistyped Room Numbers \n -Typed in a room that doesn't exist\n-Cannot type lobby as a destination"
    var labelText = "Error"
    override func viewDidLoad() {
        super.viewDidLoad()
        directions.text = idk
        title3Label.text = labelText
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func reportIssueClicked(_ sender: UIButton) {
        UIApplication.shared.open(URL(string:"https://goo.gl/forms/D1TuzjClr75tDx313")!, options: [:], completionHandler: nil)
        }
    
    @IBAction func rateClicked(_ sender: UIButton) {
        UIApplication.shared.open(URL(string:"https://goo.gl/forms/98fxqZCI2796NXj52")!, options: [:], completionHandler: nil)
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
