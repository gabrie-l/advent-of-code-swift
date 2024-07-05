// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation

let path = "example"
var fileContents: String = ""
do {
    fileContents = try String(contentsOfFile: path, encoding: .utf8)
} catch {
    print("Error: \(error)")
}

var lines = fileContents.components(separatedBy: "\n")

var tmp_list: [Int] = []
var calorie_list: [Int] = []
for line in lines {
    if !line.isEmpty {
        tmp_list.append(Int(line) ?? 0)
    } else {
        calorie_list.append(tmp_list.reduce(0) { $0 + $1 })
        tmp_list = []
    }
}

print(calorie_list.max() ?? 0)
calorie_list.sort()
print("Top 3 \(calorie_list.suffix(3))")
var finalsum = calorie_list.suffix(3)
print("Sum of Top 3: \(finalsum.reduce(0) { $0 + $1 })")
