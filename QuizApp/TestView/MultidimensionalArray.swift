//
//  MultidimensionalArray.swift
//  QuizApp
//
//  Created by 竹村　太喜 on 2021/06/11.
//

import SwiftUI

struct MultidimensionalArray: View {
    
    
    @State var groupA = ["England", "Ireland", "Scotland", "Wales"]
    @State var groupB = ["Canada", "Mexico", "United States"]
    @State var groupC = ["China", "Japan", "South Korea"]

    
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                        
        }
    }
}

struct MultidimensionalArray_Previews: PreviewProvider {
    static var previews: some View {
        MultidimensionalArray()
    }
}
