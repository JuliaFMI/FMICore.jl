#
# Copyright (c) 2021 Tobias Thummerer, Lars Mikelsons, Josef Kircher
# Licensed under the MIT license. See LICENSE file in the project root for details.
#

"""
Source: FMISpec3.0, Version D5ef1c1: 2.4.7. Definition of Model Variables
                                     
A fmi3Variable describes the the type, name, valueRefence and optional information for every variable in the Modeldescription.
"""
abstract type fmi3Variable end
export fmi3Variable

""" 
Mutable Struct representing existance and kind of dependencies of an Unknown on Known Variables.

See also FMI3.0.1 Spec [fig 30]
"""
mutable struct fmi3VariableDependency
    # mandatory 
    index::UInt

    # optional
    dependencies::Union{Array{UInt,1},Nothing}
    dependenciesKind::Union{Array{fmi3DependencyKind,1},Nothing}

    # Constructor 
    function fmi3VariableDependency(index)
        inst = new()
        inst.index = index
        inst.dependencies = nothing
        inst.dependenciesKind = nothing
        return inst
    end
end
export fmi3VariableDependency

# Custom helper, not part of the FMI-Spec. 
fmi3Unknown = fmi3VariableDependency

mutable struct fmi3VariableFloat32 <: fmi3Variable
    # common attributes

    # mandatory
    name::String
    valueReference::fmi3ValueReference
    causality::fmi3Causality
    variability::fmi3Variability

    # Optional
    description::Union{String,Nothing}
    canHandleMultipleSetPerTimeInstant::Union{Bool,Nothing}
    annotations::Union{fmi3Annotation,Nothing}
    clocks::Union{Array{fmi3ValueReference},Nothing}

    # type specific attributes
    intermediateUpdate::Union{Bool,Nothing}
    previous::Union{fmi3ValueReference,Nothing}
    initial::Union{fmi3Initial,Nothing}
    quantity::Union{String,Nothing}
    unit::Union{String,Nothing}
    displayUnit::Union{String,Nothing}
    declaredType::Union{String,Nothing}
    relativeQuantity::Union{Bool,Nothing}
    min::Union{fmi3Float32,Nothing}
    max::Union{fmi3Float32,Nothing}
    nominal::Union{fmi3Float32,Nothing}
    unbounded::Union{fmi3Boolean,Nothing}
    start::Union{fmi3Float32,Nothing}
    derivative::Union{fmi3ValueReference,Nothing}
    reinit::Union{Bool,Nothing}

    # dependencies 
    dependencies::Any #::Array{fmi3Int32}
    dependenciesKind::Any #::Array{fmi3String}

    # Constructor for not further specified ModelVariable
    function fmi3VariableFloat32(name::String, valueReference::fmi3ValueReference)
        inst = new()
        inst.name = name
        inst.valueReference = valueReference
        inst.description = ""
        inst.causality = fmi3CausalityLocal
        inst.variability = fmi3VariabilityContinuous

        inst.canHandleMultipleSetPerTimeInstant = fmi3False
        inst.clocks = nothing
        inst.annotations = nothing

        inst.intermediateUpdate = fmi3False
        inst.previous = nothing
        inst.initial = fmi3InitialCalculated
        inst.quantity = nothing
        inst.unit = nothing
        inst.displayUnit = nothing
        inst.declaredType = nothing
        inst.relativeQuantity = nothing
        inst.min = nothing
        inst.max = nothing
        inst.nominal = 1.0
        inst.unbounded = nothing
        inst.start = nothing
        inst.derivative = nothing
        inst.reinit = nothing
        return inst
    end
end

mutable struct fmi3VariableFloat64 <: fmi3Variable
    # common attributes

    # mandatory
    name::String
    valueReference::fmi3ValueReference
    causality::fmi3Causality
    variability::fmi3Variability

    # Optional
    description::Union{String,Nothing}
    canHandleMultipleSetPerTimeInstant::Union{fmi3Boolean,Nothing}
    annotations::Union{fmi3Annotation,Nothing}
    clocks::Union{Array{fmi3ValueReference},Nothing}

    # type specific attributes
    intermediateUpdate::Union{Bool,Nothing}
    previous::Union{fmi3ValueReference,Nothing}
    initial::Union{fmi3Initial,Nothing}
    quantity::Union{String,Nothing}
    unit::Union{String,Nothing}
    displayUnit::Union{String,Nothing}
    declaredType::Union{String,Nothing}
    relativeQuantity::Union{Bool,Nothing}
    min::Union{fmi3Float64,Nothing}
    max::Union{fmi3Float64,Nothing}
    nominal::Union{fmi3Float64,Nothing}
    unbounded::Union{fmi3Boolean,Nothing}
    start::Union{fmi3Float64,Nothing}
    derivative::Union{fmi3ValueReference,Nothing}
    reinit::Union{Bool,Nothing}

    # dependencies 
    dependencies::Any #::Array{fmi3Int32}
    dependenciesKind::Any #::Array{fmi3String}

    # Constructor for not further specified ModelVariable
    function fmi3VariableFloat64(name::String, valueReference::fmi3ValueReference)
        inst = new()
        inst.name = name
        inst.valueReference = valueReference
        inst.description = ""
        inst.causality = fmi3CausalityLocal
        inst.variability = fmi3VariabilityContinuous

        inst.canHandleMultipleSetPerTimeInstant = fmi3False
        inst.clocks = nothing
        inst.annotations = nothing

        inst.intermediateUpdate = fmi3False
        inst.previous = nothing
        inst.initial = fmi3InitialCalculated
        inst.quantity = nothing
        inst.unit = nothing
        inst.displayUnit = nothing
        inst.declaredType = nothing
        inst.relativeQuantity = nothing
        inst.min = nothing
        inst.max = nothing
        inst.nominal = 1.0
        inst.unbounded = nothing
        inst.start = nothing
        inst.derivative = nothing
        inst.reinit = nothing
        return inst
    end
end

