//
//  OnboardingPageController.swift
//  Pasha Step
//
//  Created by Nijat Mukhtarov on 07.10.22.
//

import UIKit

class OnboardingPageController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    func setup(){
            }
    
    @IBAction func startButtonTapped(_ sender: Any) {
        navigate()
    }
    
    func navigate(){
        print("buttonTapped")
        let viewCont = storyboard?.instantiateViewController(withIdentifier: "LoginPageController") as! LoginPageController
        viewCont.navigationItem.setHidesBackButton(true, animated: true)
        navigationController?.show(viewCont, sender: nil)
    }
}
