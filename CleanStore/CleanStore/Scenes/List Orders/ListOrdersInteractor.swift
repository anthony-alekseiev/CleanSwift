//
//  ListOrdersInteractor.swift
//  CleanStore
//
//  Created by Anton on 17.05.2018.
//  Copyright (c) 2018 fynjyass. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ListOrdersBusinessLogic {
    func fetchOrders(request: ListOrders.FetchOrders.Request)
}

protocol ListOrdersDataStore {
    var orders: [Order]? {get set}
}

class ListOrdersInteractor: ListOrdersBusinessLogic, ListOrdersDataStore {
  var presenter: ListOrdersPresentationLogic?
  var worker: ListOrdersWorker?
    
    var ordersWorker = OrdersWorker(ordersStore: OrdersMemStore())
    var orders: [Order]?
    
    func fetchOrders(request: ListOrders.FetchOrders.Request) {
        ordersWorker.fetchOrders { (orders) -> Void in
            self.orders = orders
            let response = ListOrders.FetchOrders.Response(orders: orders)
            self.presenter?.presentFetchedOrders(response: response)
        }
    }
  
}
