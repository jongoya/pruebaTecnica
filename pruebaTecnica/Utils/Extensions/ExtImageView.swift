//
//  ExtImageView.swift
//  pruebaTecnica
//
//  Created by Mac Mini 5 on 11/1/23.
//

import UIKit

extension UIImageView {
    func imageFromUrl(url: URL, completion: @escaping (_ imageString: String?) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, _, _) in
            if let data = data {
                DispatchQueue.main.async {
                    if self != nil {
                        self!.image = UIImage(data: data)
                        let imageString = String(data: data, encoding: .utf8)
                        completion(imageString)
                    }
                    
                    completion(nil)
                }
            }
        }
        
        dataTask.resume()
    }
}
