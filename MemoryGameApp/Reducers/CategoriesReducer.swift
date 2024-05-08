//
//  CategoriesReducer.swift
//  MemoryGameApp
//
//  Created by Gabriela Sillis on 08/05/24.
//

import ReSwift

private struct CategoriesReducerConstants {
    static let userDefaultCategoryKey = "currentCategoryKey"
}

private typealias Constants = CategoriesReducerConstants

func categoriesReducer(action: Action, state: CategoriesState?) -> CategoriesState {
    var currentCategory: Category = .pop
    
    if let loadedCategory = getCurrentCategoryStateFromUserDefaults() {
        currentCategory = loadedCategory
    }
    
    var state = CategoriesState(currentCategory: currentCategory)
    
    switch action {
    case let ChangeCategoryAction as ChangeCategoryAction:
        let newCategory = state.categories[ChangeCategoryAction.categoryIndex]
        state.currentCategorySelected = newCategory
        saveCurrentCategoryStateToUserDefaults(category: newCategory)
    default:
        break
    }
    
    return state
}

private func getCurrentCategoryStateFromUserDefaults() -> Category? {
    let userDefaults = UserDefaults.standard
    let rawValue = userDefaults.string(forKey: Constants.userDefaultCategoryKey)
    
    if let rawValue = rawValue {
        return Category(rawValue: rawValue)
    } else {
        return nil
    }
}

private func saveCurrentCategoryStateToUserDefaults(category: Category) {
    let userDefaults = UserDefaults.standard
    userDefaults.set(category.rawValue, forKey: Constants.userDefaultCategoryKey)
}
