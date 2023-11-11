//
//  ArtistTableCell.swift
//  ArtistCollections
//
//  Created by Келлер Дмитрий on 09.11.2023.
//

import UIKit

final class ArtistTableCell: UITableViewCell {
    
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
        contentView.addSubview(artistLabel)
        contentView.addSubview(picturesImageView)
        contentView.addSubview(bioLabel)
        
        let spacing: CGFloat = 4.0
        
        NSLayoutConstraint.activate([
            artistLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            artistLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            picturesImageView.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: spacing),
            picturesImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            picturesImageView.widthAnchor.constraint(equalToConstant: 150),
            picturesImageView.heightAnchor.constraint(equalToConstant: 150),
            
            bioLabel.topAnchor.constraint(equalTo: picturesImageView.bottomAnchor, constant: spacing),
            bioLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            bioLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            bioLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            bioLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
            
        ])
    }
}
