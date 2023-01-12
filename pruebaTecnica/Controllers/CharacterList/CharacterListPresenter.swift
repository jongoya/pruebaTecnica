//
//  CharacterListPresenter.swift
//  pruebaTecnica
//
//  Created by Mac Mini 5 on 11/1/23.
//

import Foundation

class CharacterListPresenter {
    private var controller: CharacterListViewController!
    private var characterUrl: String = ""
    
    init(controller: CharacterListViewController) {
        self.controller = controller
        self.characterUrl = "https://rickandmortyapi.com/api/character"
    }
    
    func getCharacters(completion: @escaping (_ result: [CharacterModel]) -> Void) {
        if characterUrl == "" {
            completion([])
            return
        }
        print("(URL) --> \(characterUrl)")
        RESTServices().getCharacters(url: characterUrl) { result in
            if let result = result {
                self.characterUrl = result.info.next != nil ? result.info.next! : ""
                completion(result.results)
            } else {
                completion([])
            }
        }
    }
}
