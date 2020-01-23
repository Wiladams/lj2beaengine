# lj2beaengine
LuaJIT binding to the beaengine instruction decoder

The beaengine is an x86/64 instruction set disassembler.

https://github.com/BeaEngine/beaengine

This project is a binding to that engine using LuaJIT.  The 
binding is fairly simple as the beaengine library only has 3 functions.

And example usage:

```lua
local ffi = require("ffi")
local bea = require("lj2beaengine.beaengine")

-- binary encoding of some instruction
local code = "\x62\x02\x05\x40\x00\x44\x33\x22"


local  pDisAsm = ffi.new("DISASM")
pDisAsm.EIP = ffi.cast("UInt64", code);
local res = bea.Disasm(pDisAsm)

print("Result: ", res)
print("Instruction: ", ffi.string(pDisAsm.CompleteInstr))
```

This assumes you already have the beaengine library installed on your machine.
