#
# Copyright (c) 2021 Tobias Thummerer, Lars Mikelsons, Josef Kircher
# Licensed under the MIT license. See LICENSE file in the project root for details.
#

@testset "Unit and type definitions" begin
    md = fmi3ModelDescription()
    @test md.unitDefinitions == fmi3Unit[]
    @test md.typeDefinitions == fmi3SimpleType[]

    # undefined attributes are `nothing`
    unit = fmi3Unit("rad/s", fmi3BaseUnit(; s = -1, rad = 1))
    push!(unit.displayUnits, fmi3DisplayUnit("deg/s"; factor = 57.29577951308232))
    @test unit.baseUnit.s === Int32(-1)
    @test isnothing(unit.baseUnit.kg)
    @test isnothing(unit.baseUnit.factor)
    @test unit.displayUnits[1].factor == 57.29577951308232
    @test isnothing(unit.displayUnits[1].inverse)
    push!(md.unitDefinitions, unit)

    angularVelocity = fmi3Float64Type("AngularVelocity")
    angularVelocity.unit = "rad/s"
    angularVelocity.min = 0 # converted to the value type
    @test angularVelocity isa fmi3FloatType{fmi3Float64}
    @test angularVelocity.min === 0.0
    @test isnothing(angularVelocity.nominal)

    counter = fmi3UInt16Type("Counter")
    counter.max = 1000
    @test counter.max === fmi3UInt16(1000)
    @test_throws InexactError setproperty!(counter, :min, -1)

    stateSelect = fmi3EnumerationType(
        "StateSelect",
        [fmi3EnumerationItem("never", 1), fmi3EnumerationItem("default", 3, "Default")],
    )
    @test [item.value for item in stateSelect.items] == [1, 3]
    @test stateSelect.items[2].description == "Default"

    clock = fmi3ClockType("Sample", "constant")
    clock.intervalDecimal = 0.1
    @test clock.intervalVariability == "constant"
    @test isnothing(clock.priority)

    append!(
        md.typeDefinitions,
        [
            angularVelocity,
            counter,
            stateSelect,
            clock,
            fmi3BooleanType("Flag"),
            fmi3StringType("Text"),
            fmi3BinaryType("Data"),
        ],
    )
    @test all(st -> st isa fmi3SimpleType, md.typeDefinitions)
end
