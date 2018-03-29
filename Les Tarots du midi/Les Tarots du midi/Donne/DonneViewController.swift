//
//  DonneViewController.swift
//  Les Tarots du midi
//
//  Created by Pilip Pro on 19/03/2018.
//

import UIKit
import LTDMapi

class DonneViewController: UIViewController {

    @IBOutlet private weak var preneurSegmentedControl: UISegmentedControl!
    @IBOutlet private weak var contratSegmentedControl: UISegmentedControl!
    @IBOutlet private weak var roiAppeleSegmentedControl: UISegmentedControl!
    @IBOutlet private weak var joueurAppeleSegmentedControl: UISegmentedControl!
    @IBOutlet private weak var petitSwitch: UISwitch!
    @IBOutlet private weak var excuseSwitch: UISwitch!
    @IBOutlet private weak var twentyOneSwitch: UISwitch!
    @IBOutlet private weak var scoreSlider: UISlider!
    @IBOutlet private weak var attaqueScoreLabel: UILabel!
    @IBOutlet private weak var defenseScoreLabel: UILabel!
    
    var donneViewModel = DonneViewModel() {
        didSet {
            setupView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        attaqueScoreLabel.text = String(Int(round(scoreSlider.value)))
        defenseScoreLabel.text = String(Int(round(scoreSlider.maximumValue - scoreSlider.value)))
        if preneurSegmentedControl != nil,
            contratSegmentedControl != nil,
            roiAppeleSegmentedControl != nil,
            joueurAppeleSegmentedControl != nil,
            petitSwitch != nil,
            excuseSwitch != nil,
            twentyOneSwitch != nil,
            scoreSlider != nil,
            attaqueScoreLabel != nil,
            defenseScoreLabel != nil {
            
            setupSegmentedControl()
        
            petitSwitch.isOn = donneViewModel.petitIsOwned
            excuseSwitch.isOn = donneViewModel.excuseIsOwned
            twentyOneSwitch.isOn = donneViewModel.twentyOneIsOwned
            
            scoreSlider.minimumValue = donneViewModel.scoreMinValue
            scoreSlider.maximumValue = donneViewModel.scoreMaxValue
            scoreSlider.value = donneViewModel.scoreValue
            
            attaqueScoreLabel.text = donneViewModel.attaqueScore
            defenseScoreLabel.text = donneViewModel.defenseScore
        }
    }
    
    func setupSegmentedControl() {
        preneurSegmentedControl.removeAllSegments()
        joueurAppeleSegmentedControl.removeAllSegments()
        for index in 0...(donneViewModel.nbPlayers - 1) {
            preneurSegmentedControl.insertSegment(withTitle: donneViewModel.players[index], at: index, animated: true)
            joueurAppeleSegmentedControl.insertSegment(withTitle: donneViewModel.players[index], at: index, animated: true)
        }
        
        contratSegmentedControl.removeAllSegments()
        for index in 0...(donneViewModel.nbContrat - 1) {
            contratSegmentedControl.insertSegment(withTitle: donneViewModel.contrat[index], at: index, animated: true)
        }
        
        roiAppeleSegmentedControl.removeAllSegments()
        for index in 0...(donneViewModel.nbColors - 1) {
            roiAppeleSegmentedControl.insertSegment(withTitle: donneViewModel.colors[index], at: index, animated: true)
        }
    }

    // MARK: - Actions

    @IBAction func preneurSegmentedControl(_ sender: Any) {
        // TODO
    }
    
    @IBAction func contratSegmentedControl(_ sender: Any) {
        // TODO
    }
    
    @IBAction func roiAppeleSegmentedControl(_ sender: Any) {
        // TODO
    }
    
    @IBAction func misereAtoutSegmentedControl(_ sender: Any) {
        // TODO
    }
    
    @IBAction func misereTeteSegmentedControl(_ sender: Any) {
        // TODO
    }
    
    @IBAction func poigneeSegmentedControl(_ sender: Any) {
        // TODO
    }
    
    @IBAction func doublePoigneeSegmentedControl(_ sender: Any) {
        // TODO
    }
    
    @IBAction func triplePoigneeSegmentedControl(_ sender: Any) {
        // TODO
    }
    
    @IBAction func joueurAppeleSegmentedControl(_ sender: Any) {
        // TODO
    }
    
    @IBAction func petitSwitchAction(_ sender: Any) {
        // TODO
    }

    @IBAction func excuseSwitchAction(_ sender: Any) {
        // TODO
    }

    @IBAction func twentyOneSwitchAction(_ sender: Any) {
        // TODO
    }
    
    @IBAction func scoreSlider(_ sender: Any) {
        attaqueScoreLabel.text = String(Int(round(scoreSlider.value)))
        defenseScoreLabel.text = String(Int(round(scoreSlider.maximumValue - scoreSlider.value)))
    }

    @IBAction func validateAction(_ sender: Any) {
        donneViewModel.computeScore()
        self.dismiss(animated: true, completion: nil)
    }

}
