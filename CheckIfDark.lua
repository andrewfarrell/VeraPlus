
local Allow = true
local Block = false
local BrightnessThreshold = 4
local dID = 7
CurrentBrightness = tonumber((luup.variable_get("urn:micasaverde-com:serviceId:LightSensor1","CurrentLevel", dID)))
-- print(CurrentBrightness)
if (CurrentBrightness < BrightnessThreshold) then
    return Allow
else
    return Block
end