//
//  SplashUsecase.swift
//  WeZCast
//
//  Created by Amin on 06/08/2022.
//

import Foundation

protocol SplashUsecaseProtocol{
    func nextDestination()->NextDestination
}

class SplashUsecase:SplashUsecaseProtocol{
    
    private var userdefaults:LocalStorageInterface
    init(localStorage:LocalStorageInterface = MyUserDefaults.shared){
        self.userdefaults = localStorage
    }
    func nextDestination()->NextDestination{
        guard let _ = userdefaults.getValue(forKey: .onboarding) else {return .Onboarding}
        return .Home
    }
}
