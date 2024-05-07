//
//  AppRouter.swift
//  MemoryGameApp
//
//  Created by Gabriela Sillis on 06/05/24.
//

import ReSwift

final class AppRouter {
    let navController: UINavigationController
    var viewController = UIViewController()
    
    init(window: UIWindow) {
        self.navController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navController
        subscribe()
        setupNavBar()
    }
}
   
private extension AppRouter {
    func subscribe() {
        store.subscribe(self) { store in
            store.select { $0.routingState }
        }
    }
    
    func setupNavBar() {
        navController.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    func pushViewController(viewController: UIViewController, animated: Bool) {
        guard let currentViewController = navController.topViewController else {
            navController.pushViewController(viewController, animated: animated)
            return
        }
        
        if type(of: currentViewController) == type(of: viewController) {
            return
        }
        
        navController.pushViewController(viewController, animated: true)
    }
    
    func instantiateViewController(destination: RouterDestination) -> UIViewController {
        switch destination {
        case .menu:
            viewController = MenuTableViewController()
            return viewController
        case .categories:
            viewController = CategoriesTableViewController()
            return viewController
        case .game:
            viewController = GameViewController()
            return viewController
        }
    }
}

// MARK: - StoreSubscriber
extension AppRouter: StoreSubscriber {
    func newState(state: RoutingState) {
        let shouldAnimate = navController.topViewController != nil
        let viewController = instantiateViewController(destination: state.navigationState)
        pushViewController(viewController: viewController, animated: shouldAnimate)
    }
}

