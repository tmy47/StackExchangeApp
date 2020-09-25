//
//  QuestionListCellViewModel.swift
//  StackExchange
//
//  Created by Tim Parmentier on 9/25/20.
//

import Foundation


class QuestionListCellViewModel: Identifiable {
    
    let id = UUID()
    let question:Question
    
    init(questionModel:Question) {
        self.question = questionModel
    }

}