mutable struct fmi3VariableInt8 <: fmi3Variable
    # common attributes

    # mandatory
    name::String
    valueReference::fmi3ValueReference
    causality::fmi3Causality
    variability::fmi3Variability

    # Optional
    description::Union{String,Nothing}
    canHandleMultipleSetPerTimeInstant::Union{fmi3Boolean,Nothing}
    annotations::Union{fmi3Annotation,Nothing}
    clocks::Union{Array{fmi3ValueReference},Nothing}

    # type specific attributes
    intermediateUpdate::Union{Bool,Nothing}
    previous::Union{fmi3ValueReference,Nothing}
    initial::Union{fmi3Initial,Nothing}
    quantity::Union{String,Nothing}
    declaredType::Union{String,Nothing}
    min::Union{fmi3Int8,Nothing}
    max::Union{fmi3Int8,Nothing}
    start::Union{fmi3Int8,Nothing}

    # dependencies 
    dependencies::Any #::Array{fmi3Int32}
    dependenciesKind::Any #::Array{fmi3String}

    # Constructor for not further specified ModelVariable
    function fmi3VariableInt8(name::String, valueReference::fmi3ValueReference)
        inst = new()
        inst.name = name
        inst.valueReference = valueReference
        inst.description = ""
        inst.causality = fmi3CausalityLocal
        inst.variability = fmi3VariabilityContinuous

        inst.canHandleMultipleSetPerTimeInstant = fmi3False
        inst.clocks = nothing
        inst.annotations = nothing

        inst.intermediateUpdate = fmi3False
        inst.previous = nothing
        inst.initial = fmi3InitialCalculated
        inst.quantity = nothing
        inst.declaredType = nothing
        inst.min = nothing
        inst.max = nothing
        inst.start = nothing
        return inst
    end
end

mutable struct fmi3VariableUInt8 <: fmi3Variable
    # common attributes

    # mandatory
    name::String
    valueReference::fmi3ValueReference
    causality::fmi3Causality
    variability::fmi3Variability

    # Optional
    description::Union{String,Nothing}
    canHandleMultipleSetPerTimeInstant::Union{fmi3Boolean,Nothing}
    annotations::Union{fmi3Annotation,Nothing}
    clocks::Union{Array{fmi3ValueReference},Nothing}

    # type specific attributes
    intermediateUpdate::Union{Bool,Nothing}
    previous::Union{fmi3ValueReference,Nothing}
    initial::Union{fmi3Initial,Nothing}
    quantity::Union{String,Nothing}
    declaredType::Union{String,Nothing}
    min::Union{fmi3UInt8,Nothing}
    max::Union{fmi3UInt8,Nothing}
    start::Union{fmi3UInt8,Nothing}

    # dependencies 
    dependencies::Any #::Array{fmi3Int32}
    dependenciesKind::Any #::Array{fmi3String}

    # Constructor for not further specified ModelVariable
    function fmi3VariableUInt8(name::String, valueReference::fmi3ValueReference)
        inst = new()
        inst.name = name
        inst.valueReference = valueReference
        inst.description = ""
        inst.causality = fmi3CausalityLocal
        inst.variability = fmi3VariabilityContinuous

        inst.canHandleMultipleSetPerTimeInstant = fmi3False
        inst.clocks = nothing
        inst.annotations = nothing

        inst.intermediateUpdate = fmi3False
        inst.previous = nothing
        inst.initial = fmi3InitialCalculated
        inst.quantity = nothing
        inst.declaredType = nothing
        inst.min = nothing
        inst.max = nothing
        inst.start = nothing
        return inst
    end
end

mutable struct fmi3VariableInt16 <: fmi3Variable
    # common attributes

    # mandatory
    name::String
    valueReference::fmi3ValueReference
    causality::fmi3Causality
    variability::fmi3Variability

    # Optional
    description::Union{String,Nothing}
    canHandleMultipleSetPerTimeInstant::Union{fmi3Boolean,Nothing}
    annotations::Union{fmi3Annotation,Nothing}
    clocks::Union{Array{fmi3ValueReference},Nothing}

    # type specific attributes
    intermediateUpdate::Union{Bool,Nothing}
    previous::Union{fmi3ValueReference,Nothing}
    initial::Union{fmi3Initial,Nothing}
    quantity::Union{String,Nothing}
    declaredType::Union{String,Nothing}
    min::Union{fmi3Int16,Nothing}
    max::Union{fmi3Int16,Nothing}
    start::Union{fmi3Int16,Nothing}

    # dependencies 
    dependencies::Any #::Array{fmi3Int32}
    dependenciesKind::Any #::Array{fmi3String}

    # Constructor for not further specified ModelVariable
    function fmi3VariableInt16(name::String, valueReference::fmi3ValueReference)
        inst = new()
        inst.name = name
        inst.valueReference = valueReference
        inst.description = ""
        inst.causality = fmi3CausalityLocal
        inst.variability = fmi3VariabilityContinuous

        inst.canHandleMultipleSetPerTimeInstant = fmi3False
        inst.clocks = nothing
        inst.annotations = nothing

        inst.intermediateUpdate = fmi3False
        inst.previous = nothing
        inst.initial = fmi3InitialCalculated
        inst.quantity = nothing
        inst.declaredType = nothing
        inst.min = nothing
        inst.max = nothing
        inst.start = nothing
        return inst
    end
end

mutable struct fmi3VariableUInt16 <: fmi3Variable
    # common attributes

    # mandatory
    name::String
    valueReference::fmi3ValueReference
    causality::fmi3Causality
    variability::fmi3Variability

    # Optional
    description::Union{String,Nothing}
    canHandleMultipleSetPerTimeInstant::Union{fmi3Boolean,Nothing}
    annotations::Union{fmi3Annotation,Nothing}
    clocks::Union{Array{fmi3ValueReference},Nothing}

    # type specific attributes
    intermediateUpdate::Union{Bool,Nothing}
    previous::Union{fmi3ValueReference,Nothing}
    initial::Union{fmi3Initial,Nothing}
    quantity::Union{String,Nothing}
    declaredType::Union{String,Nothing}
    min::Union{fmi3UInt16,Nothing}
    max::Union{fmi3UInt16,Nothing}
    start::Union{fmi3UInt16,Nothing}

    # dependencies 
    dependencies::Any #::Array{fmi3Int32}
    dependenciesKind::Any #::Array{fmi3String}

    # Constructor for not further specified ModelVariable
    function fmi3VariableUInt16(name::String, valueReference::fmi3ValueReference)
        inst = new()
        inst.name = name
        inst.valueReference = valueReference
        inst.description = ""
        inst.causality = fmi3CausalityLocal
        inst.variability = fmi3VariabilityContinuous

        inst.canHandleMultipleSetPerTimeInstant = fmi3False
        inst.clocks = nothing
        inst.annotations = nothing

        inst.intermediateUpdate = fmi3False
        inst.previous = nothing
        inst.initial = fmi3InitialCalculated
        inst.quantity = nothing
        inst.declaredType = nothing
        inst.min = nothing
        inst.max = nothing
        inst.start = nothing
        return inst
    end
