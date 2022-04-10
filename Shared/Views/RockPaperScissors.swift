//
//  Part2.swift
//  100Days (iOS)
//
//  Created by 叶思凡 on 2022/3/27.
//

import SwiftUI
import Combine

enum Zhao: String, CaseIterable {
    case rock = "👊"
    case paper = "🖐"
    case scissors = "✌️"

    init(_ num: Int) {
        if num == 0 {
            self = Self.rock
        } else if num == 1 {
            self = Self.paper
        } else {
            self = Self.scissors
        }
    }

    func play(_ left: Self?) -> Int {
        guard let left = left else {
            return 1
        }

        if self == left { return 0 }

        switch self {
        case Self.paper:
            if left == Self.rock {
                return 1
            } else {
                return -1
            }
        case Self.rock:
            if left == Self.scissors {
                return 1
            } else {
                return -1
            }
        case Self.scissors:
            if left == Self.paper {
                return 1
            } else {
                return -1
            }
        }
    }

}

struct Score: View {
    var score = [0, 0]
    var body: some View {
        HStack {
            Text("🥰 \(score[0])").padding()
            Text("🤖 \(score[1])").padding()
            Spacer()
        }
    }
}

struct Game: View {
    var zhao: Zhao?

    @State private(set) var iter = 0
    @State private var isActive = true

    let timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    let willResignActiveNotification =
        NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)
    let willEnterForegroundNotification =
        NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)

    var random: Zhao {
        if let zhao = zhao {
            return zhao
        } else {
            return Zhao(iter%3)
        }
    }

    var body: some View {
        Text(random.rawValue)
            .font(.custom("big", size: 80))
            .onReceive(timer) { _ in
                if isActive {
                    iter += 1
                }
            }
            .onReceive(willResignActiveNotification) { _ in
                isActive = false
            }
            .onReceive(willEnterForegroundNotification) { _ in
                isActive = true
            }
    }
}

struct RockPaperScissors: View {
    @State private var score = [0, 0]
    @State private var gamerZhao: Zhao?
    @State private var robotZhao: Zhao?
    @State private var showResult = false

    private var gameResult: Int? {
        gamerZhao?.play(robotZhao)
    }

    func play(_ zhao: Zhao) {
        gamerZhao = zhao
        robotZhao = Zhao(Int.random(in: 0...2))
    }

    var body: some View {
        VStack {
            Score(score: score)
            VStack {
                Game(zhao: robotZhao, iter: 1)
                Spacer()
                Text("VS").font(.custom("big", size: 80)).foregroundColor(.blue)
                Spacer()
                Game(zhao: gamerZhao)
                Spacer()
            }
            HStack {
                ForEach(Zhao.allCases, id: \.self) {item in
                    Button {
                        gamerZhao = item
                        robotZhao = Zhao(Int.random(in: 0...2))
                        showResult = true
                        if gameResult == 1 {
                            score[0] += 1
                        } else if gameResult == -1 {
                            score[1] += 1
                        }
                    } label: {
                        Text(item.rawValue)
                            .font(.title)
                            .padding(.horizontal, 20)
                    }
                    .padding()
                    .buttonStyle(.borderedProminent)
                }

            }
        }
        .alert("look who WIN!", isPresented: $showResult) {
            Button("OK") {
                gamerZhao = nil
                robotZhao = nil
            }
        } message: {
            Text(gameResult == 1 ? "🎉 YOU WIN!" : gameResult == -1 ? "YOU LOSE!" : "LOVE&PEACE")
        }
        .navigationTitle("RockPaperScissors")
        .navigationBarTitleDisplayMode(.inline)
    }

}

struct RockPaperScissors_Previews: PreviewProvider {
    static var previews: some View {
        RockPaperScissors()
    }
}
