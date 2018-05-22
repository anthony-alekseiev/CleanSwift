//
//  OrdersWorkers.swift
//  CleanStore
//
//  Created by Anton on 17.05.2018.
//  Copyright © 2018 fynjyass. All rights reserved.
//

import UIKit

protocol OrdersStoreProtocol {
    func fetchOrders(completionHandler: @escaping (() throws -> [Order]) -> Void)
}

class OrdersWorker {
    
    var ordersStore: OrdersStoreProtocol
    
    init(ordersStore: OrdersStoreProtocol) {
        self.ordersStore = ordersStore
    }
    
    func fetchOrders(completionHandler: @escaping ([Order]) -> Void) {
        ordersStore.fetchOrders { (orders: () throws -> [Order]) -> Void in
            do {
                let orders = try orders()
                DispatchQueue.main.async {
                    completionHandler(orders)
                }
            } catch {
                DispatchQueue.main.async {
                    completionHandler([])
                }
            }
        }
    }    
}

protocol OrdersStoreUtilityProtocol {}

extension OrdersStoreUtilityProtocol
{
    func generateOrderID(order: inout Order)
    {
        guard order.id == nil else { return }
        order.id = "\(arc4random())"
    }
    
    func calculateOrderTotal(order: inout Order)
    {
        guard order.total == NSDecimalNumber.notANumber else { return }
        order.total = NSDecimalNumber.one
    }
}

enum OrdersStoreError: Equatable, Error
{
    case CannotFetch(String)
    case CannotCreate(String)
    case CannotUpdate(String)
    case CannotDelete(String)
}

typealias OrdersStoreFetchOrdersCompletionHandler = (OrdersStoreResult<[Order]>) -> Void
typealias OrdersStoreFetchOrderCompletionHandler = (OrdersStoreResult<Order>) -> Void
typealias OrdersStoreCreateOrderCompletionHandler = (OrdersStoreResult<Order>) -> Void
typealias OrdersStoreUpdateOrderCompletionHandler = (OrdersStoreResult<Order>) -> Void
typealias OrdersStoreDeleteOrderCompletionHandler = (OrdersStoreResult<Order>) -> Void

enum OrdersStoreResult<U>
{
    case Success(result: U)
    case Failure(error: OrdersStoreError)
}


