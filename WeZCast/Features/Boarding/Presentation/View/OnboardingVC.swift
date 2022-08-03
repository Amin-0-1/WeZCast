//
//  FirstVC.swift
//  WeZCast
//
//  Created by Amin on 31/07/2022.
//

import UIKit
import Lottie
import CoreLocation

class OnboardingVC: UIViewController ,CLLocationManagerDelegate{

    @IBOutlet private var uiAnimationLogo: AnimationView!
    @IBOutlet private weak var uiAnimationView: AnimationView!
    @IBOutlet private weak var uiNextButton: XButton!
    @IBOutlet private weak var uiTitle: UILabel!
    
    @IBOutlet weak var uiStack: UIStackView!
    var viewModel:OnboardingProtocol!
    var onboarding:OnboardingState!
    private var locationManager:CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiTitle.text = onboarding.rawValue
        configureAnimationLogo()
        navigationController?.navigationBar.isHidden = true
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        uiNextButton.onClick { [weak self] in
            guard let self = self else {return}
            switch self.onboarding{
            case .first:
                self.configureLocation()
            case .second:
                self.configureNotification()
            case .none:
                break
            }
        }
    }

    private func configureNotification(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("All set!")
            } else if let error = error {
                print(error.localizedDescription)
            }
            
        }
    }
    private func configureLocation(){
        locationManager = CLLocationManager()
        locationManager.delegate = self
        self.locationManager.requestAlwaysAuthorization()
    }
    
    private func configureAnimationLogo(){
        switch onboarding{
        case .first:
            self.uiAnimationLogo = AnimationView(name: R.file.iconJson.name)
        case .second:
            self.uiAnimationLogo = AnimationView(name: R.file.icon2Json.name)
        case .none:
            break
        }
        uiAnimationLogo.backgroundColor = .clear
        uiAnimationView.contentMode = .scaleAspectFill
        uiAnimationView.loopMode = .loop
        uiAnimationView.play()
        uiAnimationLogo.contentMode = .scaleAspectFit
        uiAnimationLogo.loopMode = .loop
        uiAnimationLogo.play()
        
        uiStack.addArrangedSubview(uiAnimationLogo)
        NSLayoutConstraint.activate([
            uiAnimationLogo.heightAnchor.constraint(equalToConstant: 200)
        ])
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == .authorizedWhenInUse{
            viewModel.input.onNext.onNext(())
        }else if status == .denied{
            locationManager.requestAlwaysAuthorization()
        }
    }
}

