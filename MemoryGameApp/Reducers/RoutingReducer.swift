//
//  RoutingReducer.swift
//  MemoryGameApp
//
//  Created by Gabriela Sillis on 03/05/24.
//

import ReSwift

func routingReducer(action: Action, state: RoutingState?) -> RoutingState {
    var state = state ?? RoutingState()
    
    switch action {
    case let routingAction as RoutingAction:
        state.navigationState = routingAction.destination
    default:
        break
    }
    return state
}
