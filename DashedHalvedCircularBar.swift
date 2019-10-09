//
//  DashedHalfedCircularBar.swift
//  ProgressBars
//
//  Created by BLCKBIRDS on 04.10.19.
//  Copyright © 2019 BLCKBIRDS. All rights reserved.
//

import SwiftUI

struct DashedHalvedCircularBar: View {
    
    @Binding var circleProgress: CGFloat
    
    var width: CGFloat
    var labelSize: CGFloat?
    var dashColor: Color
    var progressColor: Color
    var showLabel: Bool?
    var lineWidth: CGFloat?
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .trim(from: 0.0, to: 0.5)
                    .stroke(self.dashColor, style: StrokeStyle(lineWidth: self.lineWidth ?? 12.0, dash: [8]))
                    .frame(width: geometry.size.width, height: geometry.size.width)
                    .rotationEffect(Angle(degrees: -180))
                Circle()
                    .trim(from: 0.0, to: self.circleProgress/2)
                    .stroke(self.progressColor, lineWidth: self.lineWidth ?? 12.0)
                    .frame(width: geometry.size.width, height: geometry.size.width)
                    .rotationEffect(Angle(degrees: -180))
                if self.showLabel ?? true {
                    Text("\(Int(self.circleProgress*100))%")
                        .font(.custom("HelveticaNeue", size: self.labelSize ?? 20.0))
                        .frame(width: geometry.size.width, height: geometry.size.height)
                }
            }
        }
            .frame(width: width, height: width)
    }
}

struct DashedHalvedCircularBar_Previews: PreviewProvider {
    static var previews: some View {
        DashedHalvedCircularBar(circleProgress: .constant(0.2), width: 400, labelSize: 20.0, dashColor: .red, progressColor: .red, showLabel: true, lineWidth: 12.0)
    }
}
