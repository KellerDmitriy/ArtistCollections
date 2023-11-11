//
//  WorksCell.swift
//  ArtistCollections
//
//  Created by Келлер Дмитрий on 10.11.2023.
//

import UIKit

final class WorkTableViewCell: UITableViewCell {
    
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
        imageView.layer.cornerRadius = 8
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
        contentView.addSubview(picturesImageView)
        contentView.addSubview(view)
        contentView.addSubview(titleLabel)
        
        let safeArea = contentView.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: 150),
            
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
