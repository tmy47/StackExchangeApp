//
//  QuestionListViewModel.swift
//  StackExchange
//
//  Created by Tim Parmentier on 9/25/20.
//

import Foundation
import Combine

class QuestionListViewModel: ObservableObject {
    
    let didChange = PassthroughSubject<QuestionListViewModel,Never>()
    
    @Published var questions = [QuestionListCellViewModel]() {
        didSet {
            didChange.send(self)
        }
    }

    func loadQuestions(){
        
        guard let url = URL(string: "https://api.stackexchange.com/2.2/questions?order=desc&sort=activity&site=stackoverflow&page=1") else {
            fatalError("URL is not correct!")
        }
        
        StackExchangeAPI().loadQuestions(url: url) { (questions) in
            if let questions = questions {
                self.questions = questions.map(QuestionListCellViewModel.init)
                
                /** Filtering logic here, only show questions that have
                 an accepted anwser and have more that 1 anwser */
                
                self.questions = self.questions.filter({ (cellModel) -> Bool in
                    (cellModel.question.is_answered == true && (cellModel.question.answer_count ?? 0) > 1)
                })
                
            }
            
        }
        
    }
    
    func loadPreviewQuestion(){
        let viewModel1 = QuestionListCellViewModel(questionModel: questionData.items![0])
        let viewModel2 = QuestionListCellViewModel(questionModel: questionData.items![1])
        let viewModel3 = QuestionListCellViewModel(questionModel: questionData.items![2])
        self.questions = [viewModel1, viewModel2, viewModel3]
    }
    
}
