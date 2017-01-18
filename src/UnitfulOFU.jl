__precompile__(true)
module UnitfulOFU

using Unitful
import Unitful: N, W, g, Hz, @unit

#using Unitful: @unit
export @ofu_str

# OFU oz
# Now defined in Unitful
#@unit oz_ofu   "oz"        OFUOUNCE      (2*2834952//(10^5))*g     false

# OFU lbf
@unit lbf   "lbf"       OFUPound      (4.45)*N                  true

# OFU hp
@unit hp    "hp"        OFUHP         (735.4990027920646)*W     false

# OFU rpm
@unit rpm   "rpm"       OFURPM        (1//60)*Hz                false

include("ofumacro.jl")

# Some gymnastics required here because if we precompile, we cannot add to
# Unitful.basefactors at compile time and expect the changes to persist to runtime.
const localunits = Unitful.basefactors
function __init__()
    merge!(Unitful.basefactors, localunits)
    Unitful.register(UnitfulOFU)
end

end # module
