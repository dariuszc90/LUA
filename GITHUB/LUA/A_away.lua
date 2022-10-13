---@diagnostic disable: undefined-global
-- VARIABLES --
ID = 'scene'..sceneId
local blinds = {90,160,165,170,65,80,70,75}
local lights = {118,119,120,174,126,140,133}

--CLOSE BLINDS--
for _,i in pairs(blinds) do
    hub.call(i, "close")
    hub.setTimeout(0.2*1000, function()
            hub.call(i, 'setValue2', 99)
    end)
end

hub.setTimeout(10*1000, function()  -- addjust
    for _,i in pairs(blinds) do
        hub.call(i, 'setValue2', 99)
    end
end)

hub.setTimeout(70*1000, function()  -- addjust
    for _,i in pairs(blinds) do
        hub.call(i, 'setValue2', 99)
    end
end)

hub.setTimeout(80*1000, function()
    for _,i in pairs(blinds) do -- open blinds
            local d = hub.getValue(i, "value2")
            hub.debug(ID, 'roleta ' .. i .. ' Value2= ' .. d)
    end
end)

-- TURN OFF LIGHTS --
hub.call(lights, 'turnOff')


-- SET VARIABLES --
hub.setGlobalVariable('camera_trigger', '0')

hub.setGlobalVariable('away_back_delay', '1')

hub.setTimeout(120000, function()
    hub.setGlobalVariable('away_back_delay', '0')
end)



