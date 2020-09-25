//
//  QuestionListCellView.swift
//  StackExchange
//
//  Created by Tim Parmentier on 9/25/20.
//

import SwiftUI

struct QuestionListCellView: View {
    
    var questionViewModel:QuestionListCellViewModel
    
    var body: some View {
        if let title = questionViewModel.question.title {
            VStack(alignment: .leading){
                Text(title)
                    .font(.headline)
                HStack{
                    HStack{
                        Text("Is Answered: ")
                            .foregroundColor(Color.blue)
                            .lineLimit(4)
                        Text((questionViewModel.question.is_answered ?? false) ? "true" : "false")
                            .foregroundColor(Color.gray)
                    }
                    .padding(.trailing)
                    HStack{
                        Text("Answer Count: ")
                            .foregroundColor(Color.blue)
                            .lineLimit(4)
                        Text("\(questionViewModel.question.answer_count ?? 0)")
                            .foregroundColor(Color.gray)
                    }
                    
                }
 
            }
            
        }else{
            Text("No Title")
        }
    }
}



struct QuestionListCellView_Previews: PreviewProvider {
    
    static let model = QuestionListCellViewModel(questionModel: questionData.items![0])
    
    static var previews: some View {
        QuestionListCellView(questionViewModel: model)
            .frame(width: 400.0, height: 60.0)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

