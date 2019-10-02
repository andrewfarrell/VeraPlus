local Delay = 300 -- 5 minutes
local nightTime = 23 -- Time after which do not turn light back on
local cTime=tonumber(os.date("%H"))
-- print(cTime)

function resetlight()
    cTime=tonumber(os.date("%H"))
    if ((cTime > nightTime) or (cTime < 6)) then
        -- print("Off")
        -- Turn lights to off
        luup.call_action("urn:micasaverde-com:serviceId:HomeAutomationGateway1","RunScene",{ SceneNum="40" }, 0)
    else
        -- Turn Light to low
        -- print("Low")
        luup.call_action("urn:micasaverde-com:serviceId:HomeAutomationGateway1","RunScene",{ SceneNum="39" }, 0)
    end 
end

luup.call_delay("resetlight", Delay) 
return (true)