//: [Previous](@previous)
/*:
 
 [Stop Using MVVM](https://developer.apple.com/forums/thread/699003)


 */

//: MVVM
//import Foundation
//
//// Service Object
//class ShoppingWS {
//    // Singleton
//    static let shared = ShoppingWS()
//
//    // Task
//    func request<T>(...) async throws -> T {...}
//}
//
//// Object
//struct Product: Identifiable, Codable {
//    let id: String
//    let name: String
//    let description: String
//    let price: Double
//    let image: URL
//
//    // Support Object
//    struct Review {
//        let comment: String
//        let stars: Int
//    }
//
//    // Dependency
//    var reviews: [Review] { get async throws }
//
//    // Tasks
//    func addToWishlist() async throws {...}
//    func removeFromWishlist() async throws {...}
//    func purchase(quantity: Int) async throws {...}
//    func review(_ review: Review) async throws {...}
//
//    // Factory
//    static var all: [Product] { get async throws }
//    static var wishlist: [Product] { get async throws }
//    static var purchases: [Product] { get async throws }
//}
//
//extension Notification.Name {
//    // Observer
//    static let productDidChange = Notification.Name("ProductDidChangeNotification")
//}



//: SWIFTUI
import SwiftUI

// Model (Data & Logic), 00P / POP
struct Product {
    func purchase() async { }
    static var all: [Product] { get async }
}

// ViewModelss (UI)
struct ProductList: View {
    @State private var products: [Product] = []
    @State private var search: String = ""
    
    var body: some View {
        VStack {
            // Product list
            // User can search products and open product detail
        }
        .task {
            products = await Product.all
        }
    }
}

struct ProductView: View {
    let product: Product
    
    var body: some View {
        VStack {
            // Product detail
            // User can purchase product
        }
    }
}


//:


import SwiftUI
// Model (Data & Logic), 00P / POP
struct Product {
    func purchase() async { }
    static var all: [Product] { get async }
}

// ViewModels (UI)
class ProductListVM: ObservableObject {
    @Published var products: [Product] = []
    @Published var search: String
    // Can't use GestureState, FocusState, Environment, FetchRequest,
    // Changing one property will invalidate the object at all

    func loadProducts () async {
        products = await Product.all
    }
}

class ProductViewVM: ObservableObject {
    let product: Product
    
    func purchaseProduct() { }
}

// Views (UI)
struct ProductList: View {
    @StateObject private var viewModel = ProductListVM()

    var body: some View {
        VStack {
            // Product list
            // User can search products and open product detail
        }
        .task {
            async viewModel.loadProducts()
        }
    }
}

struct ProductView: View {
    @StateObject var viewModel: ProductViewVM

    var body: some View {
        VStack {
            // Product detail
            // User can purchase product
        }
    }
}







//: [Next](@next)
