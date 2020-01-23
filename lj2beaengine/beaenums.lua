
--[[
    This enum construct allows you to create structures
    similar to the 'C' style enums.  The added benefit is
    the enums act as a two way dictionary.  So, you can
    do the following:

    local myEnum = enum {
        Value1 = 0x100,
        Value2 = 0x200,
        Value3 = 0x300,
    }

    print(myEnum[0x200])
    print(myEnum.Value2)

    You'll typically use the first form (indexed by int value)
    when you're receiving an integer from some API and you want
    to know what the string value for it is.

    You'll use the second form when you're trying to use an
    API and you want to use the string name of a value.
]]
local enum = {}
setmetatable(enum, {
    __call = function(self, ...)
        return self:new(...)
    end,
})
local enum_mt = {
    __index = function(self, key)
        for k,v in pairs(self) do 
            if key == v then
                return k
            end
        end
    end;
}

function enum.new(self, alist)
    local alist = alist or {}
    setmetatable(alist, enum_mt)

    return alist
end


local exports = {}

exports.INSTRUCTION_TYPE = enum
{
  GENERAL_PURPOSE_INSTRUCTION   =           0x10000,
  FPU_INSTRUCTION               =           0x20000,
  MMX_INSTRUCTION               =           0x30000,
  SSE_INSTRUCTION               =           0x40000,
  SSE2_INSTRUCTION              =           0x50000,
  SSE3_INSTRUCTION              =           0x60000,
  SSSE3_INSTRUCTION             =           0x70000,
  SSE41_INSTRUCTION             =           0x80000,
  SSE42_INSTRUCTION             =           0x90000,
  SYSTEM_INSTRUCTION            =           0xa0000,
  VM_INSTRUCTION                =           0xb0000,
  UNDOCUMENTED_INSTRUCTION      =           0xc0000,
  AMD_INSTRUCTION               =           0xd0000,
  ILLEGAL_INSTRUCTION           =           0xe0000,
  AES_INSTRUCTION               =           0xf0000,
  CLMUL_INSTRUCTION             =          0x100000,
  AVX_INSTRUCTION               =          0x110000,
  AVX2_INSTRUCTION              =          0x120000,
  MPX_INSTRUCTION               =          0x130000,
  AVX512_INSTRUCTION            =          0x140000,
  SHA_INSTRUCTION               =          0x150000,
  BMI2_INSTRUCTION              =          0x160000,
  CET_INSTRUCTION               =          0x170000,
  BMI1_INSTRUCTION              =          0x180000,
  XSAVEOPT_INSTRUCTION          =          0x190000,
  FSGSBASE_INSTRUCTION          =          0x1a0000,
  CLWB_INSTRUCTION              =          0x1b0000,
  CLFLUSHOPT_INSTRUCTION        =          0x1c0000,
  FXSR_INSTRUCTION              =          0x1d0000,
  XSAVE_INSTRUCTION             =          0x1e0000,
  SGX_INSTRUCTION               =          0x1f0000,
  PCONFIG_INSTRUCTION           =          0x200000,

  -- fill in these values explicitly
  DATA_TRANSFER                 = 0x1,
  ARITHMETIC_INSTRUCTION        = 0x02,
  LOGICAL_INSTRUCTION           = 0x03,
  SHIFT_ROTATE                  = 0x04,
  BIT_UInt8                     = 0x05,
  CONTROL_TRANSFER              = 0x06,
  STRING_INSTRUCTION            = 0x07,
  InOutINSTRUCTION              = 0x08,
  ENTER_LEAVE_INSTRUCTION       = 0x09,
  FLAG_CONTROL_INSTRUCTION      = 0x0A,
  SEGMENT_REGISTER              = 0x0B,
  MISCELLANEOUS_INSTRUCTION     = 0x0C,
  COMPARISON_INSTRUCTION        = 0x0D,
  LOGARITHMIC_INSTRUCTION       = 0x0D,
  TRIGONOMETRIC_INSTRUCTION     = 0x0E,
  UNSUPPORTED_INSTRUCTION       = 0x0F,
  LOAD_CONSTANTS                = 0x10,
  FPUCONTROL                    = 0x11,
  STATE_MANAGEMENT              = 0x12,
  CONVERSION_INSTRUCTION        = 0x13,
  SHUFFLE_UNPACK                = 0x14,
  PACKED_SINGLE_PRECISION       = 0x15,
  SIMD128bits                   = 0x16,
  SIMD64bits                    = 0x17,
  CACHEABILITY_CONTROL          = 0x18,
  FP_INTEGER_CONVERSION         = 0x19,
  SPECIALIZED_128bits           = 0x1A,
  SIMD_FP_PACKED                = 0x1B,
  SIMD_FP_HORIZONTAL            = 0x1C,
  AGENT_SYNCHRONISATION         = 0x1D,
  PACKED_ALIGN_RIGHT            = 0x1E,
  PACKED_SIGN                   = 0x1F,
  PACKED_BLENDING_INSTRUCTION   = 0x20,
  PACKED_TEST                   = 0x21,
  PACKED_MINMAX                 = 0x22,
  HORIZONTAL_SEARCH             = 0x23,
  PACKED_EQUALITY               = 0x24,
  STREAMING_LOAD                = 0x25,
  INSERTION_EXTRACTION          = 0x26,
  DOT_PRODUCT                   = 0x27,
  SAD_INSTRUCTION               = 0x28,
  ACCELERATOR_INSTRUCTION       = 0x29,    -- crc32, popcnt (sse4.2) 
  ROUND_INSTRUCTION             = 0x2A

};


