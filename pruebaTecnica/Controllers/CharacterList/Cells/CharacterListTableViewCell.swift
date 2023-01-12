//
//  CharacterListTableViewCell.swift
//  pruebaTecnica
//
//  Created by Mac Mini 5 on 11/1/23.
//

import UIKit

class CharacterListTableViewCell: UITableViewCell {
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var characterStatus: UILabel!
    @IBOutlet weak var characterView: UIView!
    @IBOutlet weak var statusColorView: UIView!
    
    func setupCell(character: CharacterModel) {
        selectionStyle = .none
        customizeFields()
        setContentView(character: character)
        statusColorView.setStatusColor(status: character.status)
    }
    
    private func customizeFields() {
        characterView.elevate(elevation: 1.5)
        characterView.layer.cornerRadius = 10
        characterImage.roundCorners(corners: [.topLeft, .bottomLeft], radius: 10)
        statusColorView.layer.cornerRadius = 5
    }
    
    private func setContentView(character: CharacterModel) {
        characterName.text = character.name
        characterStatus.text = "\(character.status) - \(character.species)"
        GenericFunctions.setImage(character: character, characterImage: characterImage)
    }
}
