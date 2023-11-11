//
//  DetailViewController.swift
//  ArtistCollections
//
//  Created by Келлер Дмитрий on 11.11.2023.
//

import UIKit

final class DetailViewController: UIViewController {
    
    var selectedTitle: String?
    
    var isTextHidden = false
    
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textColor = .darkGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var picturesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupGestureRecognizers()
        
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
            
            picturesImageView.topAnchor.constraint(equalTo: safeArea.topAnchor,constant: 50),
            picturesImageView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            
            picturesImageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 8),
            picturesImageView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -8),
            
            infoLabel.topAnchor.constraint(equalTo: picturesImageView.bottomAnchor, constant: 8),
            infoLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 8),
            infoLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -8),
            infoLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
        ])
        
    }
    
    private func setupGestureRecognizers() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        picturesImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func imageTapped() {
        isTextHidden.toggle()
        UIView.transition(with: infoLabel, duration: 0.3, options: .transitionCrossDissolve, animations: {
            self.infoLabel.isHidden = self.isTextHidden
        }, completion: nil)
        
        if isTextHidden {
            navigationController?.setNavigationBarHidden(true, animated: true)
            UIView.animate(withDuration: 0.3) {
                let scale = max(self.view.bounds.width / self.picturesImageView.bounds.width, self.view.bounds.height / self.picturesImageView.bounds.height) + 1.3
                self.picturesImageView.transform = CGAffineTransform(scaleX: scale, y: scale)
                let yOffset: CGFloat = 400
                self.picturesImageView.center = CGPoint(x: self.view.center.x, y: self.view.center.y + yOffset )
            }
        } else {
            navigationController?.setNavigationBarHidden(false, animated: true)
            UIView.animate(withDuration: 0.3) {
                self.picturesImageView.transform = .identity
            }
        }
    }
}

