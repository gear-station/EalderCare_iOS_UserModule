//
//  ECUserModuleViewController.swift
//  ElderCare_UserModule
//
//  Created by 贾富佳 on 2019/6/27.
//

import UIKit
import SegMenu
import JFJExtension

class ECUserModuleViewController: UIViewController {
    private var titles = ["All users"]
    private var subTitles = ["in totle"]
    
    private let userViewController = ECUserViewController()
    private let groupViewController = ECGroupViewController()
    private let roleViewController = ECRoleViewController()
    private let authorityViewController = ECAuthorityViewController()
    
    private var controllers: [UIViewController] {
        return [userViewController, groupViewController, roleViewController, authorityViewController]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        addChild(menu)
        view.addSubview(menu.view)
    }

    lazy var menu: SegMenu = {
        let menu = SegMenu(viewControllers: controllers, frame: CGRect(x: 0, y: UIScreen.naviBarHeight, width: UIScreen.screenWidth, height: UIScreen.screenHeight - UIScreen.naviBarHeight - UIScreen.tabBarHeight), configuration: menuConfigruation)
        
        return SegMenu(viewControllers: controllers, frame: <#T##CGRect#>, pageMenuOptions: <#T##[SegMenuOption]?#>)
    }()
    
    lazy var options: [SegMenuOption] = {
        return [.useMenuAsSegmentedControl(true)
                ]
    }()
}
