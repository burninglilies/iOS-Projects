//
//  Spending.swift
//  lnp35_p4
//
//  Created by Lily Pham on 10/23/21.
//

import Foundation

enum SpendingCategory {
    case Food
    case Groceries
    case Personal
    case Educational
    case Miscellaneous
}

class Spending {
    var transactionNum: Int
    var description: String
    var category: SpendingCategory
    var amount: Double
    
    init(transactionNum: Int, description: String, category: SpendingCategory, amount: Double) {
        self.transactionNum = transactionNum
        self.description = description
        self.category = category
        self.amount = amount
    }
    
    func getDescriptionString() -> String {
        return self.description
    }
    
    func getAmountDouble() -> Double {
        return self.amount
    }
    
    
    func getCategoryString() -> String {
        switch category {
        case .Food:
            return "food"
        case .Groceries:
            return "groceries"
        case .Personal:
            return "personal"
        case .Educational:
            return "educational"
        case .Miscellaneous:
            return "miscellaneous"
        }
    }
}
