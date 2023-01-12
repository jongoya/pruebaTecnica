//
//  RESTServices.swift
//  pruebaTecnica
//
//  Created by Mac Mini 5 on 11/1/23.
//

import Foundation

class RESTServices {
    lazy var conn: URLSession = {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config, delegate: nil, delegateQueue: nil)
        return session
    }()
    
    func getCharacters(url: String, completion: @escaping (_ result: CharacterServiceResponse?) -> Void) {
        if let urlValue = URL(string: url) {
            let request = NSMutableURLRequest(url: urlValue, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 60000)
            request.httpMethod = "GET"
            let task = conn.dataTask(with: request as URLRequest, completionHandler: { (data, _, error) -> Void in
                DispatchQueue.main.async {
                    if error != nil {
                        completion(nil)
                        return
                    }
                    
                    if let data = data {
                        let response: CharacterServiceResponse = try! JSONDecoder().decode(CharacterServiceResponse.self, from: data)
                        completion(response)
                    }
                }
            })
            task.resume()
        }
    }
}
