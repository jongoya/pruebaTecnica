//
//  GenericFunctions.swift
//  pruebaTecnica
//
//  Created by Mac Mini 5 on 12/1/23.
//

import UIKit

class GenericFunctions {
    static func setImage(character: CharacterModel, characterImage: UIImageView) {
        if  let imageString = character.imageString {
            let imageData = imageString.data(using: .utf8)
            characterImage.image = UIImage(data: imageData ?? Data())
        } else {
            if let imageUrl = URL(string: character.image) {
                characterImage.imageFromUrl(url: imageUrl) { imageString in
                    character.imageString = imageString
                }
            }
        }
    }
    
    static func formatCharacterDate(time: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        let date = dateFormatter.date(from: time) ?? Date()
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "yyyy-MM-dd"
        return dateFormatter2.string(from: date)
    }
}
