//
//  CategoryState.swift
//  MemoryGameApp
//
//  Created by Gabriela Sillis on 08/05/24.
//

enum Category: String {
    case pop = "Pop"
    case electronic = "Electronic"
    case rock = "Rock"
    case metal = "Metal"
    case rap = "Rap"
}

struct CategoriesState {
    let categories: [Category]
    var currentCategorySelected: Category
    
    init(currentCategory: Category) {
        self.categories = [.pop, .electronic, .rock, .metal, .metal]
        self.currentCategorySelected = currentCategory
    }
}
