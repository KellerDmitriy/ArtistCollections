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
        
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            
            picturesImageView.topAnchor.constraint(equalTo: safeArea.topAnchor,constant: 30),
            picturesImageView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            
            picturesImageView.widthAnchor.constraint(equalToConstant: 340),
            picturesImageView.heightAnchor.constraint(equalToConstant: 340),
            
            infoLabel.topAnchor.constraint(equalTo: picturesImageView.bottomAnchor, constant: 8),
            infoLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 8),
            infoLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -8),
            infoLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
        ])
        
    }
    
}
