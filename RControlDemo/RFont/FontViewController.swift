//
//  FontViewController.swift
//  RControlDemo
//
//  Created by WhatsXie on 2017/12/13.
//  Copyright © 2017年 R.S. All rights reserved.
//

import UIKit

class FontViewController: UIViewController {
    @IBOutlet weak var AppleFontLabel: UILabel!
    @IBOutlet weak var RFontLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        AppleFontLabel.text = "ABCDEF\nGHIGKL"
        AppleFontLabel.font = UIFont(name: "oreosoutline", size: 50)
        
        RFontLabel.text = "ABCDEF\nGHIGKL"
        RFontLabel.font = R.font.oreosoutline(size: 50)
        
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