end

mutable struct fmi3VariableInt32 <: fmi3Variable
    # common attributes

    # mandatory
    name::String
    valueReference::fmi3ValueReference
    causality::fmi3Causality
    variability::fmi3Variability

    # Optional
    description::Union{String,Nothing}
    canHandleMultipleSetPerTimeInstant::Union{fmi3Boolean,Nothing}
    annotations::Union{fmi3Annotation,Nothing}
    clocks::Union{Array{fmi3ValueReference},Nothing}

    # type specific attributes
    intermediateUpdate::Union{Bool,Nothing}
    previous::Union{fmi3ValueReference,Nothing}
    initial::Union{fmi3Initial,Nothing}
    quantity::Union{String,Nothing}
    declaredType::Union{String,Nothing}
    min::Union{fmi3Int32,Nothing}
    max::Union{fmi3Int32,Nothing}
    start::Union{fmi3Int32,Nothing}

    # dependencies 
    dependencies::Any #::Array{fmi3Int32}
    dependenciesKind::Any #::Array{fmi3String}

    # Constructor for not further specified ModelVariable
    function fmi3VariableInt32(name::String, valueReference::fmi3ValueReference)
        inst = new()
        inst.name = name
        inst.valueReference = valueReference
        inst.description = ""
        inst.causality = fmi3CausalityLocal
        inst.variability = fmi3VariabilityContinuous

        inst.canHandleMultipleSetPerTimeInstant = fmi3False
        inst.clocks = nothing
        inst.annotations = nothing

        inst.intermediateUpdate = fmi3False
        inst.previous = nothing
        inst.initial = fmi3InitialCalculated
        inst.quantity = nothing
        inst.declaredType = nothing
        inst.min = nothing
        inst.max = nothing
        inst.start = nothing
        return inst
    end
end

mutable struct fmi3VariableUInt32 <: fmi3Variable
    # common attributes

    # mandatory
    name::String
    valueReference::fmi3ValueReference
    causality::fmi3Causality
    variability::fmi3Variability

    # Optional
    description::Union{String,Nothing}
    canHandleMultipleSetPerTimeInstant::Union{fmi3Boolean,Nothing}
    annotations::Union{fmi3Annotation,Nothing}
    clocks::Union{Array{fmi3ValueReference},Nothing}

    # type specific attributes
    intermediateUpdate::Union{Bool,Nothing}
    previous::Union{fmi3ValueReference,Nothing}
    initial::Union{fmi3Initial,Nothing}
    quantity::Union{String,Nothing}
    declaredType::Union{String,Nothing}
    min::Union{fmi3UInt32,Nothing}
    max::Union{fmi3UInt32,Nothing}
    start::Union{fmi3UInt32,Nothing}

    # dependencies 
    dependencies::Any #::Array{fmi3Int32}
    dependenciesKind::Any #::Array{fmi3String}

    # Constructor for not further specified ModelVariable
    function fmi3VariableUInt32(name::String, valueReference::fmi3ValueReference)
        inst = new()
        inst.name = name
        inst.valueReference = valueReference
        inst.description = ""
        inst.causality = fmi3CausalityLocal
        inst.variability = fmi3VariabilityContinuous

        inst.canHandleMultipleSetPerTimeInstant = fmi3False
        inst.clocks = nothing
        inst.annotations = nothing

        inst.intermediateUpdate = fmi3False
        inst.previous = nothing
        inst.initial = fmi3InitialCalculated
        inst.quantity = nothing
        inst.declaredType = nothing
        inst.min = nothing
        inst.max = nothing
        inst.start = nothing
        return inst
    end
end

mutable struct fmi3VariableInt64 <: fmi3Variable
    # common attributes

    # mandatory
    name::String
    valueReference::fmi3ValueReference
    causality::fmi3Causality
    variability::fmi3Variability

    # Optional
    description::Union{String,Nothing}
    canHandleMultipleSetPerTimeInstant::Union{fmi3Boolean,Nothing}
    annotations::Union{fmi3Annotation,Nothing}
    clocks::Union{Array{fmi3ValueReference},Nothing}

    # type specific attributes
    intermediateUpdate::Union{Bool,Nothing}
    previous::Union{fmi3ValueReference,Nothing}
    initial::Union{fmi3Initial,Nothing}
    quantity::Union{String,Nothing}
    declaredType::Union{String,Nothing}
    min::Union{fmi3Int64,Nothing}
    max::Union{fmi3Int64,Nothing}
    start::Union{fmi3Int64,Nothing}

    # dependencies 
    dependencies::Any #::Array{fmi3Int32}
    dependenciesKind::Any #::Array{fmi3String}

    # Constructor for not further specified ModelVariable
    function fmi3VariableInt64(name::String, valueReference::fmi3ValueReference)
        inst = new()
        inst.name = name
        inst.valueReference = valueReference
        inst.description = ""
        inst.causality = fmi3CausalityLocal
        inst.variability = fmi3VariabilityContinuous

        inst.canHandleMultipleSetPerTimeInstant = fmi3False
        inst.clocks = nothing
        inst.annotations = nothing

        inst.intermediateUpdate = fmi3False
        inst.previous = nothing
        inst.initial = fmi3InitialCalculated
        inst.quantity = nothing
        inst.declaredType = nothing
        inst.min = nothing
        inst.max = nothing
        inst.start = nothing
        return inst
    end
end

