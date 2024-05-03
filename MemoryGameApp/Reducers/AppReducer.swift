//
//  AppReducer.swift
//  MemoryGameApp
//
//  Created by Gabriela Sillis on 03/05/24.
//

import ReSwift

func appReducer(action: Action, state: AppState?) -> AppState {
    let routingReducer = routingReducer(action: action, state: state?.routingState)
    return AppState(routingState: routingReducer)
}
