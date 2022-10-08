//
//  LoginPageController.swift
//  Pasha Step
//
//  Created by Nijat Mukhtarov on 07.10.22.
//

import UIKit

class LoginPageController: UIViewController {

 
    @IBOutlet weak var signinButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signinbuttonTapped(_ sender: Any) {
        navigate()
    }
    
    func navigate(){
        print("buttonTapped")
        let viewCont = storyboard?.instantiateViewController(withIdentifier: "MainPageController") as! MainPageController
        viewCont.navigationItem.setHidesBackButton(true, animated: true)
        navigationController?.show(viewCont, sender: nil)
    }
    
}
