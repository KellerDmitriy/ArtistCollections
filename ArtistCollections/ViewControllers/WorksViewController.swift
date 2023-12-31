//
//  WorksViewController.swift
//  ArtistCollections
//
//  Created by Келлер Дмитрий on 09.11.2023.
//

import UIKit

final class WorksViewController: UITableViewController {
    var selectedImage: [Work]?
    var selectedArtist = ""
    
    private let cellID = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registeredCell()
        
        
        title = "by \(selectedArtist)"
    }
    
    private func registeredCell() {
        tableView.separatorStyle = .none
        tableView.rowHeight = 150
        tableView.register(WorkTableViewCell.self, forCellReuseIdentifier: cellID)
    }
}

extension WorksViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedImage?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        guard let workCell = cell as? WorkTableViewCell else { return UITableViewCell() }
        let picture = selectedImage?[indexPath.row]
        workCell.titleLabel.text = picture?.title
        workCell.picturesImageView.image = UIImage(named: picture?.image ?? "")
        return workCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        guard let works = selectedImage?[indexPath.row] else { return }
        detailViewController.selectedArtist = selectedArtist
        detailViewController.titleLabel.text = "\"\(works.title)\""
        detailViewController.infoLabel.text = works.info
        detailViewController.picturesImageView.image = UIImage(named: works.image ?? "")
        let navigationController = UINavigationController(rootViewController: detailViewController)
        navigationController.modalPresentationStyle = .automatic
        
        present(navigationController, animated: true, completion: nil)
    }
}
