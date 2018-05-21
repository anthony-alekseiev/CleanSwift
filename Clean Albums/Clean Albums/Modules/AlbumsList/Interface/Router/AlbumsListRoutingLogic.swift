//
//  AlbumsListRoutingLogic.swift
//  Clean Albums
//
//  Created by Anton Aleksieiev on 5/18/18.
//  Copyright © 2018 fynjyass. All rights reserved.
//

import Foundation

protocol AlbumsListRoutingLogic {
    func routeToStore(index: Int)
}

protocol AlbumsListDataPassing {
    var dataStore: AlbumsListDataStore? { get }
}


