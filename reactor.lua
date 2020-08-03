-- Initializing Global Varibles
-- 	Needed by OC
local component = require('component')
--		Needed to find the sides of the OC
local sides = require('sides')
--		Used to sleep the program
local os = require('os')

-- Variables to use componnents
--	Needed to use Fission reactors
local r = component.nc_fission_reactor
--	Needed to use restone signals
local s = component.redstone

-- Variables within the program
--	Maxium Energy storable
local mxpwr = r.getMaxEnergyStored()
--	Maxium Heat storable
local mxheat = r.getMaxHeatLevel()
--	Length to sleep after deactivating the Reactor
local t = 2






io.write('Time to get Spicy!!')

--Lever needs to be on the side to the right of the computer screen
while(s.getInput(sides.east) ~= 0)
	do
	--		Current Energy within the Reactor
	local crntpwr = r.getEnergyStored()
	--		Current Heat within the Reactor
	local crntheat = r.getHeatLevel()
	
	
	--	Put Redstone Singal into the bottom of the block for this part to work
	while(s.getInput(sides.down) ~= 0 and crntpwr < .8*mxpwr and crntheat < .8*mxheat)
	do
		crntpwr = r.getEnergyStored()
		crntheat = r.getHeatLevel()
		
		r.activate()
			
	end
	
	--Allows the reactor to cool down
	r.deactivate()
	os.sleep(t)
end



