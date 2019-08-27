//
//  ECRoleTableViewCell.swift
//  ElderCare_UserModule
//
//  Created by 贾富佳 on 2019/8/27.
//

import UIKit
import TagListView

class ECRoleTableViewCell: UITableViewCell {
    
    struct LayoutConst {
        static let marginX: CGFloat = 10.0
        static let marginY: CGFloat = 5.0
        static let paddingX: CGFloat = 5.0
        static let paddingY: CGFloat = 5.0
    }
    private var nameLabel = UILabel()
    private var tagListView = TagListView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUI()
    }
    
    func loadData(model: RoleModel) {
  
        nameLabel.text = model.name
        
        tagListView.removeAllTags()
        if let tags = model.authortities?.map({ $0.name }) {
            tagListView.addTags(tags)
        }
    }
}

extension ECRoleTableViewCell {
    private func setUI() {
        selectionStyle = .none
        nameLabel.addTo(contentView)
            .config {
                $0.text = "Role Name"
                $0.font = UIFont.boldSystemFont(ofSize: 16)
                $0.textColor = UIColor.black

            }.layout {
                $0.top.left.equalToSuperview().offset(20)
        }
        
        tagListView.addTo(contentView)
            .config {
                $0.textFont = UIFont.systemFont(ofSize: 14)
                $0.textColor = UIColor.gray
                $0.tagBackgroundColor = UIColor(hexString: "eeeeee")
                $0.marginX = LayoutConst.marginX
                $0.marginY = LayoutConst.marginY
                $0.paddingX = LayoutConst.paddingX
                $0.paddingY = LayoutConst.paddingY
            }.layout {
                $0.top.equalTo(nameLabel.snp.bottom).offset(10)
                $0.left.right.bottom.equalToSuperview().inset(20)
            }
    }
}
