package.path = "../?.lua;"..package.path

local enums = require("lj2beaengine.beaenums")

print(string.format("INSTRUCTION_TYPE.FPU_INSTRUCTION: 0x%0x", enums.INSTRUCTION_TYPE.FPU_INSTRUCTION))
print("INSTRUCTION_TYPE[0x20000]: ", enums.INSTRUCTION_TYPE[0x20000])