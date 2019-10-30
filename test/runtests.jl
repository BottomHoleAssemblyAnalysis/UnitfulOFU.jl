using UnitfulOFU, Test

# write your own tests here

println("Running tests for UnitfulOFU:")

tests = [
  "ofu_test.jl"
]

for test in tests
    println("\n  * $(test) *\n")
    include(test)
    println()
end
