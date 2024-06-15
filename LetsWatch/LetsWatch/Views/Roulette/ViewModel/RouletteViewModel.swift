//
//  RouletteViewModel.swift
//  LetsWatch
//
//  Created by Диас Сайынов on 10.06.2024.
//

import SwiftUI

class RouletteViewModel: ObservableObject {
    @Published var selectedMovie: Movie?
    @Published var isSpinning: Bool = true
    
    func spinWheel(cards: [Card], currentRotation: CGFloat, spinValue: Int, completion: @escaping (Movie) -> Void) {
        // Calculate the normalized rotation within a full circle
        let normalizedRotation = currentRotation.truncatingRemainder(dividingBy: 360)
        
        // Calculate starting point of first index
        var start = 90 + (360 / (2 * cards.count))
        start = start + Int(normalizedRotation)
        let end = start + (360 / cards.count)
        
        if let sliceIndex = findSegmentIndex(for: 180, segmentsCount: cards.count, startIndex: CGFloat(start), endIndex: CGFloat(end)) {
            let topMovie = cards[sliceIndex].movie
            // Simulate some delay for spinning effect
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.selectedMovie = topMovie
                self.isSpinning = false
                completion(topMovie)
            }
        } else {
            print("Angle 180 is not within any segment range")
        }
    }
    
    func findSegmentIndex(for angle: CGFloat, segmentsCount: Int, startIndex: CGFloat, endIndex: CGFloat) -> Int? {
        let segmentAngle = 360.0 / CGFloat(segmentsCount)
        
        // Initialize variables to store the starting and ending angles for each segment
        var segments: [(start: CGFloat, end: CGFloat)] = []
        var startAngle = startIndex
        var endAngle = endIndex
        
        for i in 0..<segmentsCount {
            // Adjust the last segment's end angle to wrap around
            if endAngle > 360 {
                endAngle -= 360
            }
            segments.append((start: startAngle, end: endAngle))
            startAngle = endAngle
            endAngle += segmentAngle
        }
        
        // Find the segment index for the given angle
        for (index, segment) in segments.enumerated() {
            if angle >= segment.start && angle < segment.end {
                return index
            }
        }
        
        return nil
    }
}
