//
//  GroupModel.swift
//  ElderCare_UserModule
//
//  Created by 贾富佳 on 2019/8/22.
//

import Foundation

class GroupModel: Codable {
    var id: String = ""
    var name: String = ""
    var iconUrl: String?
    var members: [UserModel]?
}
