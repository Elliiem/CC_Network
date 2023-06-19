Connection = {other_id = 0,last_msg = {}, last_ret = {}, connection_type = EQUALS, isfree = false, computer_type = "computer"}

function Connection:new(other_id,computer_type,connection_type)
    local o = {}
    setmetatable(o,self)
    self.__index = self
    self.other_id = other_id
    self.computer_type = computer_type
    self.connection_type = connection_type
    return o
end

function Connection:SetReturn(ret_msg)
    self.last_ret = ret_msg
end
