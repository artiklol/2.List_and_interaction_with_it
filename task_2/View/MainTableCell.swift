//
//  MainTableCell.swift
//  task_2
//
//  Created by Artem Sulzhenko on 12.12.2022.
//

import UIKit

final class MainTableCell: UITableViewCell {
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .darkGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var iconInCircleView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        view.frame.size.height = 25
        view.layer.cornerRadius = view.frame.height
        view.clipsToBounds = true
        return view
    }()
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(20)
        return label
    }()
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(15)
        label.textColor = .systemGray
        return label
    }()
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 15
        return stackView
    }()
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 2
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(mainStackView)
        iconInCircleView.addSubview(iconImageView)
        labelsStackView.addArrangedSubview(titleLabel)
        labelsStackView.addArrangedSubview(descriptionLabel)
        mainStackView.addArrangedSubview(iconInCircleView)
        mainStackView.addArrangedSubview(labelsStackView)
        
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraint(){
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(
                equalTo: iconInCircleView.topAnchor, constant: 10),
            iconImageView.leadingAnchor.constraint(
                equalTo: iconInCircleView.leadingAnchor, constant: 10),
            iconImageView.trailingAnchor.constraint(
                equalTo: iconInCircleView.trailingAnchor, constant: -10),
            iconImageView.bottomAnchor.constraint(
                equalTo: iconInCircleView.bottomAnchor, constant: -10),
            
            iconInCircleView.widthAnchor.constraint(equalToConstant: 50),
            iconInCircleView.heightAnchor.constraint(equalToConstant: 50),
            
            mainStackView.leftAnchor.constraint(
                equalTo: contentView.leftAnchor, constant: 15),
            mainStackView.topAnchor.constraint(
                equalTo: contentView.topAnchor, constant: 15),
            mainStackView.rightAnchor.constraint(
                equalTo: contentView.rightAnchor, constant: -15),
            mainStackView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor, constant: -15)
        ])
    }
    
}
