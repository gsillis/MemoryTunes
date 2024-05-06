//
//  RoutingState.swift
//  MemoryGameApp
//
//  Created by Gabriela Sillis on 03/05/24.
//

import ReSwift

struct RoutingState {
    var navigationState: RouterDestination
    
    init(navigationState: RouterDestination = .menu) {
        self.navigationState = navigationState
    }
}
