//
//  API.swift
//  Clean Albums
//
//  Created by Anton Aleksieiev on 5/21/18.
//  Copyright © 2018 fynjyass. All rights reserved.
//
import Alamofire
import AlamofireObjectMapper

class API {
    
    let manager: SessionManager = {
        
        let configuration = URLSessionConfiguration.default
        configuration.urlCache = nil
        configuration.requestCachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        
        return SessionManager(configuration: configuration)
    }()
    
    func requestWrapper(_ request: URLRequestConvertible) -> DataRequest {
        return manager.request(request)
    }
    
    @discardableResult
    func getAlbums(response: @escaping (DataResponse<[AlbumVO]>) -> Void ) -> DataRequest {
        return requestWrapper(APIRouter.getAlbums).responseArray(completionHandler: response)
    }
    
}
