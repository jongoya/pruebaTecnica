//
//  CharacterServiceResponse.swift
//  pruebaTecnica
//
//  Created by Mac Mini 5 on 11/1/23.
//

import Foundation

class CharacterServiceResponse: Codable {
    var info: InfoModel!
    var results: [CharacterModel] = []
}
