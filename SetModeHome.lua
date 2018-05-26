local Home = 1
local Away = 2
local Night = 3
local Vacation = 4

luup.call_action("urn:micasaverde-com:serviceId:HomeAutomationGateway1","SetHouseMode", {Mode = Home}, 0)
return