mutable struct fmi3VariableUInt64 <: fmi3Variable
    # common attributes

    # mandatory
    name::String
    valueReference::fmi3ValueReference
    causality::fmi3Causality
    variability::fmi3Variability

    # Optional
    description::Union{String,Nothing}
    canHandleMultipleSetPerTimeInstant::Union{fmi3Boolean,Nothing}
    annotations::Union{fmi3Annotation,Nothing}
    clocks::Union{Array{fmi3ValueReference},Nothing}

    # type specific attributes
    intermediateUpdate::Union{Bool,Nothing}
    previous::Union{fmi3ValueReference,Nothing}
    initial::Union{fmi3Initial,Nothing}
    quantity::Union{String,Nothing}
    declaredType::Union{String,Nothing}
    min::Union{fmi3UInt64,Nothing}
    max::Union{fmi3UInt64,Nothing}
    start::Union{fmi3UInt64,Nothing}

    # dependencies 
    dependencies::Any #::Array{fmi3Int32}
    dependenciesKind::Any #::Array{fmi3String}

    # Constructor for not further specified ModelVariable
    function fmi3VariableUInt64(name::String, valueReference::fmi3ValueReference)
        inst = new()
        inst.name = name
        inst.valueReference = valueReference
        inst.description = ""
        inst.causality = fmi3CausalityLocal
        inst.variability = fmi3VariabilityContinuous

        inst.canHandleMultipleSetPerTimeInstant = fmi3False
        inst.clocks = nothing
        inst.annotations = nothing

        inst.intermediateUpdate = fmi3False
        inst.previous = nothing
        inst.initial = fmi3InitialCalculated
        inst.quantity = nothing
        inst.declaredType = nothing
        inst.min = nothing
        inst.max = nothing
        inst.start = nothing
        return inst
    end
end

mutable struct fmi3VariableBoolean <: fmi3Variable
    # common attributes

    # mandatory
    name::String
    valueReference::fmi3ValueReference
    causality::fmi3Causality
    variability::fmi3Variability

    # Optional
    description::Union{String,Nothing}
    canHandleMultipleSetPerTimeInstant::Union{fmi3Boolean,Nothing}
    annotations::Union{fmi3Annotation,Nothing}
    clocks::Union{Array{fmi3ValueReference},Nothing}

    # type specific attributes
    intermediateUpdate::Union{Bool,Nothing}
    previous::Union{fmi3ValueReference,Nothing}
    initial::Union{fmi3Initial,Nothing}
    declaredType::Union{String,Nothing}
    start::Union{fmi3Boolean,Nothing}

    # dependencies 
    dependencies::Any #::Array{fmi3Int32}
    dependenciesKind::Any #::Array{fmi3String}

    # Constructor for not further specified ModelVariable
    function fmi3VariableBoolean(name::String, valueReference::fmi3ValueReference)
        inst = new()
        inst.name = name
        inst.valueReference = valueReference
        inst.description = ""
        inst.causality = fmi3CausalityLocal
        inst.variability = fmi3VariabilityContinuous

        inst.canHandleMultipleSetPerTimeInstant = fmi3False
        inst.clocks = nothing
        inst.annotations = nothing

        inst.intermediateUpdate = fmi3False
        inst.previous = nothing
        inst.initial = fmi3InitialCalculated
        inst.declaredType = nothing
        inst.start = nothing
        return inst
    end
end

mutable struct fmi3VariableString <: fmi3Variable
    # common attributes

    # mandatory
    name::String
    valueReference::fmi3ValueReference
    causality::fmi3Causality
    variability::fmi3Variability

    # Optional
    description::Union{String,Nothing}
    canHandleMultipleSetPerTimeInstant::Union{fmi3Boolean,Nothing}
    annotations::Union{fmi3Annotation,Nothing}
    clocks::Union{Array{fmi3ValueReference},Nothing}

    # type specific attributes
    start::Union{String,Nothing}

    # dependencies 
    dependencies::Any #::Array{fmi3Int32}
    dependenciesKind::Any #::Array{fmi3String}

    # Constructor for not further specified ModelVariable
    function fmi3VariableString(name::String, valueReference::fmi3ValueReference)
        inst = new()
        inst.name = name
        inst.valueReference = valueReference
        inst.description = ""
        inst.causality = fmi3CausalityLocal
        inst.variability = fmi3VariabilityContinuous

        inst.canHandleMultipleSetPerTimeInstant = fmi3False
        inst.clocks = nothing
        inst.annotations = nothing

        inst.start = nothing
        return inst
    end
end

mutable struct fmi3VariableBinary <: fmi3Variable
    # common attributes

    # mandatory
    name::String
    valueReference::fmi3ValueReference
    causality::fmi3Causality
    variability::fmi3Variability

    # Optional
    description::Union{String,Nothing}
    canHandleMultipleSetPerTimeInstant::Union{fmi3Boolean,Nothing}
    annotations::Union{fmi3Annotation,Nothing}
    clocks::Union{Array{fmi3ValueReference},Nothing}

    # type specific attributes
    intermediateUpdate::Union{Bool,Nothing}
    previous::Union{fmi3ValueReference,Nothing}
    initial::Union{fmi3Initial,Nothing}
    declaredType::Union{String,Nothing}
    mimeType::String
    maxSize::Union{Unsigned,Nothing}
    start::Union{fmi3Binary,Nothing}

    # dependencies 
    dependencies::Any #::Array{fmi3Int32}
    dependenciesKind::Any #::Array{fmi3String}

    # Constructor for not further specified ModelVariable
    function fmi3VariableBinary(name::String, valueReference::fmi3ValueReference)
        inst = new()
        inst.name = name
        inst.valueReference = valueReference
        inst.description = ""
        inst.causality = fmi3CausalityLocal
        inst.variability = fmi3VariabilityContinuous

        inst.canHandleMultipleSetPerTimeInstant = fmi3False
        inst.clocks = nothing
        inst.annotations = nothing

        inst.intermediateUpdate = fmi3False
        inst.previous = nothing
        inst.initial = fmi3InitialCalculated
        inst.declaredType = nothing
        inst.mimeType = "application/octet-stream"
        inst.maxSize = nothing
        inst.start = nothing
        return inst
    end
end

