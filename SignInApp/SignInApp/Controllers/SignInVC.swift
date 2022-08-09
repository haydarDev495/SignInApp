//
//  SignInVC.swift
//  SignInApp
//
//  Created by Haydar Bekmuradov on 1.08.22.
//

import UIKit

class SignInVC: UIViewController {
    @IBOutlet private var emailTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldSetupUI()
    }
    
    @IBAction func showAlertContinuesButton() {
        // create the alert
        let alert = UIAlertController(title: "Sorry", message: "this method is not yet available", preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    private func textFieldSetupUI() {
        emailTextField.layer.borderWidth = 0.5
        emailTextField.layer.borderColor = UIColor.green.cgColor
        
        passwordTextField.layer.borderWidth = 0.5
        passwordTextField.layer.borderColor = UIColor.green.cgColor
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}
