local function GetDataArraySize(array)
    local i = 1
    while array[i] do
        i = i + 1
    end
    return i - 1
end


Array = {data = {}, size = 0}


function Array:new(data)
    local o = {}
    setmetatable(o,self)
    self.__index = self
    if data then
        o.data = data
        o.size = GetDataArraySize(data)
    else
        o.data = {}
        o.size = 0
    end
    return o
end


function Array:At(index)
    index = index + 1
    if index <= self.size then
        return self.data[index]
    else
        return nil
    end
end


function Array:Offset(index,offset)
    if offset >= 0 then
        for i=self.size, index+1, -1 do
            self.data[i+offset] = self.data[i]
            self.data[i] = nil
        end
        self.size = self.size + offset
    else
        for i=index+1,self.size do
            self.data[i+offset] = self.data[i]
            self.data[i] = nil
        end
        self.size = self.size - offset
    end
end


function Array:Remove(index)
    self.data[index+1] = nil
    self:Offset(index+1,-1)
end


function Array:PushBack(data)
    self.data[self.size+1] = data
    self.size = self.size + 1
end


function Array:Insert(index, val)
    self:Offset(index+1,1)
    self.data[index+1] = val
end


function Array:Set(index, val)
    self.data[index+1] = val
end


function Array:Print()
    for i=1,self.size do
        print(self.data[i])
    end
    print()
end


function Array:AddArrayData(array,index,isreplacing)
    if not isreplacing then
        isreplacing = false
    end

    local size = GetDataArraySize(array.data)
    if isreplacing then
        for i=1,size do
            self.data[i+index] = array.data[i]
        end
    else
        self:Offset(index,size)
        for i=1,size do
            self.data[i+index] = array.data[i]
        end
    end

end


function Array:SetArrayData(new_data)
    self.data = new_data
    self.size = GetDataArraySize(new_data)
end




local array2 = Array:new({0,9,8})
local array = Array:new({1,2,3,4})


array:Print()
array:AddArrayData(array2,2)
array:Print()