mutable struct fmi3VariableClock <: fmi3Variable
    # common attributes

    # mandatory
    name::String
    valueReference::fmi3ValueReference
    causality::fmi3Causality
    variability::fmi3Variability

    # Optional
    description::Union{String,Nothing}
    canHandleMultipleSetPerTimeInstant::Union{fmi3Boolean,Nothing}
    annotations::Union{fmi3Annotation,Nothing}
    clocks::Union{Array{fmi3ValueReference},Nothing}

    # type specific attributes
    declaredType::Union{String,Nothing}
    canBeDeactivated::Bool
    priority::Union{Unsigned,Nothing}
    intervalVariability::Union{String,Nothing} # TODO might need to get a own enum for clock type
    intervalDecimal::Union{Real,Nothing}
    shiftDecimal::Union{Real,Nothing}
    supportsFraction::Bool
    resolution::Union{Unsigned,Nothing}
    intervalCounter::Union{Unsigned,Nothing}
    shiftCounter::Union{Unsigned,Nothing}

    # dependencies 
    dependencies::Any #::Array{fmi3Int32}
    dependenciesKind::Any #::Array{fmi3String}

    # Constructor for not further specified ModelVariable
    function fmi3VariableClock(name::String, valueReference::fmi3ValueReference)
        inst = new()
        inst.name = name
        inst.valueReference = valueReference
        inst.description = ""
        inst.causality = fmi3CausalityLocal
        inst.variability = fmi3VariabilityContinuous

        inst.canHandleMultipleSetPerTimeInstant = fmi3False
        inst.clocks = nothing
        inst.annotations = nothing

        inst.declaredType = nothing
        inst.canBeDeactivated = false
        inst.priority = nothing
        inst.intervalVariability = nothing
        inst.intervalDecimal = nothing
        inst.shiftDecimal = nothing
        inst.supportsFraction = nothing
        inst.resolution = nothing
        inst.intervalCounter = nothing
        inst.shiftCounter = nothing
        return inst
    end
end

mutable struct fmi3VariableEnumeration <: fmi3Variable
    # common attributes

    # mandatory
    name::String
    valueReference::fmi3ValueReference
    causality::fmi3Causality
    variability::fmi3Variability

    # Optional
    description::Union{String,Nothing}
    canHandleMultipleSetPerTimeInstant::Union{fmi3Boolean,Nothing}
    annotations::Union{fmi3Annotation,Nothing}
    clocks::Union{Array{fmi3ValueReference},Nothing}

    # type specific attributes
    intermediateUpdate::Union{Bool,Nothing}
    previous::Union{fmi3ValueReference,Nothing}
    initial::Union{fmi3Initial,Nothing}
    quantity::Union{String,Nothing}
    declaredType::Union{String,Nothing}
    min::Union{fmi3Int64,Nothing}
    max::Union{fmi3Int64,Nothing}
    start::Union{fmi3Int64,Nothing}

    # dependencies 
    dependencies::Any # ToDo: Typing!    ::Array{fmi3Int32}
    dependenciesKind::Any # ToDo: Typing!    ::Array{fmi3String}

    # Constructor for not further specified ModelVariable
    function fmi3VariableEnumeration(name::String, valueReference::fmi3ValueReference)
        inst = new()
        inst.name = name
        inst.valueReference = valueReference
        inst.description = ""
        inst.causality = fmi3CausalityLocal
        inst.variability = fmi3VariabilityContinuous

        inst.canHandleMultipleSetPerTimeInstant = fmi3False
        inst.clocks = nothing
        inst.annotations = nothing

        inst.intermediateUpdate = fmi3False
        inst.previous = nothing
        inst.initial = fmi3InitialCalculated
        inst.quantity = nothing
        inst.declaredType = nothing
        inst.min = nothing
        inst.max = nothing
        inst.start = nothing
        return inst
    end
end

# Custom helper, not part of the FMI-Spec. 
mutable struct fmi3ModelDescriptionDefaultExperiment
    startTime::Union{Real,Nothing}
    stopTime::Union{Real,Nothing}
    tolerance::Union{Real,Nothing}
    stepSize::Union{Real,Nothing}

    # Constructor 
    function fmi3ModelDescriptionDefaultExperiment()
        inst = new()
        inst.startTime = nothing
        inst.stopTime = nothing
        inst.tolerance = nothing
        inst.stepSize = nothing
        return inst
    end
end

# Custom helper, not part of the FMI-Spec. 
mutable struct fmi3ModelDescriptionLogCategories
    name::String
    description::Union{String,Nothing}

    # Constructor 
    function fmi3ModelDescriptionLogCategories(name::String)
        inst = new()
        inst.name = name
        inst.description = nothing
        return inst
    end
end

# Custom helper, not part of the FMI-Spec. 
mutable struct fmi3ModelDescriptionClockType
    name::String
    description::Union{String,Nothing}
    canBeDeactivated::Union{Bool,Nothing}
    priority::Union{UInt,Nothing}
    intervalVariability::Any # TODO type
    intervalDecimal::Union{Real,Nothing}
    shiftDecimal::Union{Real,Nothing}
    supportsFraction::Union{Bool,Nothing}
    resolution::Union{UInt64,Nothing}
    intervalCounter::Union{UInt64,Nothing}
    shiftCounter::Union{UInt64,Nothing}

    # Constructor 
    function fmi3ModelDescriptionClockType(name::String)
        inst = new()
        inst.name = name
        inst.description = nothing
        inst.canBeDeactivated = nothing
        inst.priority = nothing
        inst.intervallDecimal = nothing
        inst.shiftDecimal = nothing
        inst.supportsFraction = nothing
        inst.resolution = nothing
        inst.intervalCounter = nothing
        inst.shiftCounter = nothing
        return inst
    end
end

# Custom helper, not part of the FMI-Spec. 
mutable struct fmi3ModelDescriptionModelStructure
    outputs::Union{Array{fmi3VariableDependency,1},Nothing}
    continuousStateDerivatives::Union{Array{fmi3VariableDependency,1},Nothing}
    clockedStates::Union{Array{fmi3VariableDependency,1},Nothing}
    initialUnknowns::Union{Array{fmi3Unknown,1},Nothing}
    eventIndicators::Union{Array{fmi3VariableDependency,1},Nothing}

    # Constructor 
    function fmi3ModelDescriptionModelStructure()
        inst = new()
        inst.outputs = nothing
        inst.continuousStateDerivatives = nothing
        inst.clockedStates = nothing
        inst.initialUnknowns = nothing
        inst.eventIndicators = nothing
        return inst
    end
end

