require("Connection")

MASTER = 0
EQUALS = 1
SLAVE = 2

-- Register
Register = {data = {}, size = 0}

function Register:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.data = {}
    self.size = 0
    return o
end


function Register:AddSlave(other_id,computer_type)
    self.data[other_id] = Connection:new(other_id,computer_type,SLAVE)
end

function Register:AddEqual(other_id,computer_type)
    self.data[other_id] = Connection:new(other_id,computer_type,EQUALS)
end

function Register:AddMaster(other_id,computer_type)
    self.data[other_id] = Connection:new(other_id,computer_type,MASTER)
end

