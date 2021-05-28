//
//  SettingView.swift
//  QuizApp
//
//  Created by 竹村　太喜 on 2021/05/28.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        ZStack {
            Color(red: 0.85, green: 0.7, blue: 1, opacity: 0.5).ignoresSafeArea(.all)
            VStack {
                Text("設定")
                Spacer()
                AdView().frame(width:.infinity, height: 50)
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
