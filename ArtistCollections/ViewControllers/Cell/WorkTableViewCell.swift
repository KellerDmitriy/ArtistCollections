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
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var picturesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupCell() {
        contentView.addSubview(picturesImageView)
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            picturesImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            picturesImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            picturesImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            picturesImageView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 4),
            
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: picturesImageView.bottomAnchor, constant: 4),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -4)
        ])
    }
}
