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
        for (idx, vc) in controllers.enumated {
            vc.title = titles[idx]
        }
        addChild(menu)
        view.addSubview(menu.view)
    }

    lazy var menu: SegMenu = {
        let menuFrame = CGRect(x: 0,
                           y: UIScreen.naviBarHeight,
                           width: UIScreen.screenWidth,
                           height: UIScreen.screenHeight - UIScreen.naviBarHeight - UIScreen.tabBarHeight)
        
        return SegMenu(viewControllers: controllers,
                       frame: menuFrame,
                       pageMenuOptions: options)
    }()
    
    lazy var options: [SegMenuOption] = {
        return [.scrollMenuBackgroundColor(UIColor.white),
                .viewBackgroundColor(.white),
                .bottomMenuHairlineColor(UIColor(red: 20.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 0.1)),
                .indicatorColor(UIColor(red: 18.0/255.0, green: 150.0/255.0, blue: 225.0/255.0, alpha: 1.0)),
                .menuHeight(50.0),
                .selectedMenuItemTextColor(UIColor(red: 18.0/255.0, green: 150.0/255.0, blue: 225.0/255.0, alpha: 1.0)),
                .unselectedMenuItemTextColor(UIColor(red: 40.0/255.0, green: 40.0/255.0, blue: 40.0/255.0, alpha: 1.0)),
                .menuItemFont(UIFont(name: "Noteworthy-Light", size: 15.0)!),
                .useMenuAsSegmentedControl(true),
                .menuItemSeparatorRoundEdges(true),
                .indicatorHeight(2.0),
                .menuItemSeparatorWidth(5),
                .menuItemSeparatorPercentageHeight(0.1)
                ]
    }()
}
