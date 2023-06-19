Array = {data = {}, size = 0}

function Array:new(data)
    local o = {}
    setmetatable(o,self)
    self.__index = self
    if data then
        self.data = data
        self.size = self.GetSize(self)
    end
    return o
end


function Array:GetSize()
    local current
    if self.size == 0 then
        current = 1
    else
        current = self.size
    end
    if self.data[current] then
        current = current + 1
        while self.data[current] do
            current = current + 1
        end
        return current - 1
    else
        current = current - 1
        while not self.data[current] do
            current = current - 1
        end
        return current
    end
end

function Array:UpdateSize()
    self.size = self:GetSize()
end


function Array:At(index)
    index = index + 1
    self:UpdateSize()
    if index <= self.size then
        return self.data[index]
    else
        return nil
    end
end

function Array:Offset(index,offset)
    self:UpdateSize()
    for i=self.size, index, -1 do
        self.data[i+offset] = self.data[i]
        self.data[i] = nil
    end
end


function Array:PushBack(data)
    self:UpdateSize()
    self.data[self.size+1] = data
end

function Array:Insert(index, val)
    Array:Offset(index+1,1)
    self.data[index+1] = val
end

function Array:Set(index, val)
    self.data[index+1] = val
end


local array = Array:new({1,2,3,4})

array:Insert(3,69)

for i=0,10 do
   print(array.data[i])
end