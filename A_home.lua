---@diagnostic disable: undefined-global
ID = 'scene'..sceneId

local blinds = {90,160,165,170,65,80,70,75} -- ID's of the blinds to open
--local blinds = {170} --test
for _,i in pairs(blinds) do -- open blinds
    hub.call(i, "open")
    hub.setTimeout(2*1000, function()
            hub.call(i, 'stop')
    end)
        hub.setTimeout(3*1000, function()
            hub.call(i, 'stop')
    end)
end

hub.setTimeout(10*1000, function()
for _,i in pairs(blinds) do -- addjust
        hub.call(i, 'setValue2', 0)
    end
end)

hub.setTimeout(15*1000, function()
    for _,i in pairs(blinds) do -- open blinds
            local d = hub.getValue(i, "value2")
            hub.debug(ID, 'roleta ' .. i .. ' Value2= ' .. d)
    end
    hub.debug(ID, "scene 124 koniec")
end)
