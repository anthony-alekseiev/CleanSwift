//
//  AlbumsListRouter.swift
//  Clean Albums
//
//  Created by Anton Aleksieiev on 5/18/18.
//  Copyright © 2018 fynjyass. All rights reserved.
//

import UIKit

final class AlbumsListRouter: NSObject, AlbumsListDataPassing {
    
    weak var viewController: AlbumsListViewController?
    var dataStore: AlbumsListDataStore?
    
    deinit {
        print("AlbumsListRouter deinit...")
    }
}


//MARK: - AlbumsListWireframe
extension AlbumsListRouter: AlbumsListRoutingLogic {
    func routeToStore(index: Int) {
        guard let source = viewController,
            var destinationVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "AlbumStoreViewController") as? AlbumStoreViewController else {return}
        passDataToSomewhere(indexOfData: index, source: source, destination: &destinationVC)
        navigateToSomewhere(source: source, destination: destinationVC)
    }
    
    func navigateToSomewhere(source: AlbumsListViewController, destination: AlbumStoreViewController) {
      source.show(destination, sender: nil)
    }
    
    // MARK: Passing data
    
    func passDataToSomewhere(indexOfData index: Int, source: AlbumsListViewController, destination: inout AlbumStoreViewController) {
        guard let albumUrlString = dataStore?.albums[index].albumUrlString else {return}
        destination.urlString = albumUrlString
    }
}

