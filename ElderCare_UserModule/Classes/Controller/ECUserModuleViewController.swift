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
    
    private var titles = ["User", "Group", "Role", "Authority"]
    
    private let userViewController = ECUserViewController()
    private let groupViewController = ECGroupViewController()
    private let roleViewController = ECRoleViewController()
    private let authorityViewController = ECAuthorityViewController()
    
    private let addBtn = UIButton(type: .custom)
    private let headLabel = UILabel()
    private let subTitleLabel = UILabel()
    
    private var controllers: [UIViewController] {
        let controllers = [userViewController, groupViewController, roleViewController, authorityViewController]
        for i in 0..<controllers.count {
            controllers[i].title = titles[i]
        }
        return controllers
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        addTopViews()
        addMenu()
    }
    
    private func addTopViews() {
        headLabel.addTo(view)
            .config {
                $0.text = titles[0]
                $0.font = UIFont.boldSystemFont(ofSize: 24)
            }.layout {
                $0.top.equalToSuperview().offset(UIScreen.adaptNavHeight + 30)
                $0.left.equalToSuperview().offset(20)
        }
        
        subTitleLabel.addTo(view)
            .config {
                $0.text = "This are some manager"
                $0.font = UIFont.systemFont(ofSize: 14)
            }.layout {
                $0.top.equalTo(headLabel.snp.bottom).offset(10)
                $0.left.equalTo(headLabel)
        }
        
        addBtn.addTo(view)
            .config {
                $0.setImage(UIImage(named: ""), for: .normal)
                $0.backgroundColor = .gray
                $0.addTarget(self, action: #selector(addAction), for: .touchUpInside)
            }.layout {
                $0.top.equalTo(headLabel)
                $0.right.equalToSuperview().inset(20)
                $0.width.height.equalTo(30)
        }
    }
    
    @objc private func addAction() {
    }

    private func addMenu() {
        addChild(menu)
        menu.view.addTo(view)
            .layout { (make) in
                make.top.equalToSuperview().offset(UIScreen.naviBarHeight + 50)
                make.left.right.bottom.equalToSuperview()
        }
    }
    lazy var menu: SegMenu = {
        let menuFrame = CGRect(x: 0,
                           y: UIScreen.naviBarHeight,
                           width: UIScreen.width,
                           height: UIScreen.height - UIScreen.naviBarHeight)
        let menu = SegMenu(viewControllers: controllers,
                       frame: menuFrame,
                       pageMenuOptions: options)
        menu.delegate = self
        return menu
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
                .menuItemSeparatorPercentageHeight(0.1)]
    }()
}

extension ECUserModuleViewController: SegMenuDelegate {
    func willMoveToPage(_ controller: UIViewController, index: Int) {
        print(index)
    }
    
    func didMoveToPage(_ controller: UIViewController, index: Int) {
        headLabel.text = titles[index]
    }
}
