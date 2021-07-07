//
//  Hospital.swift
//  Delegate
//
//  Created by Harbros47 on 6.01.21.
//

import Foundation

enum Affliction {
    case cough
    case headache
    case soreThroat
    case arm
    case leg
    case stomach
    case head
    }

protocol DoctorDelegate: class {
    var name: String { get }
    
    func takePill() -> String
    func makeShot() -> String
}

protocol Pacient {
    
    var name: String { get }
    var temperature: Double { get }
    var affliction: Affliction { get }
    var appraisal: Bool { get }
    var delegate: DoctorDelegate? { get set }
    var getWorse: Bool { get }
}

class Developer: Pacient {
    var name: String
    var temperature: Double
    var affliction: Affliction
    var appraisal = Bool.random()
    var getWorse = Bool.random()
    weak var delegate: DoctorDelegate?
    
    init(name: String, temperature: Double, affliction: Affliction, delegate: DoctorDelegate) {
        self.name = name
        self.temperature = temperature
        self.delegate = delegate
        self.affliction = affliction
    }
}

class Dancer: Pacient {
    var name: String
    var temperature: Double
    var affliction: Affliction
    var appraisal = Bool.random()
    var getWorse = Bool.random()
    weak var delegate: DoctorDelegate?
    
    init(name: String, temperature: Double, affliction: Affliction, delegate: DoctorDelegate) {
        self.name = name
        self.temperature = temperature
        self.delegate = delegate
        self.affliction = affliction
    }
}

class Student: Pacient {
    var name: String
    var temperature: Double
    var affliction: Affliction
    var getWorse = Bool.random()
    var appraisal = Bool.random()
    weak var delegate: DoctorDelegate?
    
    init(name: String, temperature: Double, affliction: Affliction, delegate: DoctorDelegate) {
        self.name = name
        self.temperature = temperature
        self.delegate = delegate
        self.affliction = affliction
    }
}

class Doctor: DoctorDelegate {
    var name = "Смирнов П.К."
    
    func takePill() -> String {
         "Дать таблетку"
    }
    func makeShot() -> String {
         "Дать укол"
    }
    func report (hurtsArm: [String], hurtsLeg: [String], hurtsStomach: [String], hurtsHead: [String]) {
        print( """
                        Рапорт
        Сегодня пациенты жаловались на различные боли в различных частях тела:
          Пациенты, у которых болит рука: \(hurtsArm)
          Пациенты, у которых болит нога: \(hurtsLeg)
          Пациенты, у которых болит живот: \(hurtsStomach)
          Пациенты, у которых болит голова: \(hurtsHead)
            
        """)
    }
}

class FriendDoctor: DoctorDelegate {
    var name = "Попов Е.Р."
    
    func takePill() -> String {
         "Дать шоколадную конфету"
    }
    func makeShot() -> String {
         "Дать мятную конфету"
    }
}

class FriendDoctor1: DoctorDelegate {
    var name = "Дятлов А.С."
    
    func takePill() -> String {
         "Сделать чай"
    }
    func makeShot() -> String {
         "Сделать кофе"
    }
}
