//
//  OnboardCollectoin-ViewModel.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 6/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class OnboardCollectionViewModel: ViewModel {

  let onboardScreens: [OnboardScreen]

  init() {
      onboardScreens = [
        OnboardScreen(image: "Onboard_0",
           title: "onboarding_first_title".localized(Cache.get(stringFor: .language)),
           description: ""),
      OnboardScreen(image: "Onboard_1",
           title: "onboarding_second_title".localized(Cache.get(stringFor: .language)),
           description: "onboarding_second_body".localized(Cache.get(stringFor: .language))),
      OnboardScreen(image: "Onboard_2",
           title: "onboarding_third_title".localized(Cache.get(stringFor: .language)),
           description: "onboarding_third_body".localized(Cache.get(stringFor: .language))),
      OnboardScreen(image: "Onboard_3",
           title: "onboarding_fourth_title".localized(Cache.get(stringFor: .language)),
           description: "onboarding_fourth_body".localized(Cache.get(stringFor: .language)))
    ]
  }
}
