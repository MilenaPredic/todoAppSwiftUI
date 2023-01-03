//
//  TodoItemDetailsView.swift
//  TODO_SwiftUI
//
//  Created by Milena Predic on 3.1.23..
//

import SwiftUI



struct TodoItemDetailsView: View {
    @State var title: String
    var body: some View {
        Text(title)
    }
}

struct TodoItemDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemDetailsView(title: "Test")
    }
}
