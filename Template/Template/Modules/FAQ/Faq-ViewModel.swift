//
//  Faq-ViewModel.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 7/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class FaqViewModel: ViewModel {
    let questions: [FAQ]
    
    init() {
        questions =  [
            FAQ(question: "Que es CleanApp",
                answer: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer consectetur porta ligula, id tristique dolor pellentesque volutpat. Vestibulum nec lacus at urna elementum hendrerit. Fusce semper luctus vestibulum. Donec posuere ultrices massa ac tincidunt. Quisque pretium vestibulum nisl, vel sagittis quam lobortis ac. Sed mollis dolor felis, sed congue nisi maximus viverra. Sed ante tortor, porttitor a tincidunt a, rhoncus quis lacus."),
            FAQ(question: "Que ofrece CleanApp",
                answer: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer consectetur porta ligula, id tristique dolor pellentesque volutpat. Vestibulum nec lacus at urna elementum hendrerit. Fusce semper luctus vestibulum. Donec posuere ultrices massa ac tincidunt. Quisque pretium vestibulum nisl, vel sagittis quam lobortis ac. Sed mollis dolor felis, sed congue nisi maximus viverra. Sed ante tortor, porttitor a tincidunt a, rhoncus quis lacus."),
            FAQ(question: "Como usar CleanApp",
                answer: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer consectetur porta ligula, id tristique dolor pellentesque volutpat. Vestibulum nec lacus at urna elementum hendrerit. Fusce semper luctus vestibulum. Donec posuere ultrices massa ac tincidunt. Quisque pretium vestibulum nisl, vel sagittis quam lobortis ac. Sed mollis dolor felis, sed congue nisi maximus viverra. Sed ante tortor, porttitor a tincidunt a, rhoncus quis lacus."),
            FAQ(question: "Limpia tu casa",
                answer: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer consectetur porta ligula, id tristique dolor pellentesque volutpat. Vestibulum nec lacus at urna elementum hendrerit. Fusce semper luctus vestibulum. Donec posuere ultrices massa ac tincidunt. Quisque pretium vestibulum nisl, vel sagittis quam lobortis ac. Sed mollis dolor felis, sed congue nisi maximus viverra. Sed ante tortor, porttitor a tincidunt a, rhoncus quis lacus."),
            FAQ(question: "Privacidad",
                answer: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer consectetur porta ligula, id tristique dolor pellentesque volutpat. Vestibulum nec lacus at urna elementum hendrerit. Fusce semper luctus vestibulum. Donec posuere ultrices massa ac tincidunt. Quisque pretium vestibulum nisl, vel sagittis quam lobortis ac. Sed mollis dolor felis, sed congue nisi maximus viverra. Sed ante tortor, porttitor a tincidunt a, rhoncus quis lacus.")
        ]
    }
}
