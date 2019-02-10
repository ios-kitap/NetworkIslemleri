//
//  ViewController.swift
//  urlSessionExample03
//
//  Created by Emre Erol on 10.02.2019.
//  Copyright © 2019 Codework. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgview: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func start(_ sender: Any) {
        if let url = URL(string:"http://codeworkagency.com/ioskitap/logoaydin.jpg")
        {
            let session = URLSession.shared
            let request = URLRequest(url: url)
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                if error == nil {
                    if let data = data {
                        if let image = UIImage(data: data) {
                            DispatchQueue.main.async {
                                self.imgview.image = image
                            }
                        }
                    }
                }else{
                    
                }
            }
            dataTask.resume()
        }
    }
    
}

