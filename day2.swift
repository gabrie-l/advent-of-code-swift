import Foundation

let fileURL = URL(fileURLWithPath: "input")
var contents: [String] = []
do {
    contents = try String(contentsOf: fileURL, encoding: .utf8).components(separatedBy: .newlines)
} catch {
    print("Error \(error)")
}

let opp: [String: String] = ["A": "Rock", "B": "Paper", "C": "Scissors"]
let my_play: [String: String] = ["X": "Rock", "Y": "Paper", "Z": "Scissors"]
let scores: [String: Int] = ["Rock": 1, "Paper": 2, "Scissors": 3]

contents.removeLast()
print(contents)
var count: Int = 0
for line in contents {
    let game = line.split(separator: " ")
    var p1 = String(game[0]), p2 = String(game[1])
    switch p2 {
    // needs to be a tie
    case "Y":
        switch opp[p1] {
        case "Rock":
            p2 = "X"
        case "Paper":
            p2 = "Y"
        default:
            p2 = "Z"
        }

    // needs to be a loss
    case "X":
        switch opp[p1] {
        case "Rock":
            p2 = "Z"
        case "Paper":
            p2 = "X"
        default:
            p2 = "Y"
        }
    // needs to be a win
    default:
        switch opp[p1] {
        case "Rock":
            p2 = "Y"
        case "Paper":
            p2 = "Z"
        default:
            p2 = "X"
        }
    }

    if opp[p1] == my_play[p2] {
        count += 3 + (scores[my_play[p2]!] ?? 0)
        continue
    }
    var machine_won = false

    switch opp[p1] {
    case "Rock":
        if my_play[p2] == "Scissors" {
            machine_won = true
        }
    case "Scissors":
        if my_play[p2] == "Paper" {
            machine_won = true
        }
    default:
        if my_play[p2] == "Rock" {
            machine_won = true
        }
    }
    print(p2, p1)

    if !machine_won {
        count += 6 + (scores[my_play[p2]!] ?? 0)
    } else {
        count += (scores[my_play[p2]!] ?? 0)
    }
}

print(count)
