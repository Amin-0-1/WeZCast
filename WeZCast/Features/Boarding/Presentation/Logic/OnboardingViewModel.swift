//
//  OnboardingViewModel.swift
//  WeZCast
//
//  Created by Amin on 04/08/2022.
//

import Foundation
import RxSwift
import RxCocoa

protocol OnboardingInput{
    var onNext:PublishSubject<Void>{get}
}
struct OnboardingVMInput:OnboardingInput{
    var onNext: PublishSubject<Void>
    init(){
        onNext = PublishSubject()
    }
}
protocol OnboardingOutput{
    
}
struct OnboardingVMOutput:OnboardingOutput{
    
}
protocol OnboardingProtocol{
    var input:OnboardingVMInput! {get}
    var output:OnboardingVMOutput! {get}
}


class OnboardingViewModel: OnboardingProtocol{
    var input: OnboardingVMInput!
    var output: OnboardingVMOutput!
    
    private var bag:DisposeBag!
    private var coordinator:OnboardingCoordinating
    init(coordinator:OnboardingCoordinating){
        input = OnboardingVMInput()
        output = OnboardingVMOutput()
        bag = DisposeBag()
        self.coordinator = coordinator
        bind()
    }
    private func bind(){
        input.onNext.bind{ [weak self] _ in
            guard let self = self else {return}
            self.coordinator.navigateToNext()
        }.disposed(by: bag)
    }
    
}
