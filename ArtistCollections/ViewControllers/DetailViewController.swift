//
//  DetailViewController.swift
//  ArtistCollections
//
//  Created by Келлер Дмитрий on 11.11.2023.
//

import UIKit

final class DetailViewController: UIViewController {
    var selectedTitle: String?
    
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
        
        navigationItem.largeTitleDisplayMode = .never
        title = selectedTitle
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(picturesImageView)
        view.addSubview(infoLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            picturesImageView.topAnchor.constraint(equalTo: view.topAnchor,constant: 20),
            picturesImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            picturesImageView.widthAnchor.constraint(equalToConstant: 300),
            picturesImageView.heightAnchor.constraint(equalToConstant: 300),
            
            infoLabel.topAnchor.constraint(equalTo: picturesImageView.bottomAnchor, constant: 4),
            infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    
}
