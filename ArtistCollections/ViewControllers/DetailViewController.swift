//
//  DetailViewController.swift
//  ArtistCollections
//
//  Created by Келлер Дмитрий on 09.11.2023.
//

import UIKit

final class DetailViewController: UIViewController {
    var selectedImage: String?
    
    private lazy var picturesImageView: UIImageView = {
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
        view.backgroundColor = .darkGray
        view.addSubview(picturesImageView)
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
