//
//  AlbumVO.swift
//  Clean Albums
//
//  Created by Anton Aleksieiev on 5/18/18.
//  Copyright © 2018 fynjyass. All rights reserved.
//

import ObjectMapper

struct AlbumVO: Mappable {
    
    var title                   : String = ""
    var artist                  : String = ""
    var imageUrlString          : String = ""
    var thumbnailImageUrlString : String = ""
    var albumUrlString          : String = ""
    
    init?(map: Map) {
        guard let _ = map.JSON["title"],
            let _ = map.JSON["artist"],
            let _ = map.JSON["image"],
            let _ = map.JSON["thumbnail_image"],
            let _ = map.JSON["url"] else { return nil }
    }
    
    mutating func mapping(map: Map) {
        title                       <- map["title"]
        artist                      <- map["artist"]
        imageUrlString              <- map["image"]
        thumbnailImageUrlString     <- map["thumbnail_image"]
        albumUrlString              <- map["url"]
    }

    
}
