//
//  AlbumsListInteractor.swift
//  Clean Albums
//
//  Created by Anton Aleksieiev on 5/18/18.
//  Copyright © 2018 fynjyass. All rights reserved.
//

import Foundation

final class AlbumsListInteractor: AlbumsListDataStore {
    
    var presenter: AlbumsListPresentationLogic?
    var albumsListWorker = AlbumsListWorker()
    var albums: [AlbumVO] = []
    
    deinit {
        print("AlbumsListInteractor deinit...")
    }
}

//MARK: - AlbumsListInteractorBusinessLogic
extension AlbumsListInteractor: AlbumsListBusinessLogic {
    func fetchdata(request: AlbumsListModels.FetchData.Request) {
        albumsListWorker.getAlbums { [weak self] (albums, error) in
            self?.albums = albums
            self?.presenter?.presentFetchedData(response: AlbumsListModels.FetchData.Response(objects: albums, error: error))
        }
    }
}
