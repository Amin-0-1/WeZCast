//
//  SplashViewModel.swift
//  WeZCast
//
//  Created by Amin on 05/08/2022.
//

import Foundation
import RxCocoa
import RxSwift

protocol SplashInput{
    var onScreenAppeared:PublishSubject<Void>{get}
}
struct SplashVMInput:SplashInput{
    var onScreenAppeared: PublishSubject<Void>
    
    init(){
        onScreenAppeared = PublishSubject()
    }
}
protocol SplashVMProtocol{
    var input:SplashVMInput! {get}
}
class SplashViewModel:SplashVMProtocol{
    var input: SplashVMInput!
    
    private var coordinator:SplashCoordinating!
    private var usecase:SplashUsecaseProtocol!
    private var bag:DisposeBag!
    init(coordinator:SplashCoordinating,usecase:SplashUsecaseProtocol){
        self.coordinator = coordinator
        self.usecase = usecase
        input = SplashVMInput()
        bag = DisposeBag()
        bind()
    }
    private func bind(){
        input.onScreenAppeared.bind{ [weak self] _ in
            guard let self = self else {return}
            DispatchQueue.main.asyncAfter(deadline: .now() + AppConfig.getSplashTime()) {
                switch self.usecase.nextDestination(){
                case .Home:
                    self.coordinator.navigateToHome()
                case .Onboarding:
                    self.coordinator.navigateToOnboarding()
                }
            }
        }.disposed(by: bag)
    }
}
