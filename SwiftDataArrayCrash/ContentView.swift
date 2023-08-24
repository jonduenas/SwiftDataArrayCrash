//
//  ContentView.swift
//  SwiftDataArrayCrash
//
//  Created by Jon Duenas on 8/24/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        VStack {
                            Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))

                            ForEach(item.child.times, id: \.self) { time in
                                Text(time.formatted())
                            }
//                            ForEach(item.times, id: \.self) { time in
//                                Text(time.formatted())
//                            }
                        }
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(
                timestamp: Date(),
                child: .init(times: [41, 42, 43])
            )
//            let newItem = Item(
//                timestamp: Date(),
//                times: [41, 42, 43]
//            )
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