exports.EFLAGS_STATES = enum
{
  TE_ = 1,
  MO_ = 2,
  RE_ = 4,
  SE_ = 8,
  UN_ = 0x10,
  PR_ = 0x20
};

exports.BRANCH_TYPE = enum
{
  JO = 1,
  JC = 2,
  JE = 3,
  JA = 4,
  JS = 5,
  JP = 6,
  JL = 7,
  JG = 8,
  JB = 2,       -- JC == JB 
  JECXZ = 10,
  JmpType = 11,
  CallType = 12,
  RetType = 13,
  JNO = -1,
  JNC = -2,
  JNE = -3,
  JNA = -4,
  JNS = -5,
  JNP = -6,
  JNL = -7,
  JNG = -8,
  JNB = -2      -- JNC == JNB 
};



exports.ARGUMENTS_TYPE = enum
{
  NO_ARGUMENT =          0x10000,
  REGISTER_TYPE =        0x20000,
  MEMORY_TYPE =          0x30000,
  CONSTANT_TYPE =        0x40000,

  GENERAL_REG =               0x1,
  MMX_REG =                   0x2,
  SSE_REG =                   0x4,
  AVX_REG =                   0x8,
  AVX512_REG =                0x10,
  SPECIAL_REG =               0x20,
  CR_REG =                    0x40,
  DR_REG =                    0x80,
  MEMORY_MANAGEMENT_REG =     0x100,
  MPX_REG =                   0x200,
  OPMASK_REG =                0x400,
  SEGMENT_REG =               0x800,
  FPU_REG =                   0x1000,


  RELATIVE_ = 0x4000000,
  ABSOLUTE_ = 0x8000000,

  READ = 0x1,
  WRITE = 0x2,

  REG0 =  0x1,
  REG1 =  0x2,
  REG2 =  0x4,
  REG3 =  0x8,
  REG4 =  0x10,
  REG5 =  0x20,
  REG6 =  0x40,
  REG7 =  0x80,
  REG8 =  0x100,
  REG9 =  0x200,
  REG10 = 0x400,
  REG11 = 0x800,
  REG12 = 0x1000,
  REG13 = 0x2000,
  REG14 = 0x4000,
  REG15 = 0x8000,
  REG16 = 0x10000,
  REG17 = 0x20000,
  REG18 = 0x40000,
  REG19 = 0x80000,
  REG20 = 0x100000,
  REG21 = 0x200000,
  REG22 = 0x400000,
  REG23 = 0x800000,
  REG24 = 0x1000000,
  REG25 = 0x2000000,
  REG26 = 0x4000000,
  REG27 = 0x8000000,
  REG28 = 0x10000000,
  REG29 = 0x20000000,
  REG30 = 0x40000000,
  REG31 = 0x80000000
};


exports.SPECIAL_INFO = enum
{
  UNKNOWN_OPCODE = -1,
  OUT_OF_BLOCK = -2,

  -- === mask = 0xff 
  NoTabulation      = 0x00000000,
  Tabulation        = 0x00000001,

  -- === mask = 0xff00 
  MasmSyntax        = 0x00000000,
  GoAsmSyntax       = 0x00000100,
  NasmSyntax        = 0x00000200,
  ATSyntax          = 0x00000400,
  IntrinsicMemSyntax= 0x00000800,

  -- === mask = 0xff0000 
  PrefixedNumeral   = 0x00010000,
  SuffixedNumeral   = 0x00000000,

  -- === mask = 0xff000000 
  ShowSegmentRegs   = 0x01000000,
  ShowEVEXMasking   = 0x02000000
};


return exports
