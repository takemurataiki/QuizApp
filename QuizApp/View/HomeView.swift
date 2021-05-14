//
//  HomeView.swift
//  QuizApp
//
//  Created by 竹村　太喜 on 2021/05/05.
//

import SwiftUI

struct HomeView: View {
    @State private var isActive = false
    @EnvironmentObject var quizVM: QuizViewModel
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.85, green: 0.7, blue: 1, opacity: 0.5).ignoresSafeArea(.all)
                VStack {
                    Text("◯◯クイズ")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        
                    
                    Spacer()
                    
                    //スタートボタン
                    NavigationLink(destination: SelectLevelView(
                                    isShow: self.$isActive),
                                   isActive: self.$isActive){
                        Text("スタート")
                            .padding(.all, 30.0)
                            .frame(width: 300.0, height: 80.0)
                            .background(Color.white)
                    }
                    
                    
                    Spacer()
                    
                    AdView().frame(width: 330, height: 50)
                }
                
                
            }
            
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(QuizViewModel())
        
    }
}
