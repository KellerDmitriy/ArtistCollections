//
//  WorksViewController.swift
//  ArtistCollections
//
//  Created by Келлер Дмитрий on 09.11.2023.
//

import UIKit

final class WorksViewController: UITableViewController {
    var selectedImage: [Work]?
    
    private let cellID = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registeredCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    private func registeredCell() {
        tableView.rowHeight = 300
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
        let works = selectedImage?[indexPath.row]
        detailViewController.titleLabel.text = works?.title
        detailViewController.infoLabel.text = works?.info
        detailViewController.selectedImage = works?.image
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
