//
//  ContentView.swift
//  QuizApp
//
//  Created by 竹村　太喜 on 2021/05/05.
//



//トップに戻るを問題画面に戻す
import SwiftUI

struct ContentView: View {
    @State var selectTag = 0
    @EnvironmentObject var quizVM: QuizViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                TabView(selection: $selectTag) {
                    HomeView()
                        .tabItem {
                            Image(systemName: "house")
                            Text("HOME")
                        }.tag(0)
                    
                     SettingView()
                        .tabItem {
                            Image(systemName: "gearshape")
                            Text("設定")
                        }.tag(1)
                }
                .navigationBarHidden(true)
                
               
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(QuizViewModel())
    }
}
