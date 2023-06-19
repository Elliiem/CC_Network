require("Array")
-- "instr|from|arg1|arg2|arg3...|\0"
-- "from|msg\0"

function SnipInstruction(instr)
    local args = Array:new()
    local inst = ""
    local from = ""

end








Message = {str_literal = "", inst_type = "", args = {}, from = 0}

function Message:new(str)
    local o = {}
    setmetatable(o,self)
    self.__index = self
        o.str_literal = str
    return o
end