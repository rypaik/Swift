//
//  File.swift
//  OBJECT_STATE
//
//  Created by Jeen Byun on 6/24/22.
//

// WORKING:
import SwiftUI

// Changing binded Struct List Program to Classes

// Using a struct you can't change values in .username, .password, emailAddress
//

//requures : Identifiable to make it addressable with @State wrapper later in Program
struct FruitModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let count: Int
}

class FruitViewModel: ObservableObject {
    @Published var fruitArray: [FruitModel]=[]
    
    func getFruits(){
        let fruit1 = FruitModel(name: "Orange", count: 15)
        let fruit2 = FruitModel(name: "Banana", count: 2)
        let fruit3 = FruitModel(name: "Watermelon", count: 3)
        
        // simulating database loadtime
        // execution code of DispatchQueue
            self.fruitArray.append(fruit1)
            self.fruitArray.append(fruit2)
            self.fruitArray.append(fruit3)
        }
    
    func deleteFruit(index: IndexSet){
        fruitArray.remove(atOffsets: index)
    }
}

struct TwoWayBindClassView : View {
//    @State var fruitArray: [FruitModel] = [
//        FruitModel(name: "Apples", count: 5)
//    ]
    
    // now accessing teh fruitArray declared in Class - that has @Published wrapper
    // var FruitViewModel is class type FruitViewModel = Instantiation of FruitViewModel()
    // Make class definintion - ObservableObject
    // @ObservedObject var fruitViewModel: FruitViewModel = FruitViewModel()
    // Use @ObservedObject -> USE THIS FOR SUBVIEWS
    
    // Use @StateObject -> USE THIS ON CREATION / INIT
    // @StateObject -> Trying to make the data persist as View reloads
    // Same as @ObservedObject but has persistent data *********
    
    @ObservedObject var fruitViewModel: FruitViewModel = FruitViewModel()
    var body: some View {
        NavigationView {
            List {
                    ForEach(fruitViewModel.fruitArray) { fruit in
                        HStack {
                            Text("\(fruit.id)")
                            Text("\(fruit.count)")
                                .foregroundColor(.red)
                            Text(fruit.name)
                                .font(.headline)
                                .bold()
                        }
                    }
                // List Property - Builtin list Delete option
                .onDelete(perform: fruitViewModel.deleteFruit)
            }
            .onAppear {
                fruitViewModel.getFruits()
            }
        }
    }
}