# Custom helper, not part of the FMI-Spec.
mutable struct fmi3ModelDescriptionModelExchange
    # mandatory
    modelIdentifier::String

    # optional
    needsExecutionTool::Union{Bool,Nothing}
    canBeInstantiatedOnlyOncePerProcess::Union{Bool,Nothing}
    canGetAndSetFMUState::Union{Bool,Nothing}
    canSerializeFMUState::Union{Bool,Nothing}
    providesDirectionalDerivatives::Union{Bool,Nothing}
    providesAdjointDerivatives::Union{Bool,Nothing}
    providesPerElementDependencies::Union{Bool,Nothing}
    needsCompletedIntegratorStep::Union{Bool,Nothing}
    providesEvaluateDiscreteStates::Union{Bool,Nothing}

    # constructor 
    function fmi3ModelDescriptionModelExchange()
        inst = new()
        return inst
    end

    function fmi3ModelDescriptionModelExchange(modelIdentifier::String)
        inst = fmi3ModelDescriptionModelExchange()
        inst.modelIdentifier = modelIdentifier
        inst.needsExecutionTool = nothing
        inst.canBeInstantiatedOnlyOncePerProcess = nothing
        inst.canGetAndSetFMUState = nothing
        inst.canSerializeFMUState = nothing
        inst.providesDirectionalDerivatives = nothing
        inst.providesAdjointDerivatives = nothing
        inst.providesPerElementDependencies = nothing
        inst.needsCompletedIntegratorStep = nothing
        inst.providesEvaluateDiscreteStates = nothing
        return inst
    end
end

# Custom helper, not part of the FMI-Spec.
mutable struct fmi3ModelDescriptionCoSimulation
    # mandatory
    modelIdentifier::String

    # optional
    needsExecutionTool::Union{Bool,Nothing}
    canBeInstantiatedOnlyOncePerProcess::Union{Bool,Nothing}
    canGetAndSetFMUState::Union{Bool,Nothing}
    canSerializeFMUState::Union{Bool,Nothing}
    providesDirectionalDerivatives::Union{Bool,Nothing}
    providesAdjointDerivatives::Union{Bool,Nothing}
    providesPerElementDependencies::Union{Bool,Nothing}
    needsCompletedIntegratorStep::Union{Bool,Nothing}
    providesEvaluateDiscreteStates::Union{Bool,Nothing}
    canHandleVariableCommunicationStepSize::Union{Bool,Nothing}
    fixedInternalStepSize::Union{Real,Nothing}
    recommendedIntermediateInputSmoothness::Union{Int,Nothing}
    maxOutputDerivativeOrder::Union{UInt,Nothing}
    providesIntermediateUpdate::Union{Bool,Nothing}
    mightReturnEarlyFromDoStep::Union{Bool,Nothing}
    canReturnEarlyAfterIntermediateUpdate::Union{Bool,Nothing}
    hasEventMode::Union{Bool,Nothing}
    canInterpolateInputs::Union{Bool,Nothing}

    # constructor 
    function fmi3ModelDescriptionCoSimulation()
        inst = new()
        return inst
    end

    function fmi3ModelDescriptionCoSimulation(modelIdentifier::String)
        inst = fmi3ModelDescriptionCoSimulation()
        inst.modelIdentifier = modelIdentifier
        inst.needsExecutionTool = nothing
        inst.canBeInstantiatedOnlyOncePerProcess = nothing
        inst.canGetAndSetFMUState = nothing
        inst.canSerializeFMUState = nothing
        inst.providesDirectionalDerivatives = nothing
        inst.providesAdjointDerivatives = nothing
        inst.providesPerElementDependencies = nothing
        inst.needsCompletedIntegratorStep = nothing
        inst.providesEvaluateDiscreteStates = nothing
        inst.needsCompletedIntegratorStep = nothing
        inst.canHandleVariableCommunicationStepSize = nothing
        inst.fixedInternalStepSize = nothing
        inst.recommendedIntermediateInputSmoothness = nothing
        inst.maxOutputDerivativeOrder = nothing
        inst.providesIntermediateUpdate = nothing
        inst.mightReturnEarlyFromDoStep = nothing
        inst.canReturnEarlyAfterIntermediateUpdate = nothing
        inst.hasEventMode = nothing
        return inst
    end
end

# Custom helper, not part of the FMI-Spec.
mutable struct fmi3ModelDescriptionScheduledExecution
    # mandatory
    modelIdentifier::String

    # optional
    needsExecutionTool::Union{Bool,Nothing}
    canBeInstantiatedOnlyOncePerProcess::Union{Bool,Nothing}
    canGetAndSetFMUState::Union{Bool,Nothing}
    canSerializeFMUState::Union{Bool,Nothing}
    providesDirectionalDerivatives::Union{Bool,Nothing}
    providesAdjointDerivatives::Union{Bool,Nothing}
    providesPerElementDependencies::Union{Bool,Nothing}

    # constructor 
    function fmi3ModelDescriptionScheduledExecution()
        inst = new()
        return inst
    end

    function fmi3ModelDescriptionScheduledExecution(modelIdentifier::String)
        inst = fmi3ModelDescriptionScheduledExecution()
        inst.modelIdentifier = modelIdentifier
        inst.needsExecutionTool = nothing
        inst.canBeInstantiatedOnlyOncePerProcess = nothing
        inst.canGetAndSetFMUState = nothing
        inst.canSerializeFMUState = nothing
        inst.providesDirectionalDerivatives = nothing
        inst.providesAdjointDerivatives = nothing
        inst.providesPerElementDependencies = nothing
        return inst
    end
end

"""
Source: FMISpec3.0.2: 2.4.3. Physical Units

    fmi3BaseUnit(; kg, m, s, A, K, mol, cd, rad, factor, offset)

The optional element `BaseUnit` of an `fmi3Unit`: the exponents of the SI base units (`kg`, `m`, `s`, `A`, `K`, `mol`, `cd`) and the radian (`rad`), and `factor` and `offset` of the conversion to the base units.
Attributes that are `nothing` are not defined (the default is `0`, `1` for `factor`).
"""
mutable struct fmi3BaseUnit
    # exponents of the SI base units
    kg::Union{Int32,Nothing} # kilogram
    m::Union{Int32,Nothing} # meter
    s::Union{Int32,Nothing} # second
    A::Union{Int32,Nothing} # ampere
    K::Union{Int32,Nothing} # kelvin
    mol::Union{Int32,Nothing} # mole
    cd::Union{Int32,Nothing} # candela
    rad::Union{Int32,Nothing} # radian

    factor::Union{Float64,Nothing}
    offset::Union{Float64,Nothing}

    function fmi3BaseUnit(;
        kg = nothing,
        m = nothing,
        s = nothing,
        A = nothing,
        K = nothing,
        mol = nothing,
        cd = nothing,
        rad = nothing,
        factor = nothing,
        offset = nothing,
    )
        return new(kg, m, s, A, K, mol, cd, rad, factor, offset)
    end
