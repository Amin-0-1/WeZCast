//
//  OnboardingCoordinator.swift
//  WeZCast
//
//  Created by Amin on 04/08/2022.
//

import Foundation
import UIKit

protocol OnboardingCoordinating:Coordinating{
    func navigateToNext()
    func navigateToHome()
}

class OnboardingCoordinator : OnboardingCoordinating{
    
    private var nav:UINavigationController!
    private var usecase:OnboardingUsecaseProtocol!
//    private var userdefaults:LocalStorageInterface!
    
    init(nav:UINavigationController?){
        self.nav = nav
        let userdefaults = MyUserDefaults.shared
        usecase = OnboardingUsecase(userdefaults: userdefaults)
    }
    func start() {
        let vc = OnboardingVC.init(nibName: R.nib.onboardingVC.name, bundle: nil)
        vc.onboarding = .first
        vc.viewModel = OnboardingViewModel(coordinator: self,usecase: usecase)
        nav.pushViewController(vc, animated: true)
    }
    
    func navigateToNext() {
        let vc = OnboardingVC.init(nibName: R.nib.onboardingVC.name, bundle: nil)
        vc.onboarding = .second
        vc.viewModel = OnboardingViewModel(coordinator: self,usecase: usecase)
        nav.pushViewController(vc, animated: true)
    }
    func navigateToHome() {
        let vc = HomeVC.init(nibName: R.nib.homeVC.name, bundle: nil)
        nav.pushViewController(vc, animated: true)
    }
}
