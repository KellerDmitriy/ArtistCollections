//
//  DetailViewController.swift
//  ArtistCollections
//
//  Created by Келлер Дмитрий on 11.11.2023.
//

import UIKit

final class DetailViewController: UIViewController {
    var selectedImage: String?
    
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
        
        if let imageToLoad = selectedImage {
            picturesImageView.image = UIImage(named: imageToLoad)
        }
        
        navigationItem.largeTitleDisplayMode = .never
        title = selectedImage
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
        view.addSubview(picturesImageView)
        view.addSubview(titleLabel)
        view.addSubview(infoLabel)
 
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            picturesImageView.topAnchor.constraint(equalTo: view.topAnchor),
            picturesImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            picturesImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            picturesImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    

    // MARK: - Navigation


}
