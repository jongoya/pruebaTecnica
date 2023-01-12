//
//  ViewController.swift
//  pruebaTecnica
//
//  Created by Mac Mini 5 on 11/1/23.
//

import UIKit

class CharacterListViewController: UIViewController {
    @IBOutlet weak var characterTableView: UITableView!
    
    private var characters: [CharacterModel] = []
    private var presenter: CharacterListPresenter!
    private var isLoadingCharacters: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = CharacterListPresenter(controller: self)
        navigationController?.isNavigationBarHidden = true
        customizeViews()
        getCharacters()
    }
    
    private func customizeViews() {
        characterTableView.backgroundColor = UIColor(named: "darkGrey")
        characterTableView.separatorStyle = .none
    }
    
    private func getCharacters() {
        showProgress(onView: view)
        isLoadingCharacters = true
        presenter.getCharacters { characters in
            self.hideProgress()
            self.characters.append(contentsOf: characters)
            self.characterTableView.reloadData()
            self.isLoadingCharacters = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            if let controller: CharacterDetailViewController = segue.destination as? CharacterDetailViewController {
                controller.character = sender as? CharacterModel
            }
        }
    }
}

extension CharacterListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CharacterListTableViewCell = tableView.dequeueReusableCell(withIdentifier: "characterCell") as? CharacterListTableViewCell ?? CharacterListTableViewCell(style: .default, reuseIdentifier: "characterCell")
        cell.setupCell(character: characters[indexPath.row])
        
        if indexPath.row == characters.count - 1  && !isLoadingCharacters {
            getCharacters()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailSegue", sender: characters[indexPath.row])
    }
}
