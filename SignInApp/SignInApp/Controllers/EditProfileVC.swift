//
//  EditProfileVC.swift
//  SignInApp
//
//  Created by Haydar Bekmuradov on 8.08.22.
//

import UIKit


class EditProfileVC: UIViewController {

    // otlets
    @IBOutlet weak var editEmailTF: UITextField!
    @IBOutlet weak var editNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var saveButtonOutlet: UIButton!
    
    // data
    var userModel : UserModel?
    private var newUserModel : UserModel?
    
    private var newMail: String = ""
    private var newName: String?
    private var newPassword: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newUserModel = userModel
        setDataFromUserDefaultsIntoTF()
    }
    
    private func setDataFromUserDefaultsIntoTF() {
        editEmailTF.text = userModel?.mail
        editNameTF.text = userModel?.name
        passwordTF.text = userModel?.password
    }
    
    @IBAction func emailEditAction(_ sender: UITextField) {
        if let mail = sender.text{
            newMail = mail
        }
        isEnabledButton()
    }
    
    @IBAction func nameEditAction(_ sender: UITextField) {
//        if sender.text != userModel?.name {
//            newName = sender.text
//        }
        newName = sender.text
        isEnabledButton()
    }
    
    
    @IBAction func passwordEditActionTF(_ sender: UITextField) {

        if let password = sender.text {
            newPassword = password
        }
        isEnabledButton()
    }
    
    @IBAction func continueButtonAction(_ sender: Any) {
//        newUserModel = UserModel(name: newName, mail: newMail, password: newPassword)
    }
    
    func isEnabledButton() {
        newUserModel = UserModel(name: newName, mail: newMail, password: newPassword)
        saveButtonOutlet.isEnabled = userModel != newUserModel

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


extension UserModel: Equatable {
    static func == (lhs: UserModel, rhs: UserModel) -> Bool {
        lhs.mail == rhs.mail &&
            lhs.name == rhs.name &&
            lhs.password == rhs.password
    }
}
