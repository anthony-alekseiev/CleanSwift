//
//  Models.swift
//  аава
//
//  Created by Anton on 18.05.2018.
//  Copyright © 2018 Anton. All rights reserved.
//

import Foundation

enum AlbumsListModels {
        
    enum FetchData {
        struct Request {
        }

        struct Response {
            var objects: [AlbumVO]
            var error: Error?
        }

        struct ViewModel {
            var albums: [AlbumDisplayItem]
        }
    }
    
}
