//
//  Question.swift
//  Personal Quiz
//
//  Created by Alex on 10/23/21.
//  Copyright © 2021 AlexShab. All rights reserved.
//

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

extension Question {
    static func loadData() -> [Question] {
        return [
            Question(
                text: "Вы",
                type: .single,
                answers: [
                    Answer(text: "Веселый и жизнерадостный", type: .sanguine),
                    Answer(text: "Невыдержанный, вспыльчивый", type: .choleric),
                    Answer(text: "Спокойный и хладнокровный", type: .phlegmatic),
                    Answer(text: "Не верите в свои силы", type: .melancholic)
                ]
            ),
            Question(
                text: "Вы",
                type: .single,
                answers: [
                    Answer(text: "Неразговорчивый", type: .sanguine),
                    Answer(text: "Раздражительный", type: .choleric),
                    Answer(text: "Уравновешеный", type: .phlegmatic),
                    Answer(text: "Чувствительный", type: .melancholic)
                ]
            ),
            Question(
                text: "Вы",
                type: .multiple,
                answers: [
                    Answer(text: "Энергичный и деловитый", type: .sanguine),
                    Answer(text: "Нетерпеливый", type: .choleric),
                    Answer(text: "Умеете ждать", type: .phlegmatic),
                    Answer(text: "Быстро утомляетесь", type: .melancholic)
                ]
            ),
            Question(
                text: "Как вам дается общение с людьми?",
                type: .ranged,
                answers: [
                    Answer(text: "Общительный", type: .sanguine),
                    Answer(text: "Резки с людьми", type: .choleric),
                    Answer(text: "Ровны ко всем", type: .phlegmatic),
                    Answer(text: "Стеснительный", type: .melancholic)
                ]
            )
        ]
    }
}

