//
//  ViewController.swift
//  urlSessionExample02
//
//  Created by Emre Erol on 10.02.2019.
//  Copyright © 2019 Codework. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sonuc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func start(_ sender: Any) {
        
        if let url = URL(string: "http://codeworkagency.com/ioskitap/example02.php?veri=kullanici") {
            let session = URLSession.shared
            let request = URLRequest(url: url)
            let task = session.dataTask(with: request) { (data,response,error) in
                if error == nil {
                    guard let cevap = data else {return}
                    DispatchQueue.main.async {
                        self.sonuc.text = String(data:cevap,encoding: .utf8)!
                    }
                }else{
                    DispatchQueue.main.async {
                        self.sonuc.text = error?.localizedDescription
                    }
                }
            }
            task.resume()
        }
        
    }
    
    
}

