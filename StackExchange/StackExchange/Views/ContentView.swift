//
//  ContentView.swift
//  StackExchange
//
//  Created by Tim Parmentier on 9/25/20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model = QuestionListViewModel()
    
    var body: some View {
        QuestionListView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
