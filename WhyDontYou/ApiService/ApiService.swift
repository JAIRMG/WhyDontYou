//
//  ApiService.swift
//  WhyDontYou
//
//  Created by Jair Moreno Gaspar on 06/11/18.
//  Copyright © 2018 Jair Moreno Gaspar. All rights reserved.
//

import UIKit


class APiService: NSObject {
    static let sharedInstance = APiService()
    
    
    func fetchForUrlString(urlString: String, completion: @escaping ([Video]) -> ()) {
        
        
        let todoEndpoint: String = urlString
        guard let url = URL(string: todoEndpoint) else {
            print("Error: cannot create URL")
            return
        }
        
        var urlRequest = URLRequest(url: url)
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        urlRequest.httpMethod = "GET"
        
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            
            guard let data = data else { return }
            
            do {
                
                guard let videos = try? JSONDecoder().decode([Video].self, from: data) else {
                    print("Error al parsear")
                    return
                }
                
                DispatchQueue.main.async {
                    completion(videos)
                }
                
            }
        }
        task.resume()
        
    }
    
}
