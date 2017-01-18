using UnitfulOFU
using Base.Test

@testset "OFU string macro" begin
    @test macroexpand(:(ofu"lbf")) == :(UnitfulUS.ustrcheck(UnitfulOFU.lbf_ofu))
    @test macroexpand(:(ofu"1.0")) == 1.0
    @test macroexpand(:(ofu"rpm")) == :(UnitfulUS.ustrcheck(UnitfulOFU.rpm_ofu)
    @test macroexpand(:(ofu"1.0hp")) ==
        :(1.0 * UnitfulOFU.ustrcheck(UnitfulUS.hp_us))

    @test isa(macroexpand(:(ofu"hp rpm")).args[1], ParseError)

    # Disallowed functions
    @test isa(macroexpand(:(ofu"abs(2)")).args[1], ErrorException)

    # Units not found
    @test isa(macroexpand(:(ofu"kg")).args[1], ErrorException)

    # test ustrcheck(x) fallback to catch non-units / quantities
    @test isa(macroexpand(:(ofu"ustrcheck")).args[1], ErrorException)
end
