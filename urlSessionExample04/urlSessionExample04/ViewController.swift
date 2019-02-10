//
//  ViewController.swift
//  urlSessionExample04
//
//  Created by Emre Erol on 11.02.2019.
//  Copyright © 2019 Codework. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cevap: UILabel!
    @IBOutlet weak var field: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sendData(_ sender: Any) {
        if let url = URL(string: "http://codeworkagency.com/ioskitap/example03.php") {
            let session = URLSession(configuration: .default)
            var dataTask:URLSessionDataTask?
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            let postString = "veri="+field.text!;
            request.httpBody = postString.data(using: String.Encoding.utf8);
            
            dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) in
                if error == nil {
                    let cevap = String(data:data!,encoding: .utf8)
                    DispatchQueue.main.async {
                        self.cevap.text = cevap
                    }
                }else {
                    DispatchQueue.main.async {
                        self.cevap.text = error?.localizedDescription
                    }
                }
            })

            dataTask?.resume()
            
        }
    }
    
}

