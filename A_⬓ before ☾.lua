---@diagnostic disable: undefined-global
ID = 'scene'..sceneId

local blinds = {90,160,165,170}
--local blinds = {170} -- test

local lights = {174,119,120,126,140}
hub.call(lights, 'turnOff')

for _,i in pairs(blinds) do -- open blinds
    hub.call(i, "close")
    hub.setTimeout(0.2*1000, function()
        hub.call(i, 'setValue2', 99)
    end)
end

hub.setTimeout(10*1000, function()
for _,i in pairs(blinds) do
    hub.call(i, 'setValue2', 99)
end
end)
hub.setTimeout(70*1000, function()
for _,i in pairs(blinds) do
    hub.call(i, 'setValue2', 99)
end
end)
hub.setTimeout(80*1000, function()
    for _,i in pairs(blinds) do -- open blinds
            local d = hub.getValue(i, "value2")
            hub.debug(ID, 'roleta ' .. i .. ' Value2= ' .. d)
    end
    hub.debug(ID,'koniec')
end)
