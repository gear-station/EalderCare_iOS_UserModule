//
//  ECUserViewController.swift
//  ElderCare_UserModule
//
//  Created by 贾富佳 on 2019/5/30.
//

import UIKit
import SegMenu

class ECUserViewController: UIViewController {

    var menu: SegMenu!
    var titleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }
    
    private func setUI() {
        view.backgroundColor = UIColor.cyan
    }
    
    private func setupSubControllers() {
        
    }
    
}
