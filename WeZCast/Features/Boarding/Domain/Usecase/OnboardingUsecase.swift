//
//  OnboardingUsecase.swift
//  WeZCast
//
//  Created by Amin on 06/08/2022.
//

import Foundation

protocol OnboardingUsecaseProtocol{
    func onFinishOnboarind()
}

class OnboardingUsecase:OnboardingUsecaseProtocol{
    private var userdefaults:LocalStorageInterface
    
    init(userdefaults:LocalStorageInterface){
        self.userdefaults = userdefaults
    }
    func onFinishOnboarind() {
        userdefaults.set(value: true, forKey: .onboarding)
    }
}
