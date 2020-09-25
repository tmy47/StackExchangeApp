//
//  QuestionListView.swift
//  StackExchange
//
//  Created by Tim Parmentier on 9/25/20.
//

import SwiftUI

struct QuestionListView: View {
    
    static let titleString = "Stack Exchange"
    
    @ObservedObject var model = QuestionListViewModel()
    
    var body: some View {
        NavigationView {
            List(model.questions) { question in
                QuestionListCellView(questionViewModel: question)
            }.onAppear {
                self.model.loadQuestions()
            }
            .navigationBarTitle(Text(QuestionListView.titleString))
            .toolbar(content: {
                ToolbarItem(placement: .automatic) {
                    Button("Reload") {
                        self.model.loadQuestions()
                    }
                }
            })
        }
    }
}

struct QuestionListView_Previews: PreviewProvider {
    
    @ObservedObject static var model = QuestionListViewModel()
    
    static var previews: some View {
        NavigationView {
            List(model.questions) { question in
                QuestionListCellView(questionViewModel: question)
            }.onAppear {
                self.model.loadPreviewQuestion()
            }
            .navigationBarTitle(Text(QuestionListView.titleString))
            .toolbar(content: {
                ToolbarItem(placement: .automatic) {
                    Button("Reload") {
                        self.model.loadPreviewQuestion()
                    }
                }
            })
        }
    }
}
