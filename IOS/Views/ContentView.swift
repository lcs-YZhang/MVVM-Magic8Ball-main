//
//  ContentView.swift
//  IOS
//
//  Created by Steven Zhang on 2021-10-02.
//

import SwiftUI

struct ContentView: View {
    
    // Make an instance of the view model to store questions and advice
    @StateObject private var advisor = AdviceViewModel()

    // Stores the current question being asked
    @State private var input = ""
    
    // Stores the response to the given question
    @State private var output = ""
    
    var body: some View {
        VStack {
            
            // Advice given
            HStack {
                VStack(alignment: .leading) {
                    Text("**NOTE:**")
                    Text("Questions should be phrased in such that they can be answered with a yes or no response.")
                }
                Spacer()
            }

            // Ask a question
            TextField("Question",
                      text: $input,
                      prompt: Text("What do you need advice on?"))
            
            // Get advice
            Button(action: {
                print("Shake button was pressed")
                output = advisor.provideResponseFor(givenQuery: input)
            }, label: {
                Text("Shake")
            })
                .padding()
                // Return will trigger this button
                .keyboardShortcut(.defaultAction)
                // Only enable the button when a question is asked
                .disabled(!input.contains("?"))
            
            // Advice given
            Text(output)
            
            // Show the list of questions and responses
            List(advisor.sessions.reversed()) { session in
                VStack(alignment: .leading) {
                    Text(session.question)
                        .bold()
                    Text(session.response)
                }
            }
                        
            Spacer()
        }
        .padding()
        .navigationTitle("Magic 8 Ball")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
