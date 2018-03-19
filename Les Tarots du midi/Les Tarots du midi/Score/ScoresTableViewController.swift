//
//  ScoresTableViewController.swift
//  Les Tarots du midi
//
//  Created by Pilip Pro on 19/03/2018.
//

import UIKit
import LTDMapi

class ScoresTableViewController: UITableViewController {

    var scoresViewModel = ScoresViewModel() {
        didSet {
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // one row for players
        // one row for total scores
        // one row for each "donne"
        return 2 + scoresViewModel.numberOfDonnes
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            //swiftlint:disable:next force_unwrapping
            let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.playersTableViewCell, for: indexPath)!
            cell.playersViewModel = scoresViewModel.playerViewModel()
            cell.delegate = self
            return cell
        } else if indexPath.row == 1 {
            //swiftlint:disable:next force_unwrapping
            let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.totalScoreTableViewCell, for: indexPath)!
            cell.totalScoreViewModel = scoresViewModel.totalScoreViewModel()
            return cell
        } else {
            //swiftlint:disable:next force_unwrapping
            let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.donneScoreTableViewCell, for: indexPath)!
            cell.donneScoreViewModel = scoresViewModel.donneScoreViewModel(at: indexPath.row)
            return cell
        }
    }

    // MARK: - Actions

    @IBAction func resetScores(_ sender: Any) {
        scoresViewModel.resetScores()
    }
    
    @IBAction func new(_ sender: Any) {
        let alertController = UIAlertController(title: nil,
                                                message: nil,
                                                preferredStyle: .alert)
        
        let newDonne = UIAlertAction(title: "Nouvelle donne", style: .default) { (_) in
            //swiftlint:disable:next force_unwrapping
            let newDonneVC = R.storyboard.main.donneViewController()!
            newDonneVC.donneViewModel = self.scoresViewModel.donneViewModel()
            self.present(newDonneVC, animated: true, completion: nil)
        }
        alertController.addAction(newDonne)
        
        let wrongDonne = UIAlertAction(title: "Fausse donne", style: .default) { (_) in
            //swiftlint:disable:next force_unwrapping
            let fausseDonneVC = R.storyboard.main.fausseDonneViewController()!
            self.present(fausseDonneVC, animated: true, completion: nil)
        }
        alertController.addAction(wrongDonne)
        
        let cancel = UIAlertAction(title: "Annuler", style: .cancel, handler: nil)
        alertController.addAction(cancel)
        
        present(alertController, animated: true)

    }
    
}

extension ScoresTableViewController: PlayersTableViewCellDelegate {
    
    func playerButtonTapped(_ cell: PlayersTableViewCell, playerIndex: Int, playerName: String) {
        let alertController = UIAlertController(title: "Modifier le nom du joueur n°" + String(playerIndex + 1),
                                                message: nil,
                                                preferredStyle: .alert)
        
        alertController.addTextField { (textfield) in
            textfield.placeholder = playerName
        }
        
        let ok = UIAlertAction(title: "OK", style: .default) { (_) in
            let playerName = alertController.textFields?.first?.text
            if playerName != "" {
                // TODO Save player name at index
            }
        }
        alertController.addAction(ok)
        
        let cancel = UIAlertAction(title: "Annuler", style: .cancel, handler: nil)
        alertController.addAction(cancel)
        
        present(alertController, animated: true, completion: nil)
    }
    
}
