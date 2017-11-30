//
//  YKCell.swift
//  YKLive
//
//  Created by Mr_Jia on 2017/11/16.
//  Copyright © 2017年 Mr_Jia. All rights reserved.
//

import UIKit
import SnapKit
class YKCell: UITableViewCell {
    let headImageView = UIImageView()
    let nickLabel = UILabel()
    let locationLabel = UILabel()
    let viewersLabel = UILabel()
    let bigImageView = UIImageView()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setSubViews()

    }
    func setSubViews() {
        // --头像
        headImageView.layer.cornerRadius = 30
        headImageView.isWindlessable = true
        headImageView.layer.masksToBounds = true
        headImageView.contentMode = .scaleAspectFill
        self.contentView.addSubview(headImageView)
        headImageView.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview().offset(5)
            make.width.height.equalTo(60)
        }
        // --昵称
        self.contentView.addSubview(nickLabel)
        nickLabel.isWindlessable = true
        nickLabel.snp.makeConstraints { (make) in
            make.top.equalTo(headImageView.snp.top)
            make.left.equalTo(headImageView.snp.right).offset(5)
            make.height.equalTo(20)
            make.right.equalToSuperview().offset(5)
        }
        // --位置
        let locationImageView = UIImageView(image: #imageLiteral(resourceName: "address-1"))
        self.contentView.addSubview(locationImageView)
        locationImageView.snp.makeConstraints { (make) in
            make.left.equalTo(nickLabel)
            make.width.height.equalTo(20)
            make.top.equalTo(nickLabel.snp.bottom).offset(5)
        }
      self.contentView.addSubview(locationLabel)
        locationLabel.isWindlessable = true
        
        locationLabel.snp.makeConstraints { (make) in
            make.left.equalTo(locationImageView.snp.right).offset(2)
            make.top.equalTo(locationImageView.snp.top)
            make.width.equalTo(100)
            make.height.equalTo(20)
        }
        
        // --人气
        viewersLabel.textAlignment = .right
        self.contentView.addSubview(viewersLabel)
        viewersLabel.isWindlessable = true
        viewersLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nickLabel.snp.bottom).offset(5)
            make.left.equalTo(locationLabel.snp.right).offset(5)
            make.height.equalTo(20)
            make.right.equalToSuperview().offset(-5)
        }
        // --预览图
        bigImageView.layer.cornerRadius = 10
        bigImageView.isWindlessable = true
        bigImageView.contentMode = .scaleAspectFill
        bigImageView.layer.masksToBounds = true
        self.addSubview(bigImageView)
        bigImageView.snp.makeConstraints { (make) in
            make.leftMargin.equalToSuperview().offset(5)
            make.rightMargin.equalToSuperview().offset(-5)
            make.top.equalTo(headImageView.snp.bottom).offset(5)
            make.height.equalTo(500)
        }

    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
