package.path = "../?.lua;"..package.path

local ffi = require("ffi")
local bea = require("lj2beaengine.beaengine")

local ver = ffi.string(bea.BeaEngineVersion());
local rev = ffi.string(bea.BeaEngineRevision());

print("ver: ", ver)
print("rev: ", rev)
