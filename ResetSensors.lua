function resetSensor (device)
    local SECURITY_SENSOR_SERVICE ="urn:micasaverde-com:serviceId:SecuritySensor1"
    luup.variable_set (SECURITY_SENSOR_SERVICE, "Tripped", 0, device)
end

resetSensor(149)  -- Living Room Motion Sensor
resetSensor(150)  -- Office Motion Sensor
resetSensor(151)  -- Kitchen Motion Sensor
resetSensor(155)  -- Media Room Motion Sensor
resetSensor(163)  -- Playroom Motion Sensor
resetSensor(164)  -- Garage Motion Sensor
resetSensor(209)  -- Entry Motion Sensor
resetSensor(210)  -- Patio Motion Sensor
resetSensor(414)  -- Master Bedroom Motion Sensor