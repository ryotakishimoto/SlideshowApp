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
 
    @IBOutlet var TapImage_out: UITapGestureRecognizer!
    @IBAction func TapImage(_ sender:UITapGestureRecognizer) {
        performSegue(withIdentifier:"big",sender:nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のBigViewControllerを取得する
        let resultViewController:BigViewController = segue.destination as! BigViewController
        // 遷移先のBigiewControllerで宣言している変数に値を代入して渡す
        let name = photos[photoNo]
        // 画像を読み込み
        let image = UIImage(named: name)
        // Image Viewに読み込んだ画像をセット
        resultViewController.bigPhoto = image//UIImageViewを送るのではなくUIImageを送る様にした
    }

    @IBOutlet weak var NextOut: UIButton!
    @IBAction func Next(_ sender: Any) {
        // 表示している画像の番号を1減らす
        photoNo += 1
        // 表示している画像の番号を元に画像を表示する
        displayphoto()
    }
    
    @IBOutlet weak var BackOut: UIButton!
    @IBAction func Back(_ sender: Any) {
        // 表示している画像の番号を1減らす
        photoNo -= 1
        // 表示している画像の番号を元に画像を表示する
        displayphoto()
    }
    
    var timer: Timer!
    func photoTimer(timer: Timer) {
        photoNo += 1// 表示している画像の番号を1増やす
        displayphoto()// 表示している画像の番号を元に画像を表示する
    }
    
    @IBOutlet weak var StartButton: UIButton!
    @IBAction func StartStop(_ sender: Any) {
        if StartButton.isSelected == false{
            if self.timer == nil {
        self.timer = Timer.scheduledTimer(timeInterval:1.0, target: self, selector: #selector(ViewController.photoTimer), userInfo: nil, repeats: true)
        StartButton.isSelected = true
        NextOut.isEnabled = false
        BackOut.isEnabled = false
            }
        }else{
             StartButton.isSelected = false
             NextOut.isEnabled = true
             BackOut.isEnabled = true
            if self.timer != nil {
                self.timer.invalidate()
                self.timer = nil
            }
        }
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


