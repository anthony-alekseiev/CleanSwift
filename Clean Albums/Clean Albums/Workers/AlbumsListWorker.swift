//
//  AlbumsListWorker.swift
//  Clean Albums
//
//  Created by Anton Aleksieiev on 5/21/18.
//  Copyright © 2018 fynjyass. All rights reserved.
//

import Foundation

class AlbumsListWorker {
    let api = API()
    
    func getAlbums(callback: @escaping (_ albums: [AlbumVO], _ error: Error?) -> Void) {
        api.getAlbums { (response) in
            switch response.result {
            case .failure(let error):
                callback([], error)
            case .success(let value):
                callback(value, nil)
            }
        }
    }
}
