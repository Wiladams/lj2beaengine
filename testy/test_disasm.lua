package.path = "../?.lua;"..package.path

local ffi = require("ffi")
local bea = require("lj2beaengine.beaengine")

local code = "\x62\x02\x05\x40\x00\x44\x33\x22"


local  pDisAsm = ffi.new("DISASM")
pDisAsm.EIP = ffi.cast("UInt64", code);
local res = bea.Disasm(pDisAsm)

print("Result: ", res)
print("OP: ", ffi.string(pDisAsm.CompleteInstr))
