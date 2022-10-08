//
//  LoginPageController.swift
//  Pasha Step
//
//  Created by Nijat Mukhtarov on 07.10.22.
//

import UIKit
import HealthKit

class LoginPageController: UIViewController {
    @IBOutlet weak var mailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    let healthStore = HKHealthStore()
    var stepCount = 0
    
    let mail = "test@gmail.com"
    let password = "1234"
    
    @IBOutlet weak var signinButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        authorizeHealtkit()
        getSteps()
    }
    
    func setup(){
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        mailTextfield.leftView = paddingView
        mailTextfield.leftViewMode = .always
        
        let paddingViewSecond: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        passwordTextfield.leftView = paddingViewSecond
        passwordTextfield.leftViewMode = .always
        
    }
    
    @IBAction func signinbuttonTapped(_ sender: Any) {
        if mailTextfield.text == mail && passwordTextfield.text == password{
            navigate()
        }
        else{
            passwordTextfield.text = ""
            let alert = UIAlertController(title: "Alert", message: "Password is wrong, please try again.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func authorizeHealtkit(){
        let read = Set([HKObjectType.quantityType(forIdentifier: .stepCount)!])
        let share = Set([HKObjectType.quantityType(forIdentifier: .stepCount)!])
        healthStore.requestAuthorization(toShare: share , read: read) { (chk, error) in
            if(chk){
                print("permission granted")
            
            }
        }
    }
   
    func getSteps(){
        guard let sampleType = HKCategoryType.quantityType(forIdentifier: .stepCount) else{
            return
        }
        let startDate = Calendar.current.startOfDay(for: Date())
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date(), options: .strictEndDate)
        var interval = DateComponents()
        interval.day = 1
        let query = HKStatisticsCollectionQuery(quantityType: sampleType, quantitySamplePredicate: predicate, options: [.cumulativeSum], anchorDate: startDate, intervalComponents: interval)
        query.initialResultsHandler = {
            query, result, error in
            
            if let mysresult = result {
                mysresult.enumerateStatistics(from: startDate, to: Date()) { (statistic, value) in
                    if let count = statistic.sumQuantity(){
                        let val = count.doubleValue(for: HKUnit.count())
                        print(val)
                        self.stepCount = Int(val)
                        UserDefaults.standard.set(Int(val), forKey: "stepCount")
                    }
                    
                }
            }
        }
        healthStore.execute(query)
    }
    
   
    
    func navigate(){
        print("buttonTapped")
        let viewCont = storyboard?.instantiateViewController(withIdentifier: "MainPageController") as! MainPageController
        
        viewCont.navigationItem.setHidesBackButton(true, animated: true)
        navigationController?.show(viewCont, sender: nil)
    }
    
}

