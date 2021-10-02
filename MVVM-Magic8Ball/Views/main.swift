//
//  main.swift
//  Magic8Ball
//
//  Created by Russell Gordon on 2021-09-16.
//

import Foundation

// Make an instance of the view model (to store questions and advice)
var advisor = AdviceViewModel()

// Program name
print("MAGIC 8 BALL")
print("============")

// Loop until user chooses to quit
while true {
    
    // Ask for user's question
    print("""
    NOTE: Questions should be phrased such
          that they can be answered with a
          yes or no response.
    """)
    print("What is your question? ")
    
    // Get input as a non-optional String
    let input = readLine()!
    print("")

    // Provide the advice by using the view model
    print(advisor.provideResponseFor(givenQuery: input))
    
    // Ask whether the user wants to continue or see history of advice
    while true {
        print("")
        print("See history of advice given? (Y/N)")
        let selection = readLine()!
        if selection == "Y" {
            
            // Show history
            print("")
            print("History")
            print("-------")
            for session in advisor.sessions {
                print(session.question)
                print(session.response)
                print("")
            }
            break
            
        } else if selection == "N" {
            break
        }
    }
    
    // Ask whether the user wants to see more advice
    while true {
        print("More advice? (Y/N)")
        let selection = readLine()!
        if selection == "Y" {
            break
        } else if selection == "N" {
            exit(0) // Exit program
        }
    }
    
}
