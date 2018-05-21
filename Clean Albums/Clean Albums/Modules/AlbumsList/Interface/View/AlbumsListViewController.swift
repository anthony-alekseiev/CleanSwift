//
//  AlbumsListViewController.swift
//  Clean Albums
//
//  Created by Anton Aleksieiev on 5/18/18.
//  Copyright © 2018 fynjyass. All rights reserved.
//

import UIKit
import Kingfisher

final class AlbumsListViewController: UIViewController {
    var interactor: AlbumsListBusinessLogic?
    var router: (NSObjectProtocol & AlbumsListRoutingLogic & AlbumsListDataPassing)?
    var albums: [AlbumDisplayItem] = []
    let kCellIdentifier = "AlbumsListCell"
    
    @IBOutlet weak var tableView: UITableView!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        let interactor = AlbumsListInteractor()
        let router = AlbumsListRouter()
        router.dataStore = interactor
        router.viewController = self
        self.router = router
        let presenter = AlbumsListPresenter()
        presenter.view = self
        interactor.presenter = presenter
        self.interactor = interactor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.fetchdata(request: AlbumsListModels.FetchData.Request())
    }
    
    deinit {
        print("AlbumsListViewController deinit...")
    }
}

extension AlbumsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCellIdentifier, for: indexPath) as! AlbumsListCell
        let displayItem = albums[indexPath.row]
        configure(cell: cell, with: displayItem)
        return cell
    }
    
    private func configure(cell: AlbumsListCell, with displayItem: AlbumDisplayItem) {
        if let url = URL(string: displayItem.albumImageUrlsString) {
            cell.albumImage.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "placeholder"))
        } else {
            cell.albumImage.image = #imageLiteral(resourceName: "placeholder")
        }
        cell.artistLabel.text = displayItem.artistTitle
        cell.albumLabel.text = displayItem.albumTitle
    }
}

extension AlbumsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        router?.routeToStore(index: indexPath.row)
    }
}


//MARK: - AlbumsListDisplayLogic

extension AlbumsListViewController: AlbumsListDisplayLogic {
    func displayFetchedAlbums(viewModel: AlbumsListModels.FetchData.ViewModel) {
        albums = viewModel.albums
        tableView.reloadData()
    }
    
    func displayError(with message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "GOT IT", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
        print("Error while fetching albums. Reason: \(message)")
    }
}

