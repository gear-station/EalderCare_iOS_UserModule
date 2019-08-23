//
//  ECGroupTableViewCell.swift
//  ElderCare_UserModule
//
//  Created by 贾富佳 on 2019/8/23.
//

import UIKit

class ECGroupTableViewCell: UITableViewCell {
    
    private var iconView: UIImageView!
    private var nameLabel: UILabel!
    private var memberDesc: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUI()
    }
    
    func loadData(_ group: GroupModel) {
        nameLabel.text = group.name
        memberDesc.text = "\(group.members?.count ?? 0) members"
        iconView.kf.setImage(with: URL(string: group.iconUrl ?? ""))
    }
    
}

extension ECGroupTableViewCell {
    
    private func setUI() {
        iconView = UIImageView()
            .addTo(contentView)
            .config {
                $0.contentMode = .scaleAspectFill
                $0.addRounded(radius: 5)
                $0.addBorder(width: 1, borderColor: .blue)
            }.layout {
                $0.centerY.equalToSuperview()
                $0.left.top.bottom.equalToSuperview().inset(20)
                $0.width.height.equalTo(30)
        }
        
        nameLabel = UILabel()
            .addTo(contentView)
            .config {
                $0.text = "Group Name"
                $0.font = UIFont.boldSystemFont(ofSize: 16)
                $0.textColor = .black
            }.layout {
                $0.center.equalToSuperview()
                $0.left.equalTo(iconView.snp.right).offset(10)
        }
        
        memberDesc = UILabel()
            .addTo(contentView)
            .config {
                $0.text = "0 members"
                $0.font = UIFont.systemFont(ofSize: 14)
                $0.textColor = .darkGray
            }.layout {
                $0.centerY.equalToSuperview()
        }
        
        let _ = UIImageView(image: UIImage(named: "right_triangle"))
            .addTo(contentView)
            .config {
                $0.contentMode = .scaleAspectFit
            }.layout {
                $0.centerY.equalToSuperview()
                $0.right.equalToSuperview().inset(10)
                $0.width.height.equalTo(20)
                $0.left.equalTo(memberDesc.snp.right).offset(10)
        }

    }
}

