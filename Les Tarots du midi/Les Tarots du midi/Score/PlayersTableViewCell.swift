//
//  PlayersTableViewCell.swift
//  Les Tarots du midi
//
//  Created by Pilip Pro on 19/03/2018.
//

import UIKit
import LTDMapi

protocol PlayersTableViewCellDelegate: class {
    func playerButtonTapped(_ cell: PlayersTableViewCell, playerIndex: Int, playerName: String)
}

class PlayersTableViewCell: UITableViewCell {

    @IBOutlet private weak var firstPlayerButton: UIButton!
    @IBOutlet private weak var secondPlayerButton: UIButton!
    @IBOutlet private weak var thirdPlayerButton: UIButton!
    @IBOutlet private weak var fourthPlayerButton: UIButton!
    @IBOutlet private weak var fifthPlayerButton: UIButton!
    
    weak var delegate: PlayersTableViewCellDelegate?

    var playersViewModel = PlayersViewModel() {
        didSet {
            firstPlayerButton.setTitle(playersViewModel.firstPlayerName, for: .normal)
            secondPlayerButton.setTitle(playersViewModel.secondPlayerName, for: .normal)
            thirdPlayerButton.setTitle(playersViewModel.thirdPlayerName, for: .normal)
            fourthPlayerButton.setTitle(playersViewModel.fourthPlayerName, for: .normal)
            fifthPlayerButton.setTitle(playersViewModel.fifthPlayerName, for: .normal)
        }
    }

    // MARK: - Actions

    @IBAction func firstPlayerButtonTapped(_ sender: Any) {
        //swiftlint:disable:next force_unwrapping
        delegate?.playerButtonTapped(self, playerIndex: 0, playerName: (firstPlayerButton.titleLabel?.text)!)
    }

    @IBAction func secondPlayerButtonTapped(_ sender: Any) {
        //swiftlint:disable:next force_unwrapping
        delegate?.playerButtonTapped(self, playerIndex: 1, playerName: (secondPlayerButton.titleLabel?.text)!)
    }

    @IBAction func thirdPlayerButtonTapped(_ sender: Any) {
        //swiftlint:disable:next force_unwrapping
        delegate?.playerButtonTapped(self, playerIndex: 2, playerName: (thirdPlayerButton.titleLabel?.text)!)
    }

    @IBAction func fourthPlayerButtonTapped(_ sender: Any) {
        //swiftlint:disable:next force_unwrapping
        delegate?.playerButtonTapped(self, playerIndex: 3, playerName: (fourthPlayerButton.titleLabel?.text)!)
    }

    @IBAction func fifthPlayerButtonTapped(_ sender: Any) {
        //swiftlint:disable:next force_unwrapping
        delegate?.playerButtonTapped(self, playerIndex: 4, playerName: (fifthPlayerButton.titleLabel?.text)!)
    }

}
