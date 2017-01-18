#using Unitful, UnitfulOFU
using Base.Test

import Unitful: ft, inch, m, g, kg, °C, °, W, kW, oz, Hz, rad, s, N, uconvert
import UnitfulOFU: rpm, lbf, klbf, hp

@testset "OFU conversions" begin
  @test uconvert(N, 1.0lbf) == 4.45N
  @test 1000.0lbf == 1.0klbf
  @test 1.0hp == 735.4990027920646W
  @test 5.0rpm - 1//60*1.0Hz == 0.06666666666666667s^-1
  @test uconvert(Hz, 61.0rpm - 1.0Hz) == 0.016666666666666607Hz
end

#=
@testset "OFU string macro" begin
    @test macroexpand(:(ofu"lbf")) == :(UnitfulOFU.ustrcheck(UnitfulOFU.lbf))
    @test macroexpand(:(ofu"1.0")) == 1.0
    @test macroexpand(:(ofu"rpm")) == :(UnitfulOFU.ustrcheck(UnitfulOFU.rpm))
    @test macroexpand(:(ofu"1.0hp")) == :(1.0 * UnitfulOFU.ustrcheck(UnitfulOFU.hp))
end
=#