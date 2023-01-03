//
//  ContentView.swift
//  TODO_SwiftUI
//
//  Created by Milena Predic on 3.1.23..
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var todoListVM = TodoListViewModel()
    var body: some View {
        NavigationView {
            VStack {
                
                List(todoListVM.todoItems) { todoItem in
                    NavigationLink(destination: TodoItemDetailsView(title: todoItem.title)) {
                        if todoItem.completed == true {
                            Text(todoItem.title)
                                .strikethrough()
                        } else {
                            Text(todoItem.title)
                        }
                    }
                }
            }.onAppear {
                todoListVM.populateTodos()
            }
            .navigationTitle("TODOS")
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
