//
//  ECUserViewController.swift
//  ElderCare_UserModule
//
//  Created by 贾富佳 on 2019/5/30.
//

import UIKit
import SegMenu

class ECUserViewController: UITableViewController {
    var users = [UserModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTestData()
        setUI()
    }
    
    private func generateTestData() {
        do {
            for i in 0..<10 {
                let fakeDic = [
                    "name": "User\(i)",
                    "id": "1020\(i)",
                    "role": [
                        "id": "r00\(i)",
                        "name": "Admin"
                    ],
                    "portraitUrl": "https://i.pinimg.com/564x/42/23/c6/4223c64c3aa5d7830519b8051ad6177b.jpg",
                    "groupId": "g00\(i)"
                    ] as [String : Any]
                let json = try JSONSerialization.data(withJSONObject: fakeDic, options: [])
                let model = try JSONDecoder().decode(UserModel.self, from: json)
                users.append(model)
            }
            tableView.reloadData()
        } catch {
            print(error)
        }
    }
    
    private func setUI() {
        tableView.config {
            $0.estimatedRowHeight = UITableView.automaticDimension
            $0.register(ECUserTableViewCell.self, forCellReuseIdentifier: ECUserTableViewCell.iden)
            $0.tableFooterView = UIView()
        }
    }
}

extension ECUserViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ECUserTableViewCell.iden, for: indexPath) as! ECUserTableViewCell
        cell.loadData(users[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
}


