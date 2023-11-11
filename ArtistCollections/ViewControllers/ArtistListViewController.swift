//
//  ViewController.swift
//  ArtistCollections
//
//  Created by Келлер Дмитрий on 09.11.2023.
//

import UIKit

class ArtistListViewController: UITableViewController {
    
    private let cellID = "cell"
    private let networkManager = NetworkManager.shared
    private let searchController = UISearchController(searchResultsController: nil)
    
    private var artistsResult: ArtistResult?
    private var filteredArtist: [ArtistModel] = []
    
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        registeredCell()
        setupSearchController()
        setupNavigationBar()
        fetchData()
    }
    
    // MARK: - Private methods
    private func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.barTintColor = .gray
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        if let textField = searchController.searchBar.value(forKey: "searchField") as? UITextField {
            textField.font = UIFont.boldSystemFont(ofSize: 17)
            textField.textColor = .gray
        }
    }
    private func registeredCell() {
        tableView.rowHeight = 350
        tableView.register(ArtistTableCell.self, forCellReuseIdentifier: cellID)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltering
        ? filteredArtist.count
        : artistsResult?.artists.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        guard let artistCell = cell as? ArtistTableCell else { return UITableViewCell() }
        let artist = isFiltering
        ? filteredArtist[indexPath.row]
        : artistsResult?.artists[indexPath.row]
        
        artistCell.textLabel?.text = artist?.name
        artistCell.bioLabel.text = artist?.bio
        artistCell.picturesImageView.image = UIImage(named: artist?.image ?? "" )
        return artistCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let worksViewController = WorksViewController()
        let artist = artistsResult?.artists[indexPath.row]
        let works = artist?.works
        worksViewController.selectedImage = works
        navigationController?.pushViewController(worksViewController, animated: true)
    }
    
    func setupNavigationBar() {
        title = "Artists List"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .darkGray
    }
}

extension ArtistListViewController {
    func fetchData() {
        networkManager.fetchArtistsFromJSON { [weak self] result in
            switch result {
            case .success(let artist):
                self?.artistsResult = artist
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

// MARK: - UISearchResultsUpdating
extension ArtistListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text ?? "")
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        filteredArtist = artistsResult?.artists.filter { artist in
               let artistNameMatch = artist.name.lowercased().contains(searchText.lowercased())
            let workTitleMatch = artist.works?.contains { work in
                   work.title.lowercased().contains(searchText.lowercased())
               } 
            return artistNameMatch || (workTitleMatch != nil)
           } ?? []
           
           tableView.reloadData()
    }
}
