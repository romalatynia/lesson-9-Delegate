//
//  ViewController.swift
//  Delegate
//
//  Created by Harbros47 on 6.01.21.
//

import UIKit

class ViewController: UIViewController {
    
    private var hurtsArm: [String] = []
    private var hurtsLeg: [String] = []
    private var hurtsStomach: [String] = []
    private var hurtsHead: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let doctor = Doctor()
        let friendDoctor = FriendDoctor()
        let frendDoctor1 = FriendDoctor1()
        let doctors: [DoctorDelegate] = [
            doctor,
            friendDoctor,
            frendDoctor1
        ]
        let affliction: [Affliction] = [
            .cough,
            .headache,
            .soreThroat,
            .arm,
            .head,
            .leg,
            .stomach
        ]
        let student = Student(
            name: "Максим",
            temperature: 36.6,
            affliction: affliction.randomElement() ?? .arm,
            delegate: doctors.randomElement() ?? doctor
        )
        let developer = Developer(
            name: "Филипп",
            temperature: 37.8,
            affliction: affliction.randomElement() ?? .arm,
            delegate: doctors.randomElement() ?? doctor
        )
        let dancer = Dancer(
            name: "Никита",
            temperature: 39.0,
            affliction: affliction.randomElement() ?? .arm,
            delegate: doctors.randomElement() ?? doctor
        )
        
        let pacients: [Pacient] = [
            student,
            developer,
            dancer
        ]
        
        therapy(pacients: pacients)
        bodyParts(pacients: pacients)
        doctor.report(hurtsArm: hurtsArm, hurtsLeg: hurtsLeg, hurtsStomach: hurtsStomach, hurtsHead: hurtsHead)
        appraisalDoctor(pacients: pacients, doctors: doctors)
        newDay(pacients: pacients)
    }
    
    private func therapy(pacients: [Pacient]) {
        for treatment in pacients {
            guard treatment.getWorse else { return }
            print("""

            Лечащий врач \(treatment.delegate?.name ?? "Без имени")
            Имя пациента \(treatment.name)
            Доктор, я плохо себя чувствую.
            Померять температуру \(treatment.temperature)
            """
            )
            if treatment.temperature > 36.6 {
                print("\(treatment.delegate?.takePill() ?? "Таблетки закончились") жаропонижающую")
            }
            switch treatment.affliction {
            case .cough:
                print("""
                        Доктор, У меня кашель. Кх-кх!
                        \(treatment.delegate?.takePill() ?? "Таблетки закончились") от кашля
                        """)
            case .headache:
                print("""
                        Доктор, У меня болит голова.
                        \(treatment.delegate?.makeShot() ?? "уколов нет")
                        """)
            case .soreThroat:
                print("""
                        Доктор, У меня болит горло.
                        \(treatment.delegate?.takePill() ?? "Таблетки закончились")
                        """)
            default:
                continue
            }
        }
    }
    
    private func bodyParts(pacients: [Pacient]) {
        
        for complaint in pacients {
            switch complaint.affliction {
            case .arm:
                print("Доктор, у меня болит рука.")
                hurtsArm.append(complaint.name)
            case .leg:
                print("Доктор, у меня болит нога.")
                hurtsLeg.append(complaint.name)
            case .stomach:
                print("Доктор, у меня болит живот.")
                hurtsStomach.append(complaint.name)
            case .head:
                print("Доктор, у меня болит голова.")
                hurtsHead.append(complaint.name)
            default:
                continue
            }
        }
    }
    
    private func appraisalDoctor(pacients: [Pacient], doctors: [DoctorDelegate]) {
        for var appraisals in pacients {
            guard !appraisals.appraisal else {
                print("\(appraisals.name) очень доволен лечением своего доктора")
                return
            }
            appraisals.delegate = doctors[0]
            print("\(appraisals.name) не доволен лечением своего доктора")
        }
    }
    
    private func newDay(pacients: [Pacient]) {
        pacients.forEach {print("На следующий день \($0.delegate?.name  ?? "") лечащий врач у \($0.name)")}
    }
}
