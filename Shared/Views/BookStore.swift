//
//  BookStore.swift
//  100Days
//
//  Created by 叶思凡 on 2022/4/1.
//

import CoreData
import SwiftUI

struct BookStore: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var books: FetchedResults<Book>

    @State private var name = ""
    @State private var showingAddScreen = false

    var body: some View {
        List(books) { student in
            NavigationLink {
                VStack {
                    Text(student.id?.uuidString ?? "Unknown")
                    Text(student.name ?? "Unknown")
                }
            }label: {
                Text(student.name ?? "Unknown")
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showingAddScreen.toggle()
                } label: {
                    Label("Add Book", systemImage: "plus")
                }
            }
        }
        .sheet(isPresented: $showingAddScreen) {
            Form {
                Section {
                    TextField("name", text: $name)
                } header: {
                     Text("set name")
                }
                Button("Add") {
                    let student = Book(context: moc)
                    student.id = UUID()
                    student.name = name
                    try? moc.save()
                    showingAddScreen = false
                }
            }

        }
        .navigationTitle("BookStore")
    }
}

struct BookStore_Previews: PreviewProvider {
    static var previews: some View {
        BookStore()
    }
}
