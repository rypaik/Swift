//
//  File.swift
//  OBJECT_STATE
//
//  Created by Jeen Byun on 6/24/22.
//
//
// WORKING:

// https://youtu.be/-yjKAb0Pj60?t=1614
import SwiftUI
//
// Changing binded Struct List Program to Classes

// Using a struct you can't change values in .username, .password, emailAddress
//
//
//requures : Identifiable to make it addressable with @State wrapper later in Program
struct FruitMultiModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let count: Int
}

class FruitViewMultiModel: ObservableObject {
    @Published var fruitMultiArray: [FruitMultiModel] = []  // Allows Structure to make data tracked for changes
    @Published var isLoading: Bool = false
    
    // Init in class to prevent repeat data every time you load a screen with .onAppear
    init() {
        getFruits()
    }
    
    func getFruits(){
        let fruit1 = FruitMultiModel(name: "Orange", count: 20)
        let fruit2 = FruitMultiModel(name: "Banana", count: 25)
        let fruit3 = FruitMultiModel(name: "Watermelon", count: 30)
        
        // simulating database loadtime
        // execution code of DispatchQueue
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.fruitMultiArray.append(fruit1)
            self.fruitMultiArray.append(fruit2)
            self.fruitMultiArray.append(fruit3)
            self.isLoading = false
        }
    }
    func deleteMultiFruit(index: IndexSet){
            fruitMultiArray.remove(atOffsets: index)
    }
}

struct TwoWayMultiBindClassView : View {
//    @State var fruitMultiArray: [FruitMultiModel] = [
//        FruitMultiModel(name: "Apples", count: 5)
//    ]
    
    // now accessing teh fruitArray declared in Class - that has @Published wrapper
    // var FruitViewModel is class type FruitViewModel = Instantiation of FruitViewModel()
    // Make class definintion - ObservableObject
    // @ObservedObject var fruitViewModel: FruitViewModel = FruitViewModel()
    // Use @ObservedObject -> USE THIS FOR SUBVIEWS
    
    // Use @StateObject -> USE THIS ON CREATION / INIT
    // @StateObject -> Trying to make the data persist as View reloads
    // Same as @ObservedObject but has persistent data *********
    
     
//    @ObservedObject var fruitViewMultiModel: FruitViewMultiModel = FruitViewMultiModel()
    @StateObject var fruitViewMultiModel: FruitViewMultiModel = FruitViewMultiModel()
    var body: some View {
        NavigationView {
            List {
                if fruitViewMultiModel.isLoading {
                    ProgressView()
                } else {
                    ForEach(fruitViewMultiModel.fruitMultiArray) { fruitmulti in
                        HStack {
                            Text("\(fruitmulti.id)")
                            Text("\(fruitmulti.count)")
                                .foregroundColor(.red)
                            Text(fruitmulti.name)
                                .font(.headline)
                                .bold()
                        }
                    }
                    // List Property - Builtin list Delete option
                    .onDelete(perform: fruitViewMultiModel.deleteMultiFruit)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Fruit List")
            .navigationBarItems(trailing:
                                NavigationLink(
                                    // asking for destination bevuase of @observedOject var
                                    // creating it with @StateObject and now passing into NextScreen)
                                    // that object is an @ObservedObject in nextscreen ( after passin)
                                    destination: NextScreen(fruitViewMultiModel: fruitViewMultiModel),
                                    label: {
                                    Image(systemName: "arrow.right")
                                            .font(.title)
                                    })
            )
            
            // this will create repeat items when List Screen is called
            // make init in class
//            .onAppear {
//                fruitViewMultiModel.getFruits()
            }
        }
    }


struct NextScreen: View {
    // Back Action for button to navigate back
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var fruitViewMultiModel: FruitViewMultiModel
    
    var body: some View {
        ZStack{
            Color.green.ignoresSafeArea()
// this was taken out for dynamic processing of fruitViewMultiModel on NextScreen()
//            Button(action:{
//                presentationMode.wrappedValue.dismiss()
//            }, label: {
//                Text("GO BACK")
//                    .foregroundColor(.white)
//                    .font(.largeTitle)
//                    .fontWeight(.semibold)
//            })
            VStack {
                ForEach(fruitViewMultiModel.fruitMultiArray) { fruitMulti2 in
                    Text(fruitMulti2.name)
                        .foregroundColor(.white)
                        .font(.headline)
                }
            }
        }
    }
}