end
export fmi3BaseUnit

"""
Source: FMISpec3.0.2: 2.4.3. Physical Units

    fmi3DisplayUnit(name; factor, offset, inverse)

The optional elements `DisplayUnit` of an `fmi3Unit`.
Attributes that are `nothing` are not defined (the default is `1` for `factor`, `0` for `offset` and `false` for `inverse`).
"""
mutable struct fmi3DisplayUnit
    # mandatory
    name::String

    # optional
    factor::Union{Float64,Nothing}
    offset::Union{Float64,Nothing}
    inverse::Union{Bool,Nothing}

    function fmi3DisplayUnit(
        name::String;
        factor = nothing,
        offset = nothing,
        inverse = nothing,
    )
        return new(name, factor, offset, inverse)
    end
end
export fmi3DisplayUnit

"""
Source: FMISpec3.0.2: 2.4.3. Physical Units

    fmi3Unit(name, baseUnit = nothing, displayUnits = fmi3DisplayUnit[])

The elements `Unit` of the element `UnitDefinitions` of an FMU.
"""
mutable struct fmi3Unit
    # mandatory
    name::String

    # optional
    baseUnit::Union{fmi3BaseUnit,Nothing}
    displayUnits::Vector{fmi3DisplayUnit}

    function fmi3Unit(
        name::String,
        baseUnit::Union{fmi3BaseUnit,Nothing} = nothing,
        displayUnits::Vector{fmi3DisplayUnit} = fmi3DisplayUnit[],
    )
        return new(name, baseUnit, displayUnits)
    end
end
export fmi3Unit

"""
Source: FMISpec3.0.2: 2.4.4. Variable Types

The type definitions (element `TypeDefinitions`) of an FMU, one subtype per element, e.g. `fmi3Float64Type` for `Float64Type`.
The fields are the attributes of the element, attributes that are `nothing` are not defined.
"""
abstract type fmi3SimpleType end
export fmi3SimpleType

"""
Source: FMISpec3.0.2: 2.4.4. Variable Types

    fmi3FloatType{T}(name)

The type definitions `Float32Type` and `Float64Type` (`fmi3Float32Type` and `fmi3Float64Type`).
"""
mutable struct fmi3FloatType{T<:Union{fmi3Float32,fmi3Float64}} <: fmi3SimpleType
    # mandatory
    name::String

    # optional
    description::Union{String,Nothing}
    quantity::Union{String,Nothing}
    unit::Union{String,Nothing}
    displayUnit::Union{String,Nothing}
    relativeQuantity::Union{Bool,Nothing}
    unbounded::Union{Bool,Nothing}
    min::Union{T,Nothing}
    max::Union{T,Nothing}
    nominal::Union{T,Nothing}

    function fmi3FloatType{T}(name::String) where {T}
        return new{T}(
            name,
            nothing,
            nothing,
            nothing,
            nothing,
            nothing,
            nothing,
            nothing,
            nothing,
            nothing,
        )
    end
end
const fmi3Float32Type = fmi3FloatType{fmi3Float32}
const fmi3Float64Type = fmi3FloatType{fmi3Float64}
export fmi3FloatType, fmi3Float32Type, fmi3Float64Type

"""
Source: FMISpec3.0.2: 2.4.4. Variable Types

    fmi3IntegerType{T}(name)

The type definitions `Int8Type` to `UInt64Type` (`fmi3Int8Type` to `fmi3UInt64Type`).
"""
mutable struct fmi3IntegerType{
    T<:Union{
        fmi3Int8,
        fmi3UInt8,
        fmi3Int16,
        fmi3UInt16,
        fmi3Int32,
        fmi3UInt32,
        fmi3Int64,
        fmi3UInt64,
    },
} <: fmi3SimpleType
    # mandatory
    name::String

    # optional
    description::Union{String,Nothing}
    quantity::Union{String,Nothing}
    min::Union{T,Nothing}
    max::Union{T,Nothing}

    function fmi3IntegerType{T}(name::String) where {T}
        return new{T}(name, nothing, nothing, nothing, nothing)
    end
end
const fmi3Int8Type = fmi3IntegerType{fmi3Int8}
const fmi3UInt8Type = fmi3IntegerType{fmi3UInt8}
const fmi3Int16Type = fmi3IntegerType{fmi3Int16}
const fmi3UInt16Type = fmi3IntegerType{fmi3UInt16}
const fmi3Int32Type = fmi3IntegerType{fmi3Int32}
const fmi3UInt32Type = fmi3IntegerType{fmi3UInt32}
const fmi3Int64Type = fmi3IntegerType{fmi3Int64}
const fmi3UInt64Type = fmi3IntegerType{fmi3UInt64}
export fmi3IntegerType,
    fmi3Int8Type,
    fmi3UInt8Type,
    fmi3Int16Type,
    fmi3UInt16Type,
    fmi3Int32Type,
    fmi3UInt32Type,
    fmi3Int64Type,
    fmi3UInt64Type

"""
Source: FMISpec3.0.2: 2.4.4. Variable Types

    fmi3BooleanType(name)

The type definition `BooleanType`.
"""
mutable struct fmi3BooleanType <: fmi3SimpleType
    # mandatory
    name::String

    # optional
    description::Union{String,Nothing}

    function fmi3BooleanType(name::String)
        return new(name, nothing)
    end
end
export fmi3BooleanType

"""
Source: FMISpec3.0.2: 2.4.4. Variable Types

    fmi3StringType(name)

The type definition `StringType`.
"""
mutable struct fmi3StringType <: fmi3SimpleType
    # mandatory
    name::String

    # optional
    description::Union{String,Nothing}

    function fmi3StringType(name::String)
        return new(name, nothing)
    end
end
export fmi3StringType

"""
Source: FMISpec3.0.2: 2.4.4. Variable Types

    fmi3BinaryType(name)

The type definition `BinaryType`.
"""
mutable struct fmi3BinaryType <: fmi3SimpleType
    # mandatory
    name::String

    # optional
    description::Union{String,Nothing}
    mimeType::Union{String,Nothing}
    maxSize::Union{UInt64,Nothing}

    function fmi3BinaryType(name::String)
        return new(name, nothing, nothing, nothing)
    end
