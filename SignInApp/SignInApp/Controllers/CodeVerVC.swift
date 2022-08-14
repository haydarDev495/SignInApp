//
//  CodeVerVC.swift
//  SignInApp
//
//  Created by Haydar Bekmuradov on 8.08.22.
//

import UIKit

class CodeVerVC: UIViewController {

    // outlet's
    @IBOutlet weak var tryAgainLabel: UILabel!
    @IBOutlet weak var codeTF: UITextField!
    @IBOutlet weak var enterCode: UILabel!
    
    // data
    var userModel : UserModel?
    private var timer = Timer()
    private let secretCode = Int.random(in: 100000...999999)
    private var counter = 0
    private var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDataAndUI()
        
    }
    
    @IBAction func secreCodeTFAction(_ sender: UITextField) {
        guard let code = sender.text,
              let codeInt = Int(code),
              codeInt == secretCode else {
            if sender.text?.count == 6 {
                let alert = UIAlertController(title: "Wrong code", message: "check the code and try again", preferredStyle: UIAlertController.Style.alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
                counter += 1
            }
            if counter > 3 {
                codeTF.isHidden = true
                tryAgainLabel.isHidden = false
                timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(test), userInfo: nil, repeats: false)
                
            }
            
            return
        }
        
        performSegue(withIdentifier: "goToWelcomeVC", sender: nil)
    }
    
    
    @objc private func test() {
        tryAgainLabel.isHidden = true
        counter = 0
        codeTF.isHidden = false
    }
    private func setupDataAndUI() {
        enterCode.text = "Please enter code \(secretCode) from \(userModel?.mail ?? "email")"
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let editData = segue.destination as? EditUserDefaultsVC {
//            editData.userData = userModel
//        }
        if let welcomeVC = segue.destination as? WelcomeVC {
            welcomeVC.userModel = userModel
        }
    }
}
