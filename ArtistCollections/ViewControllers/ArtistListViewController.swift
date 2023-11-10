//
//  ViewController.swift
//  ArtistCollections
//
//  Created by Келлер Дмитрий on 09.11.2023.
//

import UIKit

class ArtistListViewController: UITableViewController {
    
    private var artistsList: [ArtistModel] = []
    private let cellID = "cell"
    private let networkManager = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        fetchData()
        registeredCell()
        setupNavigationBar()
    }

    private func registeredCell() {
        tableView.rowHeight = 350
        tableView.register(ArtistCell.self, forCellReuseIdentifier: cellID)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artistsList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        guard let artistCell = cell as? ArtistCell else { return UITableViewCell() }
        let artist = artistsList[indexPath.row]
        artistCell.textLabel?.text = artist.name
        artistCell.bioLabel.text = artist.bio
        artistCell.imageView?.image = UIImage(named: artist.image ?? "Andy4")
        return artistCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        let artist = artistsList[indexPath.row]
        let firstImage = artist.work?.first
        detailViewController.selectedImage = firstImage?.image ?? ""
        
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func setupNavigationBar() {
        title = "Artists List"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .darkGray
    }
}

extension ArtistListViewController {
    func fetchData() {
        networkManager.loadArtistsFromJSON { [weak self] result in
            switch result {
            case .success(let artist):
                self?.artistsList = artist.artists
                
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

