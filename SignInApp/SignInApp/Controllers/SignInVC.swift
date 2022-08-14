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
        textFieldSetupUILayer()
        
//        performSegue(withIdentifier: "goToMain", sender: nil)
    }
    
    @IBAction func signInButtonAction() {
 
        if let mail = emailTextField.text,
           let password = passwordTextField.text,
           let userModel = UserDefaultsService.getUserModel(),
           mail == userModel.mail,
           password == userModel.password {
            performSegue(withIdentifier: "goToMain", sender: userModel)
        } else {
            print("wrong password,mail or somethink else check with breakpoint")
        }
            
    }
    
    @IBAction func showAlertContinuesButton() {
        let alert = UIAlertController(title: "Sorry", message: "this method is not yet available", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func textFieldSetupUILayer() {
        emailTextField.layer.borderWidth = 0.5
        emailTextField.layer.borderColor = UIColor.green.cgColor
        
        passwordTextField.layer.borderWidth = 0.5
        passwordTextField.layer.borderColor = UIColor.green.cgColor
    }
    
    
     // MARK: - Navigation
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let mainVC = segue.destination as? MainVC,
//           let userModel = sender as? UserModel{
//            mainVC.userModel = userModel
//            
//        }
    }
}
