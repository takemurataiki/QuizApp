//
//  ExplanationView.swift
//  QuizApp
//
//  Created by 竹村　太喜 on 2021/05/14.
//

import SwiftUI

struct ExplanationView: View {
    @State var quiz: Question
    var body: some View {
        
        Text(quiz.explanation)
    }
}

struct ExplanationView_Previews: PreviewProvider {
    static var previews: some View {
        ExplanationView(quiz: Question.default)
    }
}
