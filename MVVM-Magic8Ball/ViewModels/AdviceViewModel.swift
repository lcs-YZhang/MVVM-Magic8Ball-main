//
//  AdviceViewModel.swift
//  MVVM-Magic8Ball
//
//  Created by Russell Gordon on 2021-09-17.
//

import Foundation

class AdviceViewModel {
    
    // History of advice sessions
    var sessions: [Session] = []    // empty array to start
    
    // Given a question, provide some advice
    // Library shortcut: Command-Shift-L
    func provideResponseFor(givenQuery: String) -> String {
        
        // Start an advice session
        var currentSession = Session(question: givenQuery)

        // Use the static function right from the Magic8Ball type (no instance required!)
        currentSession.response = Magic8Ball.getResponse()

        // Save the question and the advice given to the history
        sessions.append(currentSession)
        
        // Give the response back
        return currentSession.response
        
    }
    
}
