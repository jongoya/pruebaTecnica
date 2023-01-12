//
//  CharacterModel.swift
//  pruebaTecnica
//
//  Created by Mac Mini 5 on 11/1/23.
//

import Foundation

class CharacterModel: Codable {
    var id: Int = 0
    var name: String = ""
    var status: String = ""
    var species: String = ""
    var type: String = ""
    var gender: String = ""
    var origin: OriginModel!
    var location: LocationModel!
    var image: String = ""
    var episode: [String] = []
    var url: String = ""
    var created: String = ""
    var imageString: String?
}
