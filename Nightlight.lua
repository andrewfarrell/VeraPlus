local BrightnessThreshold = 12
local LightSensor = 46
local FrontDoorLight = 11
local HallwayLightKitchen = 89
local Delay = 120

function offlight()
    luup.call_action("urn:upnp-org:serviceId:Dimming1", "SetLoadLevelTarget", {newLoadlevelTarget = "0"}, FrontDoorLight)
    luup.call_action("urn:upnp-org:serviceId:Dimming1", "SetLoadLevelTarget", {newLoadlevelTarget = "0"}, HallwayLightKitchen)
end

CurrentBrightness = tonumber((luup.variable_get("urn:micasaverde-com:serviceId:LightSensor1","CurrentLevel", LightSensor)))
if (CurrentBrightness < BrightnessThreshold) then   
    luup.call_action("urn:upnp-org:serviceId:Dimming1", "SetLoadLevelTarget", {newLoadlevelTarget = "10"}, FrontDoorLight)
    luup.call_action("urn:upnp-org:serviceId:Dimming1", "SetLoadLevelTarget", {newLoadlevelTarget = "10"}, HallwayLightKitchen)
    luup.call_delay("offlight", Delay) 
    return (true)
else
    return (false)
end
