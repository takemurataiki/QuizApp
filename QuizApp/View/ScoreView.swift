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
    
    @State var quiz: Question
    @Binding var category1: Level1
    @Binding var category2: Level2
    @Binding var category3: Level3
    
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
               
                if quizVM.selectLevel == 1 {
                    Text("\(category1.score)問正解！")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding(.vertical, 40.0)
                }
                if quizVM.selectLevel == 2 {
                    Text("\(category2.score)問正解！")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding(.vertical, 40.0)
                }
                if quizVM.selectLevel == 3 {
                    Text("\(category3.score)問正解！")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding(.vertical, 40.0)
                }
                   
                Button(action: {
                        self.isShow = false
                   
                }){
                    Text("トップに戻る")
                        .padding(.all, 20.0)
                        .frame(width: 300.0, height: 70.0)
                        .background(Color.white)
                        .cornerRadius(25)
                    
                }.padding(.all, 20.0)
                
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
                    .cornerRadius(25)
                }.padding(.all, 20.0)
                
                Spacer()
                
                AdView()
                    .frame(maxWidth:.infinity, maxHeight: 60.0)
                
                
            }
            .navigationBarHidden(true) 
        }
        
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(isShow: .constant(false),
                  quiz: Question.default,
                  category1: .constant(Level1.default),
                  category2: .constant(Level2.default),
                  category3: .constant(Level3.default))
            .environmentObject(QuizViewModel())
    }
}
