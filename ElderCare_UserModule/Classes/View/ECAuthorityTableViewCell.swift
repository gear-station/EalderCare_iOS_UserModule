//
//  ECAuthorityTableViewCell.swift
//  ElderCare_UserModule
//
//  Created by 贾富佳 on 2019/8/26.
//

import UIKit

class ECAuthorityTableViewCell: UITableViewCell {

    private var nameLabel = UILabel()
    private var descLabel = UILabel()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUI()
    }
    
    func loadData(model: AuthorityModel) {
        nameLabel.text = model.name
        descLabel.text = model.desc
    }
}

extension ECAuthorityTableViewCell {
    private func setUI() {
        nameLabel.addTo(contentView)
            .config {
                $0.text = "Authority Name"
                $0.font = UIFont.boldSystemFont(ofSize: 16)
                $0.textColor = UIColor.black
            }.layout {
                $0.top.left.equalToSuperview().offset(20)
        }
        
        descLabel.addTo(contentView)
            .config {
                $0.text = "Authority Description"
                $0.font = UIFont.systemFont(ofSize: 14)
                $0.numberOfLines = 0
            }.layout {
                $0.top.equalTo(nameLabel.snp.bottom).offset(10)
                $0.left.right.bottom.equalToSuperview().inset(20)
        }
    }
}
