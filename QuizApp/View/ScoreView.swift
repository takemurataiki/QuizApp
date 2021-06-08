//
//  ScoreView.swift
//  QuizApp
//
//  Created by 竹村　太喜 on 2021/05/05.
//

import SwiftUI

struct ScoreView: View {
    //画面遷移
    @Binding var isShow: Bool
    
    
    @State var quiz: QuizData
    @EnvironmentObject var quizVM: QuizViewModel
    
    
    //シェア機能
    func actionSheet() {
        //アプリ共有
            guard let urlShare = URL(string: "https://developer.apple.com/xcode/swiftui/") else { return }
            let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
            UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
        }
    
    var body: some View {
        ZStack {
            Color(red: 0.85, green: 0.7, blue: 1, opacity: 0.5).ignoresSafeArea(.all)
            VStack {
                
                
                Text("\(quiz.score)問正解！")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.vertical, 40.0)
                    .onAppear(){
                        quiz.score = quizVM.correctCount
                    }
                
                Spacer()
                
                Button(action: {self.isShow = false}){
                    Text("トップに戻る")
                        .padding(.all, 30.0)
                        .frame(width: 300.0, height: 70.0)
                        .background(Color.white)
                    
                }.padding(.all, 30.0)
                
                //シェアボタン
                Button(action: actionSheet) {
                    HStack {
                        Image(systemName: "square.and.arrow.up")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 36, height: 36)
                        Text("結果をシェアする")
                            
                            }
                    .padding(.all, 30.0)
                    .frame(width: 300.0, height: 70.0)
                    .background(Color.white)
                }.padding(.all, 30.0)
                
               
                
                Spacer()
                
                AdView().frame(width: .infinity, height: 50)
                
                
                
            }
            .navigationBarHidden(true) 
        }
        
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(isShow: .constant(false),
                  quiz: QuizData(
                     quizNumberLabel: 0,
                     quizTextView: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis ",
                     answerButton1: "選択1",
                     answerButton2: "選択2",
                     answerButton3: "選択3",
                     answerButton4: "選択4",
                    explanation: "解説", tag: 0,
                    judgeImageView: 0, score: 0))
            .environmentObject(QuizViewModel())
    }
}
