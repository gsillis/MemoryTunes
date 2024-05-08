//
//  AppReducer.swift
//  MemoryGameApp
//
//  Created by Gabriela Sillis on 03/05/24.
//

import ReSwift

func appReducer(action: Action, state: AppState?) -> AppState {
    let routingReducer = routingReducer(action: action, state: state?.routingState)
    let menuReducer = menuReducer(action: action, state: state?.menuState)
    let categoriesReducer = categoriesReducer(action: action, state: state?.categoriesState)
    
    return AppState(
        routingState: routingReducer,
        menuState: menuReducer,
        categoriesState: categoriesReducer
    )
}
