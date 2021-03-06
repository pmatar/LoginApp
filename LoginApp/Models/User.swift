//
//  User.swift
//  LoginApp
//
//  Created by Paul Matar on 11.03.2022.
//

struct User {
     let username: String
     let password: String
     let person: Person
    
     static func setUser() -> User {
        User(username: "user", password: "password",
             person: Person.getPerson())
    }
}

struct Person {
     let name: String
     let surname: String
     let age: Int
     let city: String
     let education: String
     let languages: String
     let info: String
 
     let image: String
            
     var desciption: String {
"""
Name: \(name)
Surname: \(surname)
Age: \(age)
City: \(city)
Education: \(education)
Languages: \(languages)
Info: \(info)
"""
     }
            
     var fullName: String {
         "\(name) \(surname)"
     }
    
    static func getPerson() -> Person {
        Person(name: "Paul",
               surname: "Matar",
               age: 29,
               city: "Krasnodar",
               education: "Economics",
               languages: "Russian, English, Arabic",
               info: "My name is Paul and I want to become iOS developer to have the possibility to work abroad.",
               image: "photo")
    }
}
