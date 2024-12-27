//
//  OnboardingPage.swift
//  Getrol
//
//  Created by Andrii Pikus on 26.12.2024.
//


import SwiftUICore

enum OnboardingPage: String, CaseIterable {
    case page0
    case page1
    case page2
    case page3
    
    var index: CGFloat {
        switch self {
        case .page0: 0
        case .page1: 1
        case .page2: 2
        case .page3: 3
        }
    }
    
//    var title: String {
//        switch self {
//        case .page0:
//    //        LS.Onboarding.Page.title0
//        case .page1:
//    //        LS.Onboarding.Page.title1
//        case .page2:
//   //         LS.Onboarding.Page.title2
//        case .page3:
//    //        LS.Onboarding.Page.title3
//        }
//    }
//    
//    var subtitle: String {
//        switch self {
//        case .page0:
//       //     LS.Onboarding.Page.subtitle
//        case .page1:
//            ""
//        case .page2:
//            ""
//        case .page3:
//            ""
//        }
//    }
//    
//    var body: String {
//        switch self {
//        case .page0:
//      //      LS.Onboarding.Page.body0
//        case .page1:
//      //      LS.Onboarding.Page.body1
//        case .page2:
//     //       LS.Onboarding.Page.body2
//        case .page3:
//        //    LS.Onboarding.Page.body3
//        }
//    }
//    
//    var image: Image {
//        switch self {
//        case .page0:
//        //    Image(.cloverImg)
//        case .page1:
//     //       Image(.starImg)
//        case .page2:
//     //       Image(.squareRootImg)
//        case .page3:
//     //       Image(.exclamationImg)
//        }
//    }
    
    var nextPage: Self {
        let index = Int(self.index) + 1
        if index < 4 {
            return OnboardingPage.allCases[index]
        }
        
        return self
    }
    
    var previousPage: Self {
        let index = Int(self.index) - 1
        if index >= 0 {
            return OnboardingPage.allCases[index]
        }
        
        return self
    }
    
    var lastPage: Self? {
        return OnboardingPage.allCases.last
    }
}
