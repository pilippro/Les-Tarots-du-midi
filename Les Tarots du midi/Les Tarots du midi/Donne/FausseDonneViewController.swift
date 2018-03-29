//
//  FausseDonneViewController.swift
//  Les Tarots du midi
//
//  Created by Pilip Pro on 23/03/2018.
//

import UIKit
import GiphySwift
import FLAnimatedImage

class FausseDonneViewController: UIViewController {

    @IBOutlet private weak var grosNazImageView: FLAnimatedImageView!
    @IBOutlet private weak var grosNazLabel: UILabel!
    
    private static let queue = DispatchQueue(label: "com.giphyswift", qos: .userInteractive, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Giphy.configure(with: .publicKey)
        Giphy.Gif.request(.translate("ugly")) { result in
            switch result {
            case .success(result: let gifs, properties: _):
                if !gifs.isEmpty {
                    self.displayGif(with: gifs)
                }
            case .error(let error):
                print(error)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func displayGif(with imagesResult: [GiphyImageResult]) {
        let image = imagesResult[0]
        guard let url = urlFor(image: image) else { fatalError("Unable to retrieve URL for image") }
        
        FausseDonneViewController.queue.async {
            URLSession.shared.dataTask(with: url) { data, _, _ in
                guard let data = data else { return }
                
                OperationQueue.main.addOperation {
                    DispatchQueue.main.async {
                        let gifImage = FLAnimatedImage(animatedGIFData: data)
                        self.grosNazImageView.animatedImage = gifImage
                    }
                }
            }.resume()
        }

    }
    
    func urlFor(image: GiphyImage) -> URL? {
        if let image = image as? GiphyImageResult {
            return URL(string: image.images.fixedHeight.downsampled.gif.url)
        }
        
        // NOTE: The Giphy API returns these URLs as HTTP - Here we convert them first to HTTPS
        if let image = image as? GiphyRandomImageResult {
            var urlComponents = URLComponents(string: image.images.fixedHeight.downsampled.gif.url)
            urlComponents?.scheme = "https"
            return urlComponents?.url
        }
        
        return nil
    }
    
    @IBAction func dismissAndPenalizeTheCulpritAction(_ sender: Any) {
        // TODO
        self.dismiss(animated: true, completion: nil)
    }

}
