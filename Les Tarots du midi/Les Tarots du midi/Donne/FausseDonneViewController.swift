//
//  FausseDonneViewController.swift
//  Les Tarots du midi
//
//  Created by Pilip Pro on 23/03/2018.
//

import UIKit

class FausseDonneViewController: UIViewController {

    @IBOutlet private weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // TODO
//        imageView.image = ???
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func dismissAndPenalizeTheCulpritAction(_ sender: Any) {
        // TODO
        self.dismiss(animated: true, completion: nil)
    }

}
