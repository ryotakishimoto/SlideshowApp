//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 岸本 諒太 on 2017/09/07.
//  Copyright © 2017年 ryota.kishimoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // 画像の名前の配列
    let photos = ["画像1.jpeg","画像2.jpeg","画像3.jpeg"]
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet var TapImage_out: UITapGestureRecognizer!
    @IBAction func TapImage(_ sender:UITapGestureRecognizer) {
        performSegue(withIdentifier:"big",sender:nil)
    }
    var photoNo = 0
    
    func displayphoto() {
        
        if photoNo < 0 {
            photoNo = 2
        }
        if photoNo > 2 {
            photoNo = 0
        }
        // 表示している画像の番号から名前を取り出し
        let name = photos[photoNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        imageView.image = image
    }

    @IBAction func Next(_ sender: Any) {
        // 表示している画像の番号を1減らす
        photoNo += 1
        
        // 表示している画像の番号を元に画像を表示する
        displayphoto()
    }
    @IBAction func Back(_ sender: Any) {
        // 表示している画像の番号を1減らす
        photoNo -= 1
        
        // 表示している画像の番号を元に画像を表示する
        displayphoto()
    }
    
    func photoTimer(timer: Timer) {
    var timer: Timer!
        
        // 表示している画像の番号を1増やす
        photoNo += 1
        
        // 表示している画像の番号を元に画像を表示する
        displayphoto()
    }
    
    @IBAction func StartStop(_ sender: Any) {
        let timer = Timer.scheduledTimer(timeInterval:1.0, target: self, selector: #selector(ViewController.photoTimer), userInfo: nil, repeats: true)
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

