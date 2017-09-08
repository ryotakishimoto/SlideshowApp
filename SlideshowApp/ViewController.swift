//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 岸本 諒太 on 2017/09/07.
//  Copyright © 2017年 ryota.kishimoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let photos = ["画像1.jpeg","画像2.jpeg","画像3.jpeg"]
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet var TapImage_out: UITapGestureRecognizer!
    @IBAction func TapImage(_ sender:UITapGestureRecognizer) {
        performSegue(withIdentifier:"big",sender:nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        let image:UIImage! = UIImage(named:photos[0])
        imageView.image = image
    
    }
    override func didReceiveMemoryWarning()  {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }

}

