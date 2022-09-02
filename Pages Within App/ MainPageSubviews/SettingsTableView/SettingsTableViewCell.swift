//
//  SettingsTableViewCell.swift
//  Login Page
//
//  Created by Jeffrey Hong on 8/26/22.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    var option = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        option.font = .systemFont(ofSize: 14)
        option.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(option)
        setupConstraints()
    }
    
    func configure(settings: Settings) {
        option.text = settings.option
    }
    
    func setupConstraints() {
            let padding: CGFloat = 8
        NSLayoutConstraint.activate([
            option.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            option.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            option.heightAnchor.constraint(equalToConstant: 20)
        
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
