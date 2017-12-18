//
//  XIBViewController.swift
//  RControlDemo
//
//  Created by WhatsXie on 2017/12/7.
//  Copyright © 2017年 R.S. All rights reserved.
//

import UIKit

class XIBViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        let customViewNib = R.nib.extView.firstView(owner: nil)
        customViewNib?.center = view.center
        view.addSubview(customViewNib!)
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
