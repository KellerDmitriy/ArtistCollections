//
//  ArtistCell.swift
//  ArtistCollections
//
//  Created by Келлер Дмитрий on 09.11.2023.
//

import UIKit

final class ArtistCell: UITableViewCell {
    
    lazy var artistView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var artistLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var bioLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var picturesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = true
        imageView.clipsToBounds = true
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
        contentView.addSubview(artistView)
        artistView.addSubview(picturesImageView)
        artistView.addSubview(artistLabel)
        artistView.addSubview(bioLabel)
        
        NSLayoutConstraint.activate([
            
            artistView.topAnchor.constraint(equalTo:  contentView.topAnchor, constant: 8),
            artistView.leadingAnchor.constraint(equalTo:  contentView.leadingAnchor, constant: 8),
            artistView.trailingAnchor.constraint(equalTo:  contentView.trailingAnchor, constant: -8),
            artistView.bottomAnchor.constraint(equalTo:  contentView.bottomAnchor, constant: -8),
            
            picturesImageView.topAnchor.constraint(equalTo: artistView.topAnchor),
            picturesImageView.leadingAnchor.constraint(equalTo: artistView.leadingAnchor),
            picturesImageView.trailingAnchor.constraint(equalTo: artistView.trailingAnchor, constant: -250),
            picturesImageView.bottomAnchor.constraint(equalTo: artistView.bottomAnchor),
            picturesImageView.widthAnchor.constraint(equalToConstant: 50),
            picturesImageView.heightAnchor.constraint(equalToConstant: 50),
            
            
            artistLabel.topAnchor.constraint(equalTo: artistView.topAnchor),
            artistLabel.leadingAnchor.constraint(equalTo: picturesImageView.trailingAnchor, constant: 8),
            artistLabel.trailingAnchor.constraint(equalTo: artistView.trailingAnchor, constant: -8),
            
            bioLabel.leadingAnchor.constraint(equalTo: picturesImageView.trailingAnchor, constant: 8),
            bioLabel.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: 8),
            bioLabel.bottomAnchor.constraint(equalTo: artistView.bottomAnchor),
            bioLabel.trailingAnchor.constraint(equalTo: artistView.trailingAnchor, constant: -8),
            
            
        ])
    }
}
