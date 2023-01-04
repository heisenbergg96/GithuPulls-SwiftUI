//
//  Layout.swift
//  SwitfUIPOC
//
//  Created by Vikhyath Shetty on 12/12/22.
//

import SwiftUI


struct Layout: View {
    var body: some View {
        Text("Hello, World!")
            .padding(20)
            .background(.red)
    }
}


struct Layout_Previews: PreviewProvider {
    static var previews: some View {
        Layout()
    }
}

struct SomeView: View {
    @State var counter = 0
    var body: some View {
        VStack {
            Button(action: { self.counter += 1 }, label: {
                Text("Tap me!")
                    .padding()
                    .background(Color(.tertiarySystemFill))
                    .cornerRadius(5)
            })
            
            Button(action: { self.counter += 1 }, label: {
                Text("Tap me!")
                    .padding()
                    .background(Color(.tertiarySystemFill))
                    .cornerRadius(5)
            })
            
            if counter > 0 {
                Text("You've tapped \(counter) times")
            } else {
                Text("You've not yet tapped")
            }
        }.debug()
        
//        Button()
    }
}

//VStack<
//    TupleView<
//        (
//            Button<
//                ModifiedContent<
//                    ModifiedContent<
//                        ModifiedContent<
//                            Text,
//                            _PaddingLayout
//                        >,
//                        _BackgroundModifier<Color>
//                >,
//                _ClipEffect<RoundedRectangle>
//                >
//            >,
//            _ConditionalContent<Text, Text>
//        )
//    >
//>

extension View {
    func debug() -> Self {
        print(Mirror(reflecting: self).subjectType)
        return self
    }
}
