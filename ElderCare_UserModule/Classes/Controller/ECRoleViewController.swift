//
//  ECRoleViewController.swift
//  ElderCare_UserModule
//
//  Created by 贾富佳 on 2019/6/27.
//

import UIKit

class ECRoleViewController: UITableViewController {
    var roles = [RoleModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        generateData()
    }

    private func generateData() {
        let authourities = [
            ["id": "g001", "name": "Distribute News", "desc": "People with this permission can post system news."],
            ["id": "g002", "name": "Edit members", "desc": "People with this permission can edit member information，add and delete members."],
            ["id": "g003", "name": "Create Tasks", "desc": "People with this permission can create tasks for members."],
            ["id": "g004", "name": "Update Group", "desc": "People with this permission can edit group information, add and delete groups."]
        ]
        let authourities2 = [
            ["id": "g001", "name": "Distribute News", "desc": "People with this permission can post system news."],
            ["id": "g002", "name": "Edit members", "desc": "People with this permission can edit member information，add and delete members."]
        ]
        let authourities3 = [
            ["id": "g001", "name": "Distribute News", "desc": "People with this permission can post system news."],
            ["id": "g002", "name": "Edit members", "desc": "People with this permission can edit member information，add and delete members."],
            ["id": "g001", "name": "Distribute News", "desc": "People with this permission can post system news."],
            ["id": "g001", "name": "Distribute News", "desc": "People with this permission can post system news."],
            ["id": "g002", "name": "Edit members", "desc": "People with this permission can edit member information，add and delete members."],
            ["id": "g003", "name": "Create Tasks", "desc": "People with this permission can create tasks for members."],
            ["id": "g004", "name": "Update Group", "desc": "People with this permission can edit group information, add and delete groups."]
        ]
        let authourities4 = [
            ["id": "g001", "name": "Distribute News", "desc": "People with this permission can post system news."],
            ["id": "g002", "name": "Edit members", "desc": "People with this permission can edit member information，add and delete members."],
            ["id": "g003", "name": "Create Tasks", "desc": "People with this permission can create tasks for members."],
            ["id": "g004", "name": "Update Group", "desc": "People with this permission can edit group information, add and delete groups."],
            ["id": "g001", "name": "Distribute News", "desc": "People with this permission can post system news."],
            ["id": "g002", "name": "Edit members", "desc": "People with this permission can edit member information，add and delete members."],
            ["id": "g003", "name": "Create Tasks", "desc": "People with this permission can create tasks for members."],
            ["id": "g004", "name": "Update Group", "desc": "People with this permission can edit group information, add and delete groups."],
            ["id": "g001", "name": "Distribute News", "desc": "People with this permission can post system news."],
            ["id": "g002", "name": "Edit members", "desc": "People with this permission can edit member information，add and delete members."],
            ["id": "g003", "name": "Create Tasks", "desc": "People with this permission can create tasks for members."],
            ["id": "g004", "name": "Update Group", "desc": "People with this permission can edit group information, add and delete groups."]
        ]
        
        let arr = [
            ["id": "r002","name": "Super Admin","authortities": authourities],
            ["id": "r003","name": "Team Leader","authortities": authourities2],
            ["id": "r004","name": "Super Admin","authortities": authourities3],
            ["id": "r005","name": "Team Member","authortities": authourities4],
            ["id": "r062","name": "No Authorization"],
            ["id": "r007","name": "Manager","authortities": authourities]
        ]
        roles = arr.map {
            let json = try! JSONSerialization.data(withJSONObject: $0, options: [])
            let model = try! JSONDecoder().decode(RoleModel.self, from: json)
            return model
        }
        tableView.reloadData()
    }

    private func setUI() {
        tableView.config {
            $0.register(ECRoleTableViewCell.self, forCellReuseIdentifier: ECRoleTableViewCell.iden)
            $0.tableFooterView = UIView()
        }
    }
    
    private func authorityViewHeight(_ model: RoleModel) -> CGFloat {
        guard let authorities = model.authortities, !authorities.isEmpty else {
            return 10
        }
        
        var row: CGFloat = 1
        var l: CGFloat = 20
        authorities.forEach {
            var tagWidth = ($0.name.boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: 20.0), font: UIFont.systemFont(ofSize: 14))).width
            tagWidth += ECRoleTableViewCell.LayoutConst.marginX + ECRoleTableViewCell.LayoutConst.paddingX
            let newL = l + tagWidth  + 20
            if newL > UIScreen.width {
                l = 20 + tagWidth
                row += 1
            } else {
                l = l + tagWidth
            }
        }
        return (19 + ECRoleTableViewCell.LayoutConst.marginY + ECRoleTableViewCell.LayoutConst.paddingY) * row
    }

}

extension ECRoleViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ECRoleTableViewCell.iden, for: indexPath) as! ECRoleTableViewCell
        cell.loadData(model: roles[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let role = roles[indexPath.row]
        return authorityViewHeight(role) + 60
    }
}
