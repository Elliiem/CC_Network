local posix = require('posix')
require("Register")
R, W = posix.pipe()

function DispatchChild(child_func)
    local child_pid = posix.fork()
    if child_pid == 0 then
        child_func()
    else
        return child_pid
    end
end


function ReadAll(r)
    local d = nil
    local read = ""
    local fds = {
        [R] = {events={IN=true}}
    }
    while posix.poll(fds,1) ~= 0 do
        d = posix.read(r,1)
        read = read .. d
    end
    return read
end

function ReadNT(r)
    local d
    local read = ""
    while d ~= "\0" do
        d = posix.read(r,1)
        read = read .. d
    end
    return read
end

function ReadT(r,terminator)
    local d
    local read = ""
    while d ~= terminator do
        d = posix.read(r,1)
        read = read .. d
    end
    return read
end

function Write(w,str)
    posix.write(w,str)
end


function Poll(fds)
    return posix.poll(fds,1)
end


function Exit()
    posix._exit(0)
end 

function Kill(pid)
    posix._exit(pid)
end


function Child()
    Write(W,"Hello, parent!\n\0")
    Write(W,"Test\0")
    posix._exit(0)
end

--local child = DispatchChild(Child)
--print(child)
--print(ReadAll(R))

--somewhere to store the Status of Turtles / which turtles belong to this computer
--some way of getting the Status of turtles
--command lib

local register = Register:new()
register:AddSlave(69,"computer")
print(register.data[69].computer_type)
