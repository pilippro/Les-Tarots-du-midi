//
//  DonneScoreTableViewCell.swift
//  Les Tarots du midi
//
//  Created by Pilip Pro on 19/03/2018.
//

import UIKit
import LTDMapi

class DonneScoreTableViewCell: UITableViewCell {

    @IBOutlet private weak var firstPlayerScoreLabel: UILabel!
    @IBOutlet private weak var secondPlayerScoreLabel: UILabel!
    @IBOutlet private weak var thirdPlayerScoreLabel: UILabel!
    @IBOutlet private weak var fourthPlayerScoreLabel: UILabel!
    @IBOutlet private weak var fifthPlayerScoreLabel: UILabel!

    var donneScoreViewModel: DonneScoreViewModel? {
        didSet {
            firstPlayerScoreLabel.text = donneScoreViewModel?.score(ofPlayer: 0)
            firstPlayerScoreLabel.backgroundColor = firstPlayerScoreLabel.text?.first == "-" ? UIColor.red : UIColor.green
            secondPlayerScoreLabel.text = donneScoreViewModel?.score(ofPlayer: 1)
            secondPlayerScoreLabel.backgroundColor = secondPlayerScoreLabel.text?.first == "-" ? UIColor.red : UIColor.green
            thirdPlayerScoreLabel.text = donneScoreViewModel?.score(ofPlayer: 2)
            thirdPlayerScoreLabel.backgroundColor = thirdPlayerScoreLabel.text?.first == "-" ? UIColor.red : UIColor.green
            fourthPlayerScoreLabel.text = donneScoreViewModel?.score(ofPlayer: 3)
            fourthPlayerScoreLabel.backgroundColor = fourthPlayerScoreLabel.text?.first == "-" ? UIColor.red : UIColor.green
            fifthPlayerScoreLabel.text = donneScoreViewModel?.score(ofPlayer: 4)
            fifthPlayerScoreLabel.backgroundColor = fifthPlayerScoreLabel.text?.first == "-" ? UIColor.red : UIColor.green
        }
    }

}
