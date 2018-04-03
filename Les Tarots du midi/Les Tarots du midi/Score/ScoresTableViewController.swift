//
//  ScoresTableViewController.swift
//  Les Tarots du midi
//
//  Created by Pilip Pro on 19/03/2018.
//

import UIKit
import LTDMapi

class ScoresTableViewController: UITableViewController {

    var scoresViewModel = ScoresViewModel()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
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
            cell.donneScoreViewModel = scoresViewModel.donneScoreViewModel(at: indexPath.row - 2)
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row >= 2 {
            performSegue(withIdentifier: R.segue.scoresTableViewController.donneSegueIdentifier, sender: indexPath.row)
        }
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return indexPath.row >= 2
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Supprimer") { _, indexPath in
            self.scoresViewModel.removeDonne(at: indexPath.row - 2)
            self.tableView.reloadData()
        }
        return [deleteAction]
    }

    // MARK: - Actions

    @IBAction func resetScores(_ sender: Any) {
        scoresViewModel.resetScores()
        tableView.reloadData()
    }
    
    @IBAction func new(_ sender: Any) {
        let alertController = UIAlertController(title: nil,
                                                message: nil,
                                                preferredStyle: .alert)
        
        let newDonne = UIAlertAction(title: "Nouvelle donne", style: .default) { (_) in
            self.performSegue(withIdentifier: R.segue.scoresTableViewController.donneSegueIdentifier, sender: nil)
        }
        alertController.addAction(newDonne)
        
        let wrongDonne = UIAlertAction(title: "Fausse donne", style: .default) { (_) in
            self.performSegue(withIdentifier: R.segue.scoresTableViewController.fausseDonneSegueIdentifier, sender: nil)
        }
        alertController.addAction(wrongDonne)
        
        let cancel = UIAlertAction(title: "Annuler", style: .cancel, handler: nil)
        alertController.addAction(cancel)
        
        present(alertController, animated: true)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let destination = R.segue.scoresTableViewController.donneSegueIdentifier(segue: segue)?.destination {
            if let index = sender as? Int {
                destination.donneViewModel = scoresViewModel.donneViewModel(at: index - 2)
            } else {
                destination.donneViewModel = scoresViewModel.donneViewModel(at: nil)
            }
        } else if let destination = R.segue.scoresTableViewController.fausseDonneSegueIdentifier(segue: segue)?.destination {
            print(destination)
        }
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
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            if let playerName = alertController.textFields?.first?.text,
                playerName != "" {
                self.scoresViewModel.joueur(atIndex: playerIndex, changeNameTo: playerName)
                self.tableView.reloadData()
            }
        }
        alertController.addAction(okAction)
        
        let cancel = UIAlertAction(title: "Annuler", style: .cancel, handler: nil)
        alertController.addAction(cancel)
        
        present(alertController, animated: true, completion: nil)
    }
    
}
