![FMI.jl Logo](https://github.com/JuliaFMI/FMI.jl/blob/main/logo/dark/fmijl_logo_640_320.png?raw=true "FMI.jl Logo")
# FMICore.jl

## What is FMICore.jl?
[*FMICore.jl*](https://github.com/JuliaFMI/FMICore.jl) implements the low-level equivalents of the C-functions and C-data types of the FMI-standard ([fmi-standard.org](http://fmi-standard.org/)) for the Julia programming language. 

| | |
|---|---|
| Documentation | [![Dev Docs](https://img.shields.io/badge/docs-dev-blue.svg)](https://juliafmi.github.io/FMI.jl/dev/) |
| Tests | [![Test (latest)](https://github.com/JuliaFMI/FMICore.jl/actions/workflows/TestLatest.yml/badge.svg)](https://github.com/JuliaFMI/FMICore.jl/actions/workflows/TestLatest.yml) [![Test (LTS)](https://github.com/JuliaFMI/FMICore.jl/actions/workflows/TestLTS.yml/badge.svg)](https://github.com/JuliaFMI/FMICore.jl/actions/workflows/TestLTS.yml) |
| Package evaluation | [![Run PkgEval](https://github.com/JuliaFMI/FMICore.jl/actions/workflows/Eval.yml/badge.svg)](https://github.com/JuliaFMI/FMICore.jl/actions/workflows/Eval.yml) |
| Code coverage | [![Coverage](https://codecov.io/gh/JuliaFMI/FMICore.jl/branch/main/graph/badge.svg)](https://app.codecov.io/gh/JuliaFMI/FMICore.jl) |
| Collaboration | [![ColPrac: Contributor's Guide on Collaborative Practices for Community Packages](https://img.shields.io/badge/ColPrac-Contributor's%20Guide-blueviolet)](https://github.com/SciML/ColPrac) |
| Formatting | [![Code Style: JuliaFormatter](https://img.shields.io/badge/code%20style-JuliaFormatter-9558b2)](https://github.com/domluna/JuliaFormatter.jl) |

## How can I use FMICore.jl?
**Please note:** [*FMICore.jl*](https://github.com/JuliaFMI/FMICore.jl) is not meant to be used as it is, but as part of [*FMI.jl*](https://github.com/JuliaFMI/FMI.jl), [*FMIImport.jl*](https://github.com/JuliaFMI/FMIImport.jl), [*FMIExport.jl*](https://github.com/JuliaFMI/FMIExport.jl) and [*FMIFlux.jl*](https://github.com/JuliaFMI/FMIFlux.jl). However you can install [*FMICore.jl*](https://github.com/JuliaFMI/FMICore.jl) by following these steps.

1\. Open a Julia-REPL, switch to package mode using `]`, activate your preferred environment.

2\. Install [*FMICore.jl*](https://github.com/JuliaFMI/FMICore.jl):
```julia-repl
(@v1) pkg> add FMICore
```

3\. If you want to check that everything works correctly, you can run the tests bundled with [*FMICore.jl*](https://github.com/JuliaFMI/FMICore.jl):
```julia-repl
(@v1) pkg> test FMICore
```

## What FMI.jl library should I use?
![FMI.jl Family](https://github.com/JuliaFMI/FMI.jl/blob/main/docs/src/assets/FMI_JL_family.png?raw=true "FMI.jl Family")
To keep dependencies nice and clean, the original package [*FMI.jl*](https://github.com/JuliaFMI/FMI.jl) had been split into new packages:
- [*FMI.jl*](https://github.com/JuliaFMI/FMI.jl): High level loading, manipulating, saving or building entire FMUs from scratch
- [*FMIImport.jl*](https://github.com/JuliaFMI/FMIImport.jl): Importing FMUs into Julia
- [*FMIExport.jl*](https://github.com/JuliaFMI/FMIExport.jl): Exporting stand-alone FMUs from Julia Code
- [*FMIBase.jl*](https://github.com/JuliaFMI/FMIBase.jl): Common concepts for import and export of FMUs
- [*FMICore.jl*](https://github.com/JuliaFMI/FMICore.jl): C-code wrapper for the FMI standard
- [*FMISensitivity.jl*](https://github.com/JuliaFMI/FMISensitivity.jl): Static and dynamic sensitivities over FMUs
- [*FMIBuild.jl*](https://github.com/JuliaFMI/FMIBuild.jl): Compiler/Compilation dependencies for FMIExport.jl
- [*FMIFlux.jl*](https://github.com/JuliaFMI/FMIFlux.jl): Machine Learning with FMUs
- [*FMIZoo.jl*](https://github.com/JuliaFMI/FMIZoo.jl): A collection of testing and example FMUs

## What platforms are supported?
[*FMICore.jl*](https://github.com/JuliaFMI/FMICore.jl) is tested (and testing) under Julia *LTS* and *latest* on Windows *latest* and Ubuntu *latest* (`x64` and `x86`) and on macOS *latest* (`aarch64`).

## How to cite?
Tobias Thummerer, Lars Mikelsons and Josef Kircher. 2021. **NeuralFMU: towards structural integration of FMUs into neural networks.** Martin Sjölund, Lena Buffoni, Adrian Pop and Lennart Ochel (Ed.). Proceedings of 14th Modelica Conference 2021, Linköping, Sweden, September 20-24, 2021. Linköping University Electronic Press, Linköping (Linköping Electronic Conference Proceedings ; 181), 297-306. [DOI: 10.3384/ecp21181297](https://doi.org/10.3384/ecp21181297)

## Related publications?
Tobias Thummerer, Johannes Stoljar and Lars Mikelsons. 2022. **NeuralFMU: presenting a workflow for integrating hybrid NeuralODEs into real-world applications.** Electronics 11, 19, 3202. [DOI: 10.3390/electronics11193202](https://doi.org/10.3390/electronics11193202)

Tobias Thummerer, Johannes Tintenherr, Lars Mikelsons. 2021. **Hybrid modeling of the human cardiovascular system using NeuralFMUs** Journal of Physics: Conference Series 2090, 1, 012155. [DOI: 10.1088/1742-6596/2090/1/012155](https://doi.org/10.1088/1742-6596/2090/1/012155)

## Notes for contributors
Contributors are welcome. Before contributing, please read, understand and follow the [Contributor's Guide on Collaborative Practices for Community Packages](https://github.com/SciML/ColPrac).
During development of new implementations or optimizations on existing code, one will have to make design decisions that influence the library performance and usability. The following prioritization should be the basis for decision-making:
- **#1 Compliance with standard:** It is the highest priority to be compliant with the FMI standard ([fmi-standard.org](https://fmi-standard.org/)). Identifiers described in the standard must be used. Structures and topologies should follow the specification as far as the possibilities of the Julia programming language allows.
- **#2 Performance:** Because the [*FMI.jl*](https://github.com/JuliaFMI/FMI.jl) family is used for simulation, performance is very important. This applies to the efficient use of CPU and GPU, but also the conscientious use of RAM and disc space.
- **#3 Usability:** The library should be as usable as possible and feel "the Julia way" (e.g. by using multiple dispatch instead of the "C coding style"), as long as being fully compliant with the FMI standard.
