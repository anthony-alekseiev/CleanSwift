//
//  AlbumsListDisplayLogic.swift
//  Clean Albums
//
//  Created by Anton Aleksieiev on 5/18/18.
//  Copyright © 2018 fynjyass. All rights reserved.
//

import Foundation

protocol AlbumsListDisplayLogic: class {
    func displayFetchedAlbums(viewModel: AlbumsListModels.FetchData.ViewModel)
    func displayError(with message: String)
}

