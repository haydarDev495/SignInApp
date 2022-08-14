//
//  WelcomeVC.swift
//  SignInApp
//
//  Created by Haydar Bekmuradov on 9.08.22.
//

import UIKit

class WelcomeVC: UIViewController {

    var userModel: UserModel?
    @IBOutlet weak var helloLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()


    }
    
    private func setupUI() {
        helloLabel.text = "Hello \(userModel?.name ?? "User"), Congratilation you are successfully registered"
    }

    @IBAction func saveDataButtonAction() {
        
        guard let userModel = userModel else { return }
        UserDefaultsService.saveUserModel(userModel: userModel)
        navigationController?.popToRootViewController(animated: true)
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
