//
//  AlbumsListPresenter.swift
//  Clean Albums
//
//  Created by Anton Aleksieiev on 5/18/18.
//  Copyright © 2018 fynjyass. All rights reserved.
//

import Foundation

final class AlbumsListPresenter {
    
    weak var view: AlbumsListDisplayLogic?

    deinit {
        print("AlbumsListPresenter deinit...")
    }
}

//MARK: -  AlbumsListPresentationLogic
extension AlbumsListPresenter: AlbumsListPresentationLogic {
    func presentFetchedData(response: AlbumsListModels.FetchData.Response) {
        if let error = response.error {
            view?.displayError(with: error.localizedDescription)
        } else {
            let viewModel = AlbumsListModels.FetchData.ViewModel(albums: response.objects.map({AlbumDisplayItem(with: $0)}))
            view?.displayFetchedAlbums(viewModel: viewModel)
        }
    }
}
