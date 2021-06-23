//
//  BackViewIView.swift
//  QuizApp
//
//  Created by 竹村　太喜 on 2021/06/02.
//

import SwiftUI

struct BackViewIView: View {
    @State private var isActive = false
    
    var body: some View {
        NavigationView {
            NavigationLink(destination: FirstView(), isActive: $isActive) {
                Text("Forward to First View.")
            }
            .isDetailLink(false)
            .navigationBarTitle("Main View")
            
        }
    }
}

struct FirstView: View {
    @State private var isActive = false
    
    
    var body: some View {
        NavigationLink(destination: SecondView(isFirstViewActive: $isActive), isActive: $isActive)  {
            Button(action: {
                self.isActive = true
            }, label: {
                Text("Forward to Second View.")
            })
        }
        .isDetailLink(false)
        .navigationBarTitle("First View")
    }
}


struct SecondView: View {
    
    @State private var isActive = false
    @Binding var isFirstViewActive: Bool
    
    var body: some View {
        NavigationLink(destination: ThirdView(isFirstViewActive: $isFirstViewActive), isActive: $isActive) {
            Button(action: {
                self.isActive = true
            }, label: {
                Text("Forward to Third View.")
            })
        }
        .isDetailLink(false)
        .navigationBarTitle("Second View")
    }
}


struct ThirdView: View {
    
    @Binding var isFirstViewActive: Bool
    
    var body: some View {
        Button(action: {
            self.isFirstViewActive = false
        }, label: {
            Text("Back to First View.")
        })
        .navigationBarTitle("Third View")
    }
}
struct BackViewIView_Previews: PreviewProvider {
    static var previews: some View {
        BackViewIView()
    }
}
