//
//  ChatItemCell.swift
//  Telegram
//
//  Created by Vlad on 14.01.24.
//

import SnapKit
import UIKit

class ChatItemCell: UITableViewCell {
    
    private let avatarImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 30
        
        return image
    }()
    
    private let nickNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        
        return label
    }()
    
    private let contextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)

        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        layoutElements()
    }
    
    private func layoutElements() {
        layoutAvatarImage()
        layoutStackView()
    }
    
    private func layoutAvatarImage() {
        contentView.addSubview(avatarImage)
        avatarImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.equalTo(60)
            make.width.equalTo(60)
            make.leading.equalTo(contentView.snp.leading).inset(10)
        }
    }
    
    private func layoutStackView() {
        stackView.addArrangedSubview(nickNameLabel)
        stackView.addArrangedSubview(contextLabel)
        stackView.spacing = 5
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.leading.equalTo(avatarImage.snp.trailing).offset(10)
            make.centerY.equalToSuperview()
            make.width.equalTo(250)
        }
    }
    
    func configure(with info: ChatsCellInfo) {
        avatarImage.image = info.avatar
        nickNameLabel.text = info.nickName
        contextLabel.text = info.context
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

