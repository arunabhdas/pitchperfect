//
//  ViewController.swift
//  MemeMe
//
//  Created  on 2/8/17.
//  Copyright © 2017 mememe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imagePickerView: UIImageView!
    @IBAction func pickButtonTapped(_ sender: Any) {
        
        let pickerController = UIImagePickerController()
        self.present(pickerController, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

