//
//  main.swift
//  lesson3
//
//  Created by Антон Сивцов on 21.12.2020.
//

import Foundation

enum BrandSport {
    case Porshe, Ferrari, Bugatti
}

enum BrandTrunk {
    case Volvo, Man, Daf
}

enum ReleaseYear {
    case year2020, year2019, year2018
}

enum Windows: String {
    case open = "открыты"
    case closed = "закрыты"
}

enum TrunkOccupancy: String {
    case full = "полный"
    case empty = "пустой"
}

struct SportCar {
    var brand: BrandSport
    let releaseYear: ReleaseYear
    var trunkVolume: Double
    var engine: Bool {
        didSet {
            if engine == true {
                print("Двигатель сейчас запущен")
            } else {
            print("Двигатель сейчас заглушен")
            }
        }
        willSet {
            if engine == true {
                print("Двигатель был запущен")
            } else {
                print("Двигатель был заглушен")
            }
        }
    }
    var windows: Windows {
        didSet {
            print("Окна машины сейчас \(windows.rawValue)")
        }
        willSet {
            print("Окна машины были \(windows.rawValue)")
        }
    }
    var trunkOccupancy: TrunkOccupancy {
        didSet {
            print("Багажник был \(trunkOccupancy.rawValue)")
        }
        willSet {
            print("Багажник был \(trunkOccupancy.rawValue)")
        }
    }
}

struct TrunkCar {
    var brand: BrandTrunk
    let releaseYear: ReleaseYear
    var trunkVolume: Double
    var engine: Bool {
        didSet {
            if engine == true {
                print("Двигатель сейчас запущен")
            } else {
                print("Двигатель сейчас заглушен")
            }
        }
        willSet {
            if engine == true {
                print("Двигатель был запущен")
            } else {
                print("Двигатель был заглушен")
            }
        }
    }
    var windows: Windows {
        didSet {
            print("Окна грузовика сейчас \(windows.rawValue)")
        }
        willSet {
            print("Окна грузовика были \(windows.rawValue)")
        }
    }
    var trunkOccupancy: TrunkOccupancy {
        didSet {
            print("Багажник был \(trunkOccupancy.rawValue)")
        }
        willSet {
            print("Багажник был \(trunkOccupancy.rawValue)")
        }
    }
    mutating func mode(windows: Windows) {
        self.windows = windows
    }
    init(brand: BrandTrunk, releaseYear: ReleaseYear, trunkVolume: Double, engine: Bool, windows: Windows, trunkOccupancy: TrunkOccupancy) {
        self.brand = brand
        self.releaseYear = releaseYear
        self.trunkVolume = trunkVolume
        self.engine = engine
        self.windows = windows
        self.trunkOccupancy = trunkOccupancy
    }
}

var sportCar = SportCar(brand: .Porshe, releaseYear: .year2020, trunkVolume: 120, engine: true, windows: .closed, trunkOccupancy: .empty)

var trunkCar = TrunkCar(brand: .Volvo, releaseYear: .year2018, trunkVolume: 1000, engine: false, windows: .closed, trunkOccupancy: .full)

sportCar.windows = .open
sportCar.engine = false
sportCar.trunkOccupancy = .full
trunkCar.mode(windows: .open)
var trunkCar2 = trunkCar
trunkCar2.mode(windows: .closed)
trunkCar2.brand = .Man
trunkCar2.trunkOccupancy = .empty
trunkCar2.trunkVolume = 3000
print(sportCar, trunkCar, trunkCar2)
