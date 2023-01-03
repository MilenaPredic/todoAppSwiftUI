//
//  TodoListViewModel.swift
//  TODO_SwiftUI
//
//  Created by Milena Predic on 3.1.23..
//

import Foundation

class TodoListViewModel: ObservableObject {
    
    @Published var todoItems = [TodoItemViewModal]()
    
    func populateTodos() {
        
        WebService().getAllTodos(url: Constants.Urls.allTodosURL) { result in
            
            switch result {
            case .success(let todos):
                DispatchQueue.main.async {
                    self.todoItems = todos.map(TodoItemViewModal.init)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

struct TodoItemViewModal: Identifiable {
    
    let id = UUID()
    
    private let todo: Todo
    
    init(todo: Todo) {
        self.todo = todo
    }
    
    var title: String {
        todo.title
    }
    
    var completed: Bool {
        todo.completed
    }
}
