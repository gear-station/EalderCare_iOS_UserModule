//
//  ECGroupViewController.swift
//  ElderCare_UserModule
//
//  Created by 贾富佳 on 2019/6/27.
//

import UIKit

class ECGroupViewController: UITableViewController {

    var groups = [GroupModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTestData()
        setUI()
    }
    
    private func generateTestData() {
        let groupNames = ["Bussiness", "Assistant Center", "Super Manager", "Office Team"]
        groups = groupNames.map { (name) in
                let fakeDic = [
                    "name": name,
                    "id": "G100",
                    "iconUrl": "https://i.pinimg.com/564x/66/24/92/662492d8b14fd8600f206bbb25dc3baa.jpg"
                    ] as [String : Any]
                
                let json = try! JSONSerialization.data(withJSONObject: fakeDic, options: [])
                let model = try! JSONDecoder().decode(GroupModel.self, from: json)
                return model
            }

        tableView.reloadData()
    }
    
    private func setUI() {
        tableView.config {
            $0.estimatedRowHeight = UITableView.automaticDimension
            $0.register(ECGroupTableViewCell.self, forCellReuseIdentifier: ECGroupTableViewCell.iden)
            $0.tableFooterView = UIView()
        }
    }
}

extension ECGroupViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ECGroupTableViewCell.iden, for: indexPath) as! ECGroupTableViewCell
        cell.loadData(groups[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
}