end
export fmi3BinaryType

"""
Source: FMISpec3.0.2: 2.4.4. Variable Types

    fmi3EnumerationItem(name, value, description = nothing)

The elements `Item` of an `fmi3EnumerationType`.
"""
mutable struct fmi3EnumerationItem
    # mandatory
    name::String
    value::fmi3Int64

    # optional
    description::Union{String,Nothing}

    function fmi3EnumerationItem(
        name::String,
        value::Integer,
        description::Union{String,Nothing} = nothing,
    )
        return new(name, value, description)
    end
end
export fmi3EnumerationItem

"""
Source: FMISpec3.0.2: 2.4.4. Variable Types

    fmi3EnumerationType(name, items = fmi3EnumerationItem[])

The type definition `EnumerationType`.
"""
mutable struct fmi3EnumerationType <: fmi3SimpleType
    # mandatory
    name::String
    items::Vector{fmi3EnumerationItem}

    # optional
    description::Union{String,Nothing}
    quantity::Union{String,Nothing}
    min::Union{fmi3Int64,Nothing}
    max::Union{fmi3Int64,Nothing}

    function fmi3EnumerationType(
        name::String,
        items::Vector{fmi3EnumerationItem} = fmi3EnumerationItem[],
    )
        return new(name, items, nothing, nothing, nothing, nothing)
    end
end
export fmi3EnumerationType

"""
Source: FMISpec3.0.2: 2.4.4. Variable Types

    fmi3ClockType(name, intervalVariability)

The type definition `ClockType`, `intervalVariability` is one of `constant`, `fixed`, `tunable`, `changing`, `countdown` or `triggered`.
"""
mutable struct fmi3ClockType <: fmi3SimpleType
    # mandatory
    name::String
    intervalVariability::String

    # optional
    description::Union{String,Nothing}
    canBeDeactivated::Union{Bool,Nothing}
    priority::Union{UInt32,Nothing}
    intervalDecimal::Union{Float64,Nothing}
    shiftDecimal::Union{Float64,Nothing}
    supportsFraction::Union{Bool,Nothing}
    resolution::Union{UInt64,Nothing}
    intervalCounter::Union{UInt64,Nothing}
    shiftCounter::Union{UInt64,Nothing}

    function fmi3ClockType(name::String, intervalVariability::String)
        return new(
            name,
            intervalVariability,
            nothing,
            nothing,
            nothing,
            nothing,
            nothing,
            nothing,
            nothing,
            nothing,
            nothing,
        )
    end
end
export fmi3ClockType

"""
Source: FMISpec3.0, Version D5ef1c1: 2.4.1. Definition of an FMU

The central FMU data structure defining all variables of the FMU that are visible/accessible via the FMU functions.
"""
mutable struct fmi3ModelDescription <: fmiModelDescription
    # FMI model description
    fmiVersion::String
    modelName::String
    instantiationToken::String  # replaces GUID

    # optional
    description::Union{String,Nothing}
    author::Union{String,Nothing}
    version::Union{String,Nothing}
    copyright::Union{String,Nothing}
    license::Union{String,Nothing}
    generationTool::Union{String,Nothing}
    generationDateAndTime::Any # DateTime
    variableNamingConvention::Union{fmi3VariableNamingConvention,Nothing}
    numberOfEventIndicators::Union{UInt,Nothing}

    unitDefinitions::Array{fmi3Unit,1}
    typeDefinitions::Array{fmi3SimpleType,1}
    logCategories::Array # ToDo: Array type

    defaultExperiment::Union{fmi3ModelDescriptionDefaultExperiment,Nothing}
    clockType::Union{fmi3ModelDescriptionClockType,Nothing}

    vendorAnnotations::Array # ToDo: Array type
    modelVariables::Array{fmi3Variable,1}
    modelStructure::fmi3ModelDescriptionModelStructure

    modelExchange::Union{fmi3ModelDescriptionModelExchange,Nothing}
    coSimulation::Union{fmi3ModelDescriptionCoSimulation,Nothing}
    scheduledExecution::Union{fmi3ModelDescriptionScheduledExecution,Nothing}

    # additionals
    valueReferences::Array{fmi3ValueReference}
    inputValueReferences::Array{fmi3ValueReference}
    outputValueReferences::Array{fmi3ValueReference}
    stateValueReferences::Array{fmi3ValueReference}
    discreteStateValueReferences::Array{fmi3ValueReference}
    derivativeValueReferences::Array{fmi3ValueReference}
    eventIndicatorValueReferences::Array{fmi3ValueReference}
    intermediateUpdateValueReferences::Array{fmi3ValueReference}
    parameterValueReferences::Array{fmi3ValueReference}
    stringValueReferences::Dict{String,fmi3ValueReference}

    numberOfContinuousStates::Int

    # additional fields (non-FMI-specific)
    valueReferenceIndicies::Dict{UInt,UInt}

    # Constructor for uninitialized struct
    function fmi3ModelDescription()
        inst = new()
        inst.fmiVersion = ""
        inst.modelName = ""
        inst.instantiationToken = ""

        inst.modelExchange = nothing
        inst.coSimulation = nothing
        inst.scheduledExecution = nothing

        inst.defaultExperiment = nothing
        inst.clockType = nothing

        inst.unitDefinitions = fmi3Unit[]
        inst.typeDefinitions = fmi3SimpleType[]

        inst.modelVariables = Array{fmi3Variable,1}()
        inst.modelStructure = fmi3ModelDescriptionModelStructure()
        inst.numberOfEventIndicators = nothing

        inst.valueReferences = []
        inst.inputValueReferences = []
        inst.outputValueReferences = []
        inst.stateValueReferences = []
        inst.discreteStateValueReferences = []
        inst.derivativeValueReferences = []
        inst.eventIndicatorValueReferences = []
        inst.parameterValueReferences = []

        return inst
    end
end
export fmi3ModelDescription

# Overload the Base.show() function for custom printing of the fmi3ModelDescription.
function Base.show(io::IO, desc::fmi3ModelDescription)
    print(
        io,
        "Model name:            $(desc.modelName)
        FMI version:            $(desc.fmiVersion)
        Instantiation Token:    $(desc.instantiationToken)
        Description:            $(desc.description)
        Model variables:        $(desc.modelVariables)",
    )
end
