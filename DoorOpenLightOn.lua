-- Hall lights on dim  when door unlocked and dark inside.
local BrightnessThreshold = 12
local LightSensor = 46
local Light1 = 11
local HallwayLightKitchen = 89
-- local Light2 = 13
local Delay = 120
local CurrentBrightness = 0
local LightAlreadyOn = 0

function offlight()
    luup.call_action("urn:upnp-org:serviceId:Dimming1", "SetLoadLevelTarget", {newLoadlevelTarget = "0"}, Light1)
    -- luup.call_action("urn:upnp-org:serviceId:Dimming1", "SetLoadLevelTarget", {newLoadlevelTarget = "0"}, Light2)
end
CurrentBrightness = tonumber((luup.variable_get("urn:micasaverde-com:serviceId:LightSensor1","CurrentLevel", LightSensor)))
LightAlreadyOn =    tonumber((luup.variable_get("urn:upnp-org:serviceId:SwitchPower1","Status", HallwayLightKitchen)))
-- print(CurrentBrightness)

if ((CurrentBrightness < BrightnessThreshold) and (LightAlreadyOn == 0)) then   
    luup.call_action("urn:upnp-org:serviceId:Dimming1", "SetLoadLevelTarget", {newLoadlevelTarget = "50"}, Light1)
    -- luup.call_action("urn:upnp-org:serviceId:Dimming1", "SetLoadLevelTarget", {newLoadlevelTarget = "50"}, Light2)
    luup.call_delay("offlight", Delay)
	return (true)
else
    return (false)
end