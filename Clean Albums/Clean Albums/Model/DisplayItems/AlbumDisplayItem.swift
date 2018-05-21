//
//  AlbumDisplayItem.swift
//  Clean Albums
//
//  Created by Anton Aleksieiev on 5/19/18.
//  Copyright © 2018 fynjyass. All rights reserved.
//

import Foundation

struct AlbumDisplayItem {
    var albumImageUrlsString: String
    var artistTitle: String
    var albumTitle: String
    
    init(with albumVO: AlbumVO) {
        albumImageUrlsString = albumVO.imageUrlString
        artistTitle = albumVO.artist
        albumTitle = albumVO.title
    }
}
