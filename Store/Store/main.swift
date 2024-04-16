//
//  main.swift
//  Store
//
//  Created by Ted Neward on 2/29/24.
//

import Foundation

protocol SKU {
    var name: String { get }
    func price () -> Int
}

class Item: SKU {
    
    let itemName: String
       let itemPrice: Int
       init(name: String, priceEach: Int) {
           self.itemName = name
           self.itemPrice = priceEach
       }

       var name: String {
           return itemName
       }

       func price() -> Int {
           return itemPrice
       }
    
    
}

class Receipt {
    var scannedItems: [SKU] = []
    
    func addItem(_ item:SKU) {
        scannedItems.append(item)
    }
    
    func items() -> [SKU] {
        return scannedItems
    }
    
    func subtotal() -> Int {
        var total = 0
        for item in scannedItems {
            total += item.price()
        }
        return total
    }
    
    
    func output() -> String {
            var receiptText = "Receipt:\n"
                for item in scannedItems {
                    receiptText += "\(item.name): $\(String(format: "%.2f", Double(item.price()) / 100))\n"
                }
                receiptText += "------------------\n"
                receiptText += "TOTAL: $\(String(format: "%.2f", Double(total()) / 100))"
                return receiptText
        }
    
    func total() -> Int {
        return subtotal()
    }
}
    class Register {
        var receipt: Receipt
        
        init() {
            receipt = Receipt()
        }
        
        func scan(_ item: SKU) {
            receipt.scannedItems.append(item)
        }
        
        func subtotal() -> Int {
            var total = 0
            for item in receipt.scannedItems {
                total += item.price()
            }
            return total
        }
        
        func total() -> Receipt {
            let currentReceipt = receipt
            receipt = Receipt()
            return currentReceipt
        }
        
    }
    
    
    
    class Store {
        let version = "0.1"
        func helloWorld() -> String {
            return "Hello world"
        }
    }
    
    
    

