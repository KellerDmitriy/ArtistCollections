//
//  WorksCell.swift
//  ArtistCollections
//
//  Created by Келлер Дмитрий on 10.11.2023.
//

import UIKit

final class WorkTableViewCell: UITableViewCell {
    
    lazy var shadowView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 8
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var picturesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = true
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black.withAlphaComponent(0.5)
        view.layer.cornerRadius = 10
        
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupCell() {
        selectionStyle = .none
        contentView.addSubview(shadowView)
        contentView.addSubview(picturesImageView)
        contentView.addSubview(view)
        contentView.addSubview(titleLabel)
        
        let safeArea = contentView.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: 150),
            
            shadowView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            shadowView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            shadowView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            shadowView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            picturesImageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10),
            picturesImageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            safeArea.trailingAnchor.constraint(equalTo: picturesImageView.trailingAnchor, constant: 16),
            safeArea.bottomAnchor.constraint(equalTo: picturesImageView.bottomAnchor, constant: 10),
            
            view.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10),
            view.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            safeArea.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16),
            safeArea.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10),
            
            titleLabel.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor,constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 26),
            safeArea.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 26)
        ])
    }
}
