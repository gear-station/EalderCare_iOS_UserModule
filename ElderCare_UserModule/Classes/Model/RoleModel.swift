//
//  RoleModel.swift
//  ElderCare_UserModule
//
//  Created by 贾富佳 on 2019/8/22.
//

import Foundation

class RoleModel: Codable {
    var id: String = ""
    var name: String = ""
    var authortities: [AuthorityModel]?
}
