//
//  ViewController.swift
//  JankenSaveTheEarth
//
//  Created by 寺井大騎 on 2018/04/11.
//  Copyright © 2018年 Daiki Terai. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
    
    @IBOutlet var ponLabel: UILabel!
    
    
    var image0:UIImage = UIImage(named: "gu.png")!
    var image2:UIImage = UIImage(named: "choki.png")!
    var image5:UIImage = UIImage(named: "pa.png")!
    
    var imageArray:[UIImage] = []
    
    @IBOutlet var imageview: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ponLabel.isHidden = true
        
    }
    
    func hide(){
        imageview.isHidden = true
        ponLabel.isHidden = true
    }
    
    func pon(){
        imageArray = [image0,image2,image5]
        let ret = Int(arc4random_uniform(3))
        imageview.image = imageArray[ret]
        imageview.isHidden = false
        ponLabel.isHidden = false
    }
    
    func vibrate(){
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
    
    override var canBecomeFirstResponder: Bool { get { return true } }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.becomeFirstResponder()
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        print("motionBegan - subtype: \(motion.rawValue) with \(String(describing: event))")
        if motion == UIEventSubtype.motionShake {
            print("  SHAKE!!")
        }
        vibrate()
        pon()
       
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        print("motionEnded - subtype: \(motion.rawValue) with \(String(describing: event))")
        if motion == UIEventSubtype.motionShake {
            print("  SHAKE!!!")
        }
        
    }
    
    override func motionCancelled(_ motion: UIEventSubtype, with event: UIEvent?) {
        print("motionCancelled - subtype: \(motion.rawValue) with \(String(describing: event))")
        if motion == UIEventSubtype.motionShake {
            print("  SHAKE...")
        }
        hide()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        hide()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}

