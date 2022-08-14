//
//  SignUpVC.swift
//  SignInApp
//
//  Created by Haydar Bekmuradov on 1.08.22.
//

import UIKit

class SignUpVC: UIViewController {

    @IBOutlet weak var continueButton: UIButton!
    // email
    @IBOutlet weak var enterEmailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var errorEmailLabel: UILabel!
    
    // name
    @IBOutlet weak var enterNameLabel: UILabel!
    @IBOutlet weak var enterNameTextfield: UITextField!
    
    // password
    @IBOutlet weak var enterPasswordTF: UITextField!
    @IBOutlet weak var errorPasswordLabel: UILabel!
    
    // confirm password
    @IBOutlet weak var errorConfirmPassword: UILabel!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    // password indicator
    @IBOutlet var indacotarViews: [UIView]!
    
    // properties
    private var isValidEmail = false { didSet { updateContinueButtonState() } }
    private var isConfirmPassword = false { didSet { updateContinueButtonState() } }
    private var passwordStrength: PasswordStrength = .notVeryWeak { didSet { updateContinueButtonState() } }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavigationBar()
        hideKeyboardWhenTappedAround()
        startKeyboardObserver()
  }
    
    @IBAction func emailTFAction(_ sender: UITextField) {
        if let email = sender.text,
           !email.isEmpty,
           VerificationService.isValidEmail(email: email){
            isValidEmail = true
        } else {
            isValidEmail = false
        }
        errorEmailLabel.isHidden = isValidEmail
    }
    
    @IBAction func passwordTFAction(_ sender: UITextField) {
        if let password = sender.text,
           !password.isEmpty {
            passwordStrength = VerificationService.isValidPassword(pass: password)
        }

        errorPasswordLabel.isHidden = passwordStrength != .veryWeak
        setupView()
    }
    
    @IBAction func confirmTFAction(_ sender: UITextField) {
        
        if let confirmPass = sender.text,
           !confirmPass.isEmpty,
           let password = enterPasswordTF.text,
           !password.isEmpty{
            
            isConfirmPassword = VerificationService.isPassConfirm(pass1: password,
                                                                  pass2: confirmPass)
        } else {
            isConfirmPassword = false
        }
        errorConfirmPassword.isHidden = isConfirmPassword
    }
    
    @IBAction func signInButtonAction() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    @IBAction func continueButtonAction(_ sender: Any) {
        if let mail = emailTextField.text,
           let password = enterPasswordTF.text {
            let userModel = UserModel(name: enterNameTextfield.text, mail: mail, password: password)
            performSegue(withIdentifier: "goToCodeVerificationVC", sender: userModel)
        }
    }
    
    private func updateContinueButtonState() {
        continueButton.isEnabled = isValidEmail && isConfirmPassword && passwordStrength != .veryWeak
    }
    
    private func hideNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: false)

    }
    
    private func setupView() {
        indacotarViews.enumerated().forEach { index, value  in
            if index <= (passwordStrength.rawValue - 1) {
                value.alpha = 1
            } else {
                value.alpha = 0.1
            }
        }
    }
    

    private func startKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: Notification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc private func keyboardWillHide() {
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let codeVerVC = segue.destination as? CodeVerVC,
           let userModel = sender as? UserModel{
            codeVerVC.userModel = userModel
        }
    }
}
