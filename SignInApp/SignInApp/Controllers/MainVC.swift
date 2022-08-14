//
//  MainVC.swift
//  SignInApp
//
//  Created by Haydar Bekmuradov on 10.08.22.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDataToLabels()

    }
    
    // DELETE button ACTION
    @IBAction func deleteButtonAction() {
        let alert = UIAlertController(title: "Warning", message: "do you want delete account?", preferredStyle: .alert)
        
        let yes = UIAlertAction(title: "Yes", style: .default) { _ in
            UserDefaults.standard.reset()
            self.navigationController?.popToRootViewController(animated: true)
        }
        alert.addAction(yes)
        let no = UIAlertAction(title: "No", style: .default, handler: nil)
        alert.addAction(no)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func logOutButtonAction() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    //SET data to LABELS
    private func setDataToLabels() {
        
        if let data = UserDefaultsService.getUserModel() {
            emailLabel.text = data.mail
            nameLabel.text = data.name
            passwordLabel.text = data.password
        }
    }
    
    @IBAction func editProfileButtonAction() {
        performSegue(withIdentifier: "goToEditProfile", sender: nil)
    }
    


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? EditProfileVC {
            vc.userModel = UserDefaultsService.getUserModel()
        }
        
    }
    

}
