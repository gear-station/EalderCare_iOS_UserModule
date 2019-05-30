//
//  UserTarget.swift
//  ElderCare_UserModule
//
//  Created by 贾富佳 on 2019/5/30.
//

import UIKit

class Target_User: NSObject {

    func Action_userViewController(_ params: NSDictionary) -> UIViewController {
        if let callback = params["callback"] as? (String) -> Void {
            callback("success")
        }
        
        let userVC = ECUserViewController()
        return userVC
    }
}
