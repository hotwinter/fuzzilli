// Copyright 2019 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/// A mutator takes an existing program and mutates it in some way, thus producing a new program.
public class Mutator {
    /// Number of semantically valid samples produced by this mutator.
    private var correctSamplesProduced = 0.0
    /// Number of semantically invalid samples produced by this mutator.
    private var incorrectSamplesProduced = 0.0
    
    /// Informs this mutator that it produced a semantically valid sample.
    public func producedValidSample() {
        correctSamplesProduced += 1
    }
    /// Informs this mutator that it produced a semantically invalid sample.
    public func producedInvalidSample() {
        incorrectSamplesProduced += 1
    }
    
    /// The current correctness rate of this mutator.
    public var correctnessRate: Double {
        let totalSamplesProduced = correctSamplesProduced + incorrectSamplesProduced
        guard totalSamplesProduced > 0 else { return 1.0 }
        return correctSamplesProduced / totalSamplesProduced
    }
    
    /// Mutates the given program.
    ///
    /// - Parameters:
    ///   - program: The program to mutate.
    ///   - fuzzer: The fuzzer context for the mutation.
    /// - Returns: The mutated program or nil if the given program could not be mutated.
    public func mutate(_ program: Program, for fuzzer: Fuzzer) -> Program? {
        fatalError()
    }
    
    /// The name of this mutator.
    public var name: String {
        return String(describing: type(of: self))
    }
}
