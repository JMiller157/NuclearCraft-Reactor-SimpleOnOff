-- Initializing Global Varibles
-- 	Needed by OC
component = require("component")
--		Needed to find the sides of the OC
sides = require("sides")

--	Needed to use Fission reactors
r = component.nc_fission_reactor

--	Needed to use restone signals
s = component.redstone

io.write('Time to get Spicy!!')

while(true)
	do
	--	Varible used for the lever
	--		Lever on the front of the OC block
	local overide = s.getInput(sides.south)
	--		Current Energy within the Reactor
	local crntpwr = r.getEnergyStored()
	--		Current Heat within the Reactor
	local crntheat = r.getHeatLevel()
	--		Maxium Energy storable
	local mxpwr = r.getMaxEnergyStored()
	--		Maxium Heat storable
	local mxheat = r.getMaxHeatLevel()

	while(overide ~= 0)
		do
		crntpwr = r.getEnergyStored()
		crntheat = r.gethEnergyStored()
		
		-- Stops reactor if full of energy or too hot
		if crntpwr > .8*mxpwr or cheat > .8*mxheat
		then			
			r.deactivate()
		-- Starts reactor if cool and has little energy
		elseif cpwr < .4*mxpwr and crntheat > .1*mxheat
		then
			r.activate()
		end


	end
end



