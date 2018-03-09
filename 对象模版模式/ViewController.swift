//
//  ViewController.swift
//  对象模版模式
//
//  Created by CM on 2018/3/7.
//  Copyright © 2018年 CM. All rights reserved.
//

import UIKit

class NewProduct {
    private (set) var name: String;
    private (set) var description: String;
    private (set) var category: String;
    private var stockLevelBackingValue: Int = 0;
    private var priceBackingVaule: Double = 0;
    
    init(name: String, description: String,
         category: String, price: Double, stockLevel: Int) {
        self.name = name;
        self.description = description;
        self.category = category;
    }
    
}

class Product {
    var name: String;
//    var description: String;
    var price: Double;
    private var stockBackingValue: Int = 0
    
    var stock: Int {
        get {
            return stockBackingValue;
        }
        set {
            stockBackingValue = max(0, newValue)
        }
    }
    
    init(name: String, description: String,price: Double, stock: Int) {
        self.name = name
//        self.description = description
        self.price = price
        self.stock = stock
    }
    
    func calculateTax(rate: Double) -> Double {
        
//        return self.price * rate
        //  取小的那个
        return min(10, self.price * rate)
    }
    
    var stockValue: Double {
        get {
            return self.price * Double(self.stock)
        }
    }
}

class ViewController: UIViewController {
    
    var newProducts = [
        Product.init(name: "Kayak", description: "A boat for one person", price: 275, stock: 0),
        Product.init(name: "Lifejacket", description: "Protective and fashionable", price: 10, stock: 10),
        Product.init(name: "Soccer Ball", description: "FIFA-approved size and weight", price: 10, stock: 20)
    ]
    
    func calculateStockValue(productsArry:[Product]) -> Double {
        return productsArry.reduce(0, {(total, product) -> Double in
            print("total = \(total)")
            return total + product.stockValue
        })
        
    }
    
    

//    var products = [("Kayak","A boat for one person", 275.0, 10),
//                    ("Lifejacket","Protective and fashionable", 48.95, 14),
//                    ("Soccer Ball","FIFA-approved size and weight", 19.5, 32)]
//
//    func calculateTax(product:(String, String, Double, Int)) -> Double {
//        return product.2 * 0.2
//    }
//
//
//    func calculateStockValue(tuples:[(String, String, Double, Int)]) -> Double {
//        return tuples.reduce(0, {
//            (total, product) -> Double in
//            return total + (product.2 * Double(product.3))
//        })
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        print("Sales tax for Kayak:$\(calculateTax(product: products[0]))")
//        print("Total value of stock:$\(calculateStockValue(tuples: products))")
        
        print("Sales tax for Kayak:$\(newProducts[0].calculateTax(rate: 0.2))")
        print("Total value of stock:$\(calculateStockValue(productsArry: newProducts))")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

