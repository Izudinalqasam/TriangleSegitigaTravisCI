//
//  TriangleSegitigaTests.swift
//  TriangleSegitigaTests
//
//  Created by izzudin on 07/12/20.
//

import XCTest
@testable import TriangleSegitiga

class TriangleSegitigaTests: XCTestCase {
    
    func testInvalidInputSides() {
        XCTAssertThrowsError(try detectTriangle(-1, 2, 3)) { error in
            XCTAssertEqual(error as? TriangleError, TriangleError.invalidInput)
        }
    }
    
    func testDetectEquilateralTriangle() {
        XCTAssertEqual(try detectTriangle(2, 2, 2), "Segitiga Sama Sisi")
    }
    
    func testDetectIsoscelesTriangle() {
        XCTAssertEqual(try detectTriangle(8, 8, 10), "Segitiga Sama Kaki")
        XCTAssertEqual(try detectTriangle(8, 10, 8), "Segitiga Sama Kaki")
        XCTAssertEqual(try detectTriangle(8, 10, 10), "Segitiga Sama Kaki")
        XCTAssertEqual(try detectTriangle(10, 8, 10), "Segitiga Sama Kaki")
    }
    
    func testDetectRandomTriangle() {
        XCTAssertEqual(try detectTriangle(3, 5, 7), "Segitiga Sembarang")
    }
    
    func testInequalityTriangle() {
        XCTAssertThrowsError(try detectTriangle(4, 1, 2)) { error in
            XCTAssertEqual(error as? TriangleError, TriangleError.inequalityInput)
        }
        XCTAssertThrowsError(try detectTriangle(5, 1, 3)) { error in
            XCTAssertEqual(error as? TriangleError, TriangleError.inequalityInput)
        }
    }
    
    func testDetectPythagorasTriagnle() {
        XCTAssertEqual(try detectTriangle(6, 8, 10), "Segitiga Siku-siku")
    }
    
    func detectTriangle(
        _ sideA: Int,
        _ sideB: Int,
        _ sideC: Int
    ) throws -> String {
        let sides = [sideA, sideB, sideC].sorted()
        
        for side in sides {
            if side < 0 {
                throw TriangleError.invalidInput
            }
        }
        
        if (sides[0] + sides[1]) <= sides[2] {
            throw TriangleError.inequalityInput
        } else if sideA == sideB && sideB == sideC {
            return "Segitiga Sama Sisi"
        } else if sides[0] == sides[1] || sides[1] == sides[2] {
            return "Segitiga Sama Kaki"
        } else if Double(sides[0] * sides[0] + sides[1] * sides[1]).squareRoot() == Double(sides[2]){
            return "Segitiga Siku-siku"
        } else {
            return "Segitiga Sembarang"
        }
    }
    
    enum TriangleError: Error {
        case invalidInput, inequalityInput
    }
}
