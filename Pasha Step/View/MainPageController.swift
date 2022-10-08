//
//  MainPageController.swift
//  Pasha Step
//
//  Created by Nijat Mukhtarov on 08.10.22.
//

import UIKit
import CoreMotion

class MainPageController: UIViewController {

    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var stepCounter: UILabel!
    
    var button1Tapped = false
    var button2Tapped = true
    var button3Tapped = false
    let activityManager = CMMotionActivityManager()
    let pedoMeter = CMPedometer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if CMMotionActivityManager.isActivityAvailable(){
            self.activityManager.startActivityUpdates(to: OperationQueue.main) { (data) in
                DispatchQueue.main.async {
                    if let activity = data {
                        if activity.running == true {
                            print("sikimin basi run eleyir")
                        }
                        else if activity.walking == true {
                            print("sikimin basi walking eleyir")
                        }
                        else if activity.automotive == true {
                            print("sikimin basi automative eleyir")
                        }
                    }
                }
            }
        }
        
    }
    
    @IBAction func button1tapped(_ sender: Any) {
        if button1Tapped == false{
            button2.imageView?.image = UIImage(named: "but2untapped")
            button1Tapped = true
            button2Tapped = false
            button3Tapped = false
            (sender as AnyObject).setImage(UIImage(named: "but1tapped"), for: UIControl.State.normal)

        }
    
        print(button1Tapped)
    }
    

    @IBAction func button2tapped(_ sender: Any) {
        if button2Tapped == false{
            print("yes")
            button1.imageView?.image = UIImage(named: "but1untapped")
            (sender as AnyObject).setImage(UIImage(named: "but2tapped"), for: UIControl.State.normal)
            button3.imageView?.image = UIImage(named: "but3untapped")
            button2Tapped = true
            button1Tapped = false
            button3Tapped = false
        }
    
        print(button2Tapped)
    }
    
    @IBAction func button3tapped(_ sender: Any) {
        if button3Tapped == false{
            print("yes")
            button1.imageView?.image = UIImage(named: "but1untapped")
            button2.imageView?.image = UIImage(named: "but2untapped")
            (sender as AnyObject).setImage(UIImage(named: "but3tapped"), for: UIControl.State.normal)
            button3Tapped = true
            button2Tapped = false
            button1Tapped = false
        }
        print(button3Tapped)
    }
}
