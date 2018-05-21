//
//  APIRouter.swift
//  Clean Albums
//
//  Created by Anton Aleksieiev on 5/21/18.
//  Copyright © 2018 fynjyass. All rights reserved.
//

import Alamofire

enum APIRouter: URLRequestConvertible {
    
    static var baseURL:NSURL {
        let string = "https://rallycoding.herokuapp.com"
        return NSURL(string: string)!
    }
    
    //MARK: - URLRequest Convertible
    var URL: NSURL {
        if let pathString = route.path.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            return NSURL(string:pathString, relativeTo:APIRouter.baseURL as URL)!
        } else {
            assert(false, "something wrong with path")
            return APIRouter.baseURL
        }
    }
    
    /* Create URL request. HTTP headers could be set here. */
    func asURLRequest() throws ->URLRequest {
        var request = URLRequest(url: URL as URL)
        request.httpMethod = route.method.rawValue
        return try URLEncoding.default.encode(request, with: route.parameters)
    }
    
    //MARK: - Cases
    case getAlbums
    
    var route: (method: Alamofire.HTTPMethod, path: String, parameters: [String : Any]?) {
        switch self {
        case .getAlbums:
            return (.get, "/api/music_albums", nil)
        }
    }
}
