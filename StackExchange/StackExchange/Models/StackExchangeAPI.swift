//
//  StackExchangeAPI.swift
//  StackExchange
//
//  Created by Tim Parmentier on 9/25/20.
//

import Foundation


class StackExchangeAPI {
    
    func loadQuestions(url: URL, completion: @escaping ([Question]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let response = try? JSONDecoder().decode(Questions.self, from: data)
            if let response = response {
                DispatchQueue.main.async {
                    completion(response.items)
                }
                
            }
            
        }.resume()
        
    }

}
