//
//  UserDefaultsServices.swift
//  SignInApp
//
//  Created by Haydar Bekmuradov on 9.08.22.
//

import Foundation

final class UserDefaultsService {
    static func saveUserModel(userModel: UserModel) {
        UserDefaults.standard.set(userModel.mail, forKey: UserDefaults.Keys.mail.rawValue)
        UserDefaults.standard.set(userModel.name, forKey: UserDefaults.Keys.name.rawValue)
        UserDefaults.standard.set(userModel.password, forKey: UserDefaults.Keys.password.rawValue)
    }
    
    static func getUserModel() -> UserModel? {
        let name = UserDefaults.standard.string(forKey: UserDefaults.Keys.name.rawValue)
        guard let mail = UserDefaults.standard.string(forKey: UserDefaults.Keys.mail.rawValue),
              let password = UserDefaults.standard.string(forKey: UserDefaults.Keys.password.rawValue)
        else { return nil }
        let userModel = UserModel(name: name, mail: mail, password: password)
        return userModel
    }
}
