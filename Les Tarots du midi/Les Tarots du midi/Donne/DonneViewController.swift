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
    @IBOutlet private weak var chelemSwitch: UISwitch!
    @IBOutlet private weak var roiAppeleSegmentedControl: UISegmentedControl!
    @IBOutlet private weak var poigneeSwitch: UISwitch!
    @IBOutlet private weak var doublePoigneeSwitch: UISwitch!
    @IBOutlet private weak var triplePoigneeSwitch: UISwitch!
    @IBOutlet private weak var joueurAppeleSegmentedControl: UISegmentedControl!
    @IBOutlet private weak var petitSwitch: UISwitch!
    @IBOutlet private weak var excuseSwitch: UISwitch!
    @IBOutlet private weak var twentyOneSwitch: UISwitch!
    @IBOutlet private weak var petitAuBoutSegmentedControl: UISegmentedControl!
    @IBOutlet private weak var scoreSlider: UISlider!
    @IBOutlet private weak var attaqueScoreLabel: UILabel!
    @IBOutlet private weak var defenseScoreLabel: UILabel!
    
    var donneViewModel: DonneViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        setupSegmentedControl()
    
        petitSwitch.isOn = donneViewModel.petitIsOwned
        excuseSwitch.isOn = donneViewModel.excuseIsOwned
        twentyOneSwitch.isOn = donneViewModel.twentyOneIsOwned
        
        chelemSwitch.isOn = donneViewModel.chelem
        
        poigneeSwitch.isOn = donneViewModel.poignee
        doublePoigneeSwitch.isOn = donneViewModel.doublePoignee
        triplePoigneeSwitch.isOn = donneViewModel.triplePoignee
        
        scoreSlider.minimumValue = donneViewModel.scoreMinValue
        scoreSlider.maximumValue = donneViewModel.scoreMaxValue
        scoreSlider.value = donneViewModel.scoreValue
        
        attaqueScoreLabel.text = donneViewModel.attaqueScore
        defenseScoreLabel.text = donneViewModel.defenseScore
    }
    
    func setupSegmentedControl() {
        preneurSegmentedControl.removeAllSegments()
        joueurAppeleSegmentedControl.removeAllSegments()
        for index in 0..<donneViewModel.nbPlayers {
            preneurSegmentedControl.insertSegment(withTitle: donneViewModel.players[index], at: index, animated: true)
            joueurAppeleSegmentedControl.insertSegment(withTitle: donneViewModel.players[index], at: index, animated: true)
        }
        preneurSegmentedControl.selectedSegmentIndex = donneViewModel.prenneur
        joueurAppeleSegmentedControl.selectedSegmentIndex = donneViewModel.appelé
        
        contratSegmentedControl.removeAllSegments()
        for index in 0..<donneViewModel.nbContrat {
            contratSegmentedControl.insertSegment(withTitle: donneViewModel.contrats[index], at: index, animated: true)
        }
        contratSegmentedControl.selectedSegmentIndex = donneViewModel.contrat
        
        roiAppeleSegmentedControl.removeAllSegments()
        for index in 0..<donneViewModel.nbColors {
            roiAppeleSegmentedControl.insertSegment(withTitle: donneViewModel.colors[index], at: index, animated: true)
        }
        roiAppeleSegmentedControl.selectedSegmentIndex = donneViewModel.roi
        
        petitAuBoutSegmentedControl.removeAllSegments()
        for index in 0..<donneViewModel.equipes.count {
            petitAuBoutSegmentedControl.insertSegment(withTitle: donneViewModel.equipes[index], at: index, animated: true)
        }
        petitAuBoutSegmentedControl.selectedSegmentIndex = donneViewModel.petitAuBout
    }
    
    @IBAction func scoreSlider(_ sender: Any) {
        attaqueScoreLabel.text = String(Int(round(scoreSlider.value)))
        defenseScoreLabel.text = String(Int(round(scoreSlider.maximumValue - scoreSlider.value)))
    }
  
    @IBAction func validateAction(_ sender: Any) {
        donneViewModel.computeScore(prenneur: preneurSegmentedControl.selectedSegmentIndex,
                                    contrat: contratSegmentedControl.selectedSegmentIndex,
                                    couleurAppel: roiAppeleSegmentedControl.selectedSegmentIndex,
                                    appelé: joueurAppeleSegmentedControl.selectedSegmentIndex,
                                    petit: petitSwitch.isOn,
                                    excuse: excuseSwitch.isOn,
                                    vingtEtUn: twentyOneSwitch.isOn,
                                    petitAuBout: petitAuBoutSegmentedControl.selectedSegmentIndex,
                                    poignée: poigneeSwitch.isOn,
                                    doublePoignée: doublePoigneeSwitch.isOn,
                                    triplePoignée: triplePoigneeSwitch.isOn,
                                    chelem: chelemSwitch.isOn,
                                    points: UInt8(round(scoreSlider.value)))
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func cancelAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
