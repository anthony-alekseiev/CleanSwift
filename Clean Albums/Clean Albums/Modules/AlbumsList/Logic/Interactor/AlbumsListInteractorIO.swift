//
//  AlbumsListInteractorIO.swift
//  Clean Albums
//
//  Created by Anton Aleksieiev on 5/18/18.
//  Copyright © 2018 fynjyass. All rights reserved.
//

import Foundation

protocol AlbumsListBusinessLogic {
    
    var presenter: AlbumsListPresentationLogic? {get set}
    
    func fetchdata(request: AlbumsListModels.FetchData.Request)
}

protocol AlbumsListDataStore {
    var albums: [AlbumVO] { get }
}
