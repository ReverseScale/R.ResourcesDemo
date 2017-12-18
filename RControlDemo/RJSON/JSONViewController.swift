//
//  JSONViewController.swift
//  RControlDemo
//
//  Created by WhatsXie on 2017/12/13.
//  Copyright © 2017年 R.S. All rights reserved.
//

import UIKit

class JSONViewController: UIViewController {
    @IBOutlet weak var appleJSONLabel: UILabel!
    @IBOutlet weak var rJSONLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let jsonURLApple = Bundle.main.url(forResource: "TestJSON", withExtension: "json")
        appleJSONLabel.text = String(describing: jsonURLApple)
        
        let jsonURLR = R.file.testJSONJson
        rJSONLabel.text = String(describing: jsonURLR)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
