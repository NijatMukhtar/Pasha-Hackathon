//
//  MainPageController.swift
//  Pasha Step
//
//  Created by Nijat Mukhtarov on 08.10.22.
//

import UIKit



class DetailedInformationPageController: UIViewController {

  
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    
    var button1Tapped = true
    var button2Tapped = false
    var button3Tapped = false

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


    @IBAction func button1tapped(_ sender: Any) {
    
    
    
            button2.imageView?.image = UIImage(named: "button2untapped")
            button3.imageView?.image = UIImage(named: "button3untapped")
            button1Tapped = true
            button2Tapped = false
            button3Tapped = false
            (sender as AnyObject).setImage(UIImage(named: "but1tapped"), for: UIControl.State.normal)
        let viewCont = storyboard?.instantiateViewController(withIdentifier: "AwardPageController") as! AwardPageController
        viewCont.navigationItem.setHidesBackButton(true, animated: true)
        viewCont.modalPresentationStyle = .fullScreen
        present(viewCont, animated: false)
        
    
        print(button1Tapped)
    }

    @IBAction func button2tapped(_ sender: Any) {
    
    
    if button2Tapped == false{
            print("yes")
            button1.imageView?.image = UIImage(named: "button1untapped")
            (sender as AnyObject).setImage(UIImage(named: "but2tapped"), for: UIControl.State.normal)
            button3.imageView?.image = UIImage(named: "button3untapped")
            button2Tapped = true
            button1Tapped = false
            button3Tapped = false
        let viewCont = storyboard?.instantiateViewController(withIdentifier: "MainPageController") as! MainPageController
        
        viewCont.navigationItem.setHidesBackButton(true, animated: true)
        viewCont.modalPresentationStyle = .fullScreen
        present(viewCont, animated: false)
        }
    
        print(button2Tapped)
    }
    

    @IBAction func button3tapped(_ sender: Any) {
    
    if button3Tapped == false{
            print("yes")
            button1.imageView?.image = UIImage(named: "button1untapped")
            button2.imageView?.image = UIImage(named: "button2untapped")
            (sender as AnyObject).setImage(UIImage(named: "but3tapped"), for: UIControl.State.normal)
            button3Tapped = true
            button2Tapped = false
            button1Tapped = false
            
            print("buttonTapped")
//            let viewCont = storyboard?.instantiateViewController(withIdentifier: "ContactViewController") as! ContactViewController
//            viewCont.labelText = labelText
//            viewCont.navigationItem.setHidesBackButton(true, animated: true)
//            viewCont.modalPresentationStyle = .fullScreen
//            present(viewCont, animated: false)
        }

        
        print(button3Tapped)
    }
}
