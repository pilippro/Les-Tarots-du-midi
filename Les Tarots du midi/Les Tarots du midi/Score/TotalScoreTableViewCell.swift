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

    var totalScoreViewModel = TotalScoreViewModel() {
        didSet {
            firstPlayerScoreLabel.text = totalScoreViewModel.firstPlayerScore
            secondPlayerScoreLabel.text = totalScoreViewModel.secondPlayerScore
            thirdPlayerScoreLabel.text = totalScoreViewModel.thirdPlayerScore
            fourthPlayerScoreLabel.text = totalScoreViewModel.fourthPlayerScore
            fifthPlayerScoreLabel.text = totalScoreViewModel.fifthPlayerScore
        }
    }

}
