//
//  RImageViewController.swift
//  RControlDemo
//
//  Created by WhatsXie on 2017/12/7.
//  Copyright © 2017年 R.S. All rights reserved.
//

import UIKit

class RImageViewController: UIViewController {
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var lineImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leftImageView.image = R.image.icon_star()
        rightImageView.image = UIImage(named: "icon_star")
        
        // 读取文件夹目录下的图片资源
        lineImageView.image = R.image.bg.line_bg()
        
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
