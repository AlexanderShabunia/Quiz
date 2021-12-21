//
//  EmotionType.swift
//  Personal Quiz
//
//  Created by Alex on 10/23/21.
//  Copyright © 2021 AlexShab. All rights reserved.
//

enum EmotionType: Character {
    case sanguine = "🙂"
    case choleric = "😠"
    case phlegmatic = "😐"
    case melancholic = "😔"
    
    var definition: String {
        switch self {
        case .sanguine:
            return "Вы радуетесь жизни и во всем видите позитив"
        case .choleric:
            return "Вы эмоциональны, склонны к порывистым действиям, энергичны и проявляете инициативу"
        case .phlegmatic:
            return "Вы сдержанный человек, невозмутимы в любой ситуации. Прежде чем принять решение, обдумываете всё до мелочей"
        case .melancholic:
            return "Вы человек чувствительный и утонченный. Для вас характерна сдержанность и приглушенность моторики и речи, глубина и устойчивость чувств при их слабом внешнем выражении"
        }
    }
}
