//
//  ECUserTableViewCell.swift
//  ElderCare_UserModule
//
//  Created by 贾富佳 on 2019/8/21.
//

import UIKit
import Kingfisher

class ECUserTableViewCell: UITableViewCell {

    private var nameLabel: UILabel!
    private var groupLabel: UILabel!
    private var roleLabel: UILabel!
    private var statusMark: UIView!
    private var portraitView: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUI()
    }
    
    func loadData(_ user: UserModel) {
        nameLabel.text = user.name
        roleLabel.text = user.role?.name
        portraitView.kf.setImage(with: URL(string: user.portraitUrl ?? ""), placeholder: UIImage(named: "user_portriat"))
    }

}


extension ECUserTableViewCell {
    private func setUI() {
        portraitView = UIImageView()
            .addTo(contentView)
            .config {
                $0.contentMode = .scaleAspectFill
                $0.addRounded(radius: 5)
                $0.addBorder(width: 1, borderColor: .blue)
            }.layout {
                $0.centerY.equalToSuperview()
                $0.left.equalToSuperview().offset(20)
                $0.width.height.equalTo(50)
        }
        
        nameLabel = UILabel()
            .addTo(contentView)
            .config {
                $0.text = "Name"
                $0.font = UIFont.systemFont(ofSize: 16)
                $0.textColor = .black
            }.layout {
                $0.top.equalToSuperview().offset(20)
                $0.left.equalTo(portraitView.snp.right).offset(10)
        }
        
        groupLabel = UILabel()
            .addTo(contentView)
            .config {
                $0.text = "Group Name"
                $0.font = UIFont.systemFont(ofSize: 14)
                $0.textColor = .darkGray
            }.layout {
                $0.top.equalTo(nameLabel.snp.bottom).offset(15)
                $0.bottom.equalToSuperview().inset(20)
                $0.left.equalTo(nameLabel)
        }
        
        roleLabel = UILabel()
            .addTo(contentView)
            .config {
                $0.text = "Role Name"
                $0.font = UIFont.systemFont(ofSize: 14)
                $0.textColor = .darkGray
            }.layout {
                $0.left.equalToSuperview().offset(UIScreen.width / 2)
                $0.top.equalTo(groupLabel)
        }
        
    }
}
