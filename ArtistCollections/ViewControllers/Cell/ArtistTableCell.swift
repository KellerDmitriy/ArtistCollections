//
//  ArtistTableCell.swift
//  ArtistCollections
//
//  Created by Келлер Дмитрий on 09.11.2023.
//

import UIKit

final class ArtistTableCell: UITableViewCell {
    
    lazy var shadowView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 8
        return view
    }()
    
    lazy var artistLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var bioLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .darkGray
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
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
        
        contentView.addSubview(artistLabel)
        contentView.addSubview(picturesImageView)
        contentView.addSubview(bioLabel)
        
        let spacing: CGFloat = 4.0
        
        NSLayoutConstraint.activate([
            shadowView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            shadowView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            shadowView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
            shadowView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            artistLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            artistLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            picturesImageView.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: spacing),
            picturesImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            picturesImageView.widthAnchor.constraint(equalToConstant: 150),
            picturesImageView.heightAnchor.constraint(equalToConstant: 150),
            
            bioLabel.topAnchor.constraint(equalTo: picturesImageView.bottomAnchor, constant: spacing),
            bioLabel.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor, constant: 10),
            bioLabel.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor, constant: -12),
            bioLabel.trailingAnchor.constraint(equalTo: shadowView.trailingAnchor, constant: -10),
            bioLabel.centerXAnchor.constraint(equalTo: shadowView.centerXAnchor)
            
        ])
    }
}
