local component = require("component")
local io = require("io")

local config = {}

function config.select_device(type, names)
    local devices = component.list(type)
    if devices == nil then return nil end

    local addresses = {}
    local count = 0

    for addr, _ in devices do
        table.insert(addresses, addr)
    end

    for i, addr in ipairs(addresses) do
        count = count + 1
        print("%f) %s", i, addr)
    end

    while true do
        io.write("Selection: ")
        local selection = io.stdin:read()

        local num = tonumber(selection)
        if num and num >= 1 and num <= count then
            return addresses[num]
        end
    end
end

return config