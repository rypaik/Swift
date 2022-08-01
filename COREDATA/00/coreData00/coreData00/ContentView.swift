//
//  ContentView.swift
//  coreData00
//
//  Created by Jeen Byun on 7/18/22.
//https://www.youtube.com/watch?v=_GJlFk-Hhz8&ab_channel=Rebeloper-RebelDeveloper

import SwiftUI
import CoreData

struct ContentView: View {
//    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.managedObjectContext) private var managedObjectContext
    
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
    
    @FetchRequest(
        entity: Item.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.name, ascending: true)],
        predicate: NSPredicate(format: "name = %@", "Shirt"))
    var items: FetchedResults<Item>
    
    @FetchRequest(
        entity: Category.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Category.name, ascending: true)],
    var categories: FetchedResults<Category>

        
    @State private var isActionSheetPresented = false
    @State private var isAlertPresented = false
    var body: some View {
        VStack {
            Button(action: {
                
            }, label: {
                Text("Add Category")
            })
            
            Button(action: {
                if categories.count == 0 {
                    isAlertPresented.toggle()
                } else {
                    isActionSheetPresented.toggle()
                }
            }, label: {
                Text("Add Item")
            })
            .actionSheet(isPresented: $isActionSheetPresented, content:{
                var buttons = [ActionSheet.Button]()
                categories.forEach{ (Category) in
                //28:04
                }
                
            })
            
            List {
                ForEach( items, id:\.self) { item in
                    Text("\(item.name ?? "Unknown")")
                }
                
            }
            
//        NavigationView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//                    } label: {
//                        Text(item.timestamp!, formatter: itemFormatter)
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
