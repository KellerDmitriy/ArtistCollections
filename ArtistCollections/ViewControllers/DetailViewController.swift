//
//  DetailViewController.swift
//  ArtistCollections
//
//  Created by Келлер Дмитрий on 11.11.2023.
//

import UIKit

final class DetailViewController: UIViewController {
    
    var selectedArtist = ""
    private var isImageZoomed = false
    private var isTextHidden = false
    
    private let detailStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
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
        title = "by \(selectedArtist)"
    }
    
    private func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(detailStackView)
        detailStackView.addArrangedSubview(titleLabel)
        detailStackView.addArrangedSubview(picturesImageView)
        detailStackView.addArrangedSubview(infoLabel)
        
        NSLayoutConstraint.activate([
            
            detailStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            detailStackView.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 20),
            detailStackView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -20),
            
            picturesImageView.widthAnchor.constraint(equalToConstant: 340),
            picturesImageView.heightAnchor.constraint(equalToConstant: 340),
            
            infoLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
        ])
    }
    
    private func setupGestureRecognizers() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        picturesImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func imageTapped() {
        isImageZoomed.toggle()
        UIView.transition(with: infoLabel, duration: 0.3, options: .transitionCrossDissolve, animations: {
            self.infoLabel.isHidden = self.isImageZoomed
        }, completion: nil)
        
        UIView.transition(with: titleLabel, duration: 0.3, options: .transitionCrossDissolve, animations: {
            self.titleLabel.isHidden = self.isImageZoomed
        }, completion: nil)
        
        if isImageZoomed {
            navigationController?.setNavigationBarHidden(true, animated: true)
            UIView.animate(withDuration: 0.3) {
                self.zoomInImage()
            }
        } else {
            navigationController?.setNavigationBarHidden(false, animated: true)
            UIView.animate(withDuration: 0.3) {
                self.zoomOutImage()
            }
        }
    }

    private func zoomInImage() {
        let yOffset: CGFloat = 200
        let scale = max(self.view.bounds.width / self.picturesImageView.bounds.width, self.view.bounds.height / self.picturesImageView.bounds.height)
        self.picturesImageView.transform = CGAffineTransform(scaleX: scale, y: scale)
        self.picturesImageView.center = CGPoint(x: self.view.center.x, y: self.view.center.y - yOffset)
    }

    private func zoomOutImage() {
        self.picturesImageView.transform = .identity
    }
}

