//
//  File.swift
//  OBJECT_STATE
//
//  Created by Jeen Byun on 6/24/22.
//

import SwiftUI
// STATUS: WORKING
// struct calling with two way binding

struct FruitModelStruct: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let count: Int
}

struct TwoBindStructView: View {
    @State var fruitArrayStruct: [FruitModelStruct] = []
    
    var body: some View {
        NavigationView {
            List {
                ForEach(fruitArrayStruct) { fruitsingle in
                    HStack {
                        //Str typecasting
                        Text("\(fruitsingle.id)")
                            .foregroundColor(.blue)
                        Text("\(fruitsingle.count)")
                            .foregroundColor(.red)
                        Text(fruitsingle.name)
                            .font(.headline)
                            .bold()
                    }
                }
                .onDelete(perform: deleteFruit)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Fruit List")
            .onAppear {
                getFruits()
            }
        }
        func getFruits() {
            let fruit1 = FruitModelStruct(name: "Orange", count: 10)
            let fruit2 = FruitModelStruct(name: "Bananas", count: 15)
            let fruit3 = FruitModelStruct(name: "Raspberry", count: 20)
            
            fruitArrayStruct.append(fruit1)
            fruitArrayStruct.append(fruit2)
            fruitArrayStruct.append(fruit3)
        }
    
        func deleteFruit( index: IndexSet) {
            fruitArrayStruct.remove(atOffsets: index)
        }
}
    
   







// Using a struct you can't change values in .username, .password, emailAddress
//

//struct FruitModel: Identifiable {
//    let id: String = UUID().uuidString
//    let name: String
//    let count: Int
//}
//
//struct TwoWayBindView : View {
//    @State var fruitArray: [FruitModel] = [
//        FruitModel(name: "Apples", count: 5)
//    ]
//    var body: some View {
//        NavigationView {
//            List {
//                ForEach(fruitArray) { fruit in
//                    HStack {
//                        Text("\(fruit.id)")
//                        Text("\(fruit.count)")
//                            .foregroundColor(.red)
//                        Text(fruit.name)
//                            .font(.headline)
//                            .bold()
//                    }
//                }
//                // List Property - Builtin list Delete option
//                .onDelete(perform: deleteFruit)
//            }
//            .listStyle(GroupedListStyle())
//            .navigationTitle("Fruit List")
//            .onAppear {
//                getFruits()
//            }
//        }
//    }
//                          
//    func getFruits(){
//        let fruit1 = FruitModel(name: "Orange", count: 15)
//        let fruit2 = FruitModel(name: "Banana", count: 2)
//        let fruit3 = FruitModel(name: "Watermelon", count: 3)
//        
//        fruitArray.append(fruit1)
//        fruitArray.append(fruit2)
//        fruitArray.append(fruit3)
//        
//    }
//    
//    func deleteFruit(index: IndexSet){
//        fruitArray.remove(atOffsets: index)
//    }
//}
