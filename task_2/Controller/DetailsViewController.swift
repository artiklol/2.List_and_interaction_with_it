//
//  DetailsViewController.swift
//  task_2
//
//  Created by Artem Sulzhenko on 16.12.2022.
//

import UIKit

final class DetailsViewController: UIViewController {
    
    var detailElement: List?
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .darkGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var iconInCircleView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        view.frame.size.height = 50
        view.layer.cornerRadius = view.frame.height
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(20)
        label.textAlignment = .center
        return label
    }()
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(15)
        label.textColor = .systemGray
        label.textAlignment = .center
        return label
    }()
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var customBackButton = UIBarButtonItem(title: "Back",
                                                        style: .plain,
                                                        target: self,
                                                        action: #selector(closes))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigationItem.leftBarButtonItem = customBackButton
        
        iconImageView.image = UIImage(named: detailElement?.icon ?? "error")
        titleLabel.text = "\(detailElement?.title ?? "Error title")"
        descriptionLabel.text = "\(detailElement?.description ?? "Error description")"
        
        iconInCircleView.addSubview(iconImageView)
        view.addSubview(iconInCircleView)
        labelsStackView.addArrangedSubview(titleLabel)
        labelsStackView.addArrangedSubview(descriptionLabel)
        view.addSubview(labelsStackView)
        
        setConstraint()
    }
    
    private func setConstraint(){
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(
                equalTo: iconInCircleView.topAnchor, constant: 20),
            iconImageView.leadingAnchor.constraint(
                equalTo: iconInCircleView.leadingAnchor, constant: 20),
            iconImageView.trailingAnchor.constraint(
                equalTo: iconInCircleView.trailingAnchor, constant: -20),
            iconImageView.bottomAnchor.constraint(
                equalTo: iconInCircleView.bottomAnchor, constant: -20),
            
            iconInCircleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconInCircleView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            iconInCircleView.widthAnchor.constraint(equalToConstant: 100),
            iconInCircleView.heightAnchor.constraint(equalToConstant: 100),
            
            labelsStackView.topAnchor.constraint(
                equalTo: iconInCircleView.bottomAnchor, constant: 10),
            labelsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func closes(){
        dismiss(animated: true, completion: nil)
    }
    
}
