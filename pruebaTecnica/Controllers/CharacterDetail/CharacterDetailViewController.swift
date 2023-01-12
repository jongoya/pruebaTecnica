//
//  CharacterDetailViewController.swift
//  pruebaTecnica
//
//  Created by Mac Mini 5 on 11/1/23.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var characterStatusView: UIView!
    @IBOutlet weak var characterStatusLabel: UILabel!
    @IBOutlet weak var lastKnownLocationLabel: UILabel!
    @IBOutlet weak var firstSeenLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var createdLabel: UILabel!
    @IBOutlet weak var contentView: UIView!
    
    var character: CharacterModel!
    var presenter: CharacterDetailPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = CharacterDetailPresenter(controller: self)
        customizeViews()
        setCharacterData()
    }
    
    private func customizeViews() {
        contentView.layer.cornerRadius = 10
        contentView.elevate(elevation: 1.5)
        characterStatusView.layer.cornerRadius = 5
    }
    
    private func setCharacterData() {
        GenericFunctions.setImage(character: character, characterImage: characterImage)
        characterName.text = character.name
        characterStatusLabel.text = "\(character.status) - \(character.species)"
        characterStatusView.setStatusColor(status: character.status)
        lastKnownLocationLabel.text = character.location.name
        firstSeenLabel.text = character.origin.name
        genderLabel.text = character.gender
        createdLabel.text = GenericFunctions.formatCharacterDate(time: character.created)
    }
    
    @IBAction func didClickBackButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
