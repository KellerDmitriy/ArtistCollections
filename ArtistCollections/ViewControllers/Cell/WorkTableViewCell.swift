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
        imageView.isUserInteractionEnabled = true
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black.withAlphaComponent(0.65)
        view.layer.cornerRadius = 8
        
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
            contentView.heightAnchor.constraint(equalToConstant: 90)
        ])
        
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
