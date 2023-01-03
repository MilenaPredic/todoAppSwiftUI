//
//  WebService.swift
//  TODO_SwiftUI
//
//  Created by Milena Predic on 3.1.23..
//

import SwiftUI

enum NetworkingError: Error {
    case decodingError
    case badRequest
}

class WebService {
    
    func getAllTodos(url: URL, completion: @escaping(Result<[Todo], NetworkingError>) -> Void) {
        
        URLSession.shared.dataTask(with: url) {data, respons, error in
            
            guard let data = data, error == nil,
                  (respons as? HTTPURLResponse)?.statusCode == 200 else {
                completion(.failure(.badRequest))
                return
            }
            
            let todos = try? JSONDecoder().decode([Todo].self, from: data)
            
            completion(.success(todos ?? []))
            
        }.resume()
    }
}
