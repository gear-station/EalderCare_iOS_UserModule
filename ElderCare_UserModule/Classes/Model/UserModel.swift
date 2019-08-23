//
//  UserModel.swift
//  ElderCare_UserModule
//
//  Created by 贾富佳 on 2019/8/22.
//

import Foundation

class UserModel: Codable {
    var id: String = ""
    var name: String = ""
    var role: RoleModel?
    var portraitUrl: String?
    var groupId: String?
}
