//
//  TotalScoreTableViewCell.swift
//  Les Tarots du midi
//
//  Created by Pilip Pro on 19/03/2018.
//

import UIKit
import LTDMapi

class TotalScoreTableViewCell: UITableViewCell {

    @IBOutlet private weak var firstPlayerScoreLabel: UILabel!
    @IBOutlet private weak var secondPlayerScoreLabel: UILabel!
    @IBOutlet private weak var thirdPlayerScoreLabel: UILabel!
    @IBOutlet private weak var fourthPlayerScoreLabel: UILabel!
    @IBOutlet private weak var fifthPlayerScoreLabel: UILabel!

    var totalScoreViewModel: TotalScoreViewModel? {
        didSet {
            firstPlayerScoreLabel.text = totalScoreViewModel?.score(ofPlayer: 0)
            secondPlayerScoreLabel.text = totalScoreViewModel?.score(ofPlayer: 1)
            thirdPlayerScoreLabel.text = totalScoreViewModel?.score(ofPlayer: 2)
            fourthPlayerScoreLabel.text = totalScoreViewModel?.score(ofPlayer: 3)
            fifthPlayerScoreLabel.text = totalScoreViewModel?.score(ofPlayer: 4)
        }
    }

}
