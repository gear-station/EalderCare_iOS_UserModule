//
//  ECAuthorityViewController.swift
//  ElderCare_UserModule
//
//  Created by 贾富佳 on 2019/6/27.
//

import UIKit

class ECAuthorityViewController: UITableViewController {

    var authorities = [AuthorityModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        generateData()
    }

    private func generateData() {
        let arr = [
            ["id": "g001", "name": "Distribute News", "desc": "People with this permission can post system news."],
            ["id": "g002", "name": "Edit members", "desc": "People with this permission can edit member information，add and delete members."],
            ["id": "g003", "name": "Create Tasks", "desc": "People with this permission can create tasks for members."],
            ["id": "g004", "name": "Update Group", "desc": "People with this permission can edit group information, add and delete groups."]
        ]
        authorities = arr.map {
            let json = try! JSONSerialization.data(withJSONObject: $0, options: [])
            let model = try! JSONDecoder().decode(AuthorityModel.self, from: json)
            return model
        }
        tableView.reloadData()
    }
    
    private func setUI() {
        tableView.config {
            $0.rowHeight = UITableView.automaticDimension
            $0.register(ECAuthorityTableViewCell.self, forCellReuseIdentifier: ECAuthorityTableViewCell.iden)
            $0.tableFooterView = UIView()
        }
    }
    
}

extension ECAuthorityViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return authorities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ECAuthorityTableViewCell.iden, for: indexPath) as! ECAuthorityTableViewCell
        cell.loadData(model: authorities[indexPath.row])
        return cell
    }
}
