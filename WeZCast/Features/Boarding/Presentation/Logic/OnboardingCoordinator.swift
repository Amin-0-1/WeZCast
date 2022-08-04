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
}

class OnboardingCoordinator : OnboardingCoordinating{
    
    private var nav:UINavigationController!
    
    init(nav:UINavigationController?){
        self.nav = nav
    }
    func start() {
        let vc = OnboardingVC.init(nibName: R.nib.onboardingVC.name, bundle: nil)
        vc.onboarding = .first
        vc.viewModel = OnboardingViewModel(coordinator: self)
        nav.pushViewController(vc, animated: true)
    }
    
    func navigateToNext() {
        let vc = OnboardingVC.init(nibName: R.nib.onboardingVC.name, bundle: nil)
        vc.onboarding = .second
        vc.viewModel = OnboardingViewModel(coordinator: self)
        nav.pushViewController(vc, animated: true)
    }
}
