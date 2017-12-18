//
//  ViewController.swift
//  RControlDemo
//
//  Created by WhatsXie on 2017/12/7.
//  Copyright © 2017年 R.S. All rights reserved.
//

import UIKit
import Cupcake

class ViewController: CupcakeViewController {
    override func setupUI() {
        title = "R 管理"
        
        let titles = ["Images / 图片", "XIB / 可视化布局", "JSON / JS 对象标记", "Font / 字体", "更多（待更新）"]
        
        PlainTable(titles).embedIn(self.view).onClick ({ [unowned self] row in
            var target:UIViewController!
            switch row.indexPath.row {
            case 0: target = RImageViewController()
            case 1: target = XIBViewController()
            case 2: target = JSONViewController()
            case 3: target = FontViewController()
            case 4: target = MoreViewController()
            default: break
            }
            target.title = row.cell.textLabel?.text
            self.push(target)
        })
    }
}
// Cupcake基类
class CupcakeViewController: UIViewController {
    func push(_ vc: UIViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setupUI() {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

