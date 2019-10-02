local BrightnessThreshold = 200
local LightSensor = 46
local FrontDoorLight = 11
local HallwayLightKitchen = 89
local Delay = 120
local LightAlreadyOn = 0

function offlight()
    luup.call_action("urn:upnp-org:serviceId:Dimming1", "SetLoadLevelTarget", {newLoadlevelTarget = "0"}, FrontDoorLight)
    luup.call_action("urn:upnp-org:serviceId:Dimming1", "SetLoadLevelTarget", {newLoadlevelTarget = "0"}, HallwayLightKitchen)
end

CurrentBrightness = tonumber((luup.variable_get("urn:micasaverde-com:serviceId:LightSensor1","CurrentLevel", LightSensor)))
LightAlreadyOn =    tonumber((luup.variable_get("urn:upnp-org:serviceId:SwitchPower1","Status", HallwayLightKitchen)))
-- print("ready")
-- print(CurrentBrightness)
-- print(LightAlreadyOn)

if ((CurrentBrightness < BrightnessThreshold) and (LightAlreadyOn < 1)) then   
    luup.call_action("urn:upnp-org:serviceId:Dimming1", "SetLoadLevelTarget", {newLoadlevelTarget = "10"}, FrontDoorLight)
    luup.call_action("urn:upnp-org:serviceId:Dimming1", "SetLoadLevelTarget", {newLoadlevelTarget = "10"}, HallwayLightKitchen)
    luup.call_delay("offlight", Delay) 
    return (true)
else
    return (false)
end
