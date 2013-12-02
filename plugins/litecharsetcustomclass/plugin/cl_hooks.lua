local PLUGIN = PLUGIN;

-- Called when a player's scoreboard class is needed.
function PLUGIN:GetPlayerScoreboardClass(player)
	local customClass = player:GetSharedVar("customClass");
	
	if (customClass != "") then
		return customClass;
	end;
end;

-- Called when the local player's character screen faction is needed.
function PLUGIN:GetPlayerCharacterScreenFaction(character)
	if (character.customClass and character.customClass != "") then
		return character.customClass;
	end;
end;

-- Called when a player's scoreboard options are needed.
function PLUGIN:GetPlayerScoreboardOptions(player, options, menu)
	if (Clockwork.command:FindByID("CharSetCustomClass")) then
		if (Clockwork.player:HasFlags(Clockwork.Client, Clockwork.command:FindByID("CharSetCustomClass").access)) then
			options["Custom Class"] = {};
			options["Custom Class"]["Set"] = function()
				Derma_StringRequest(player:Name(), "What would you like to set their custom class to?", player:GetSharedVar("customClass"), function(text)
					Clockwork.kernel:RunCommand("CharSetCustomClass", player:Name(), text);
				end);
			end;
			
			if (player:GetSharedVar("customClass") != "") then
				options["Custom Class"]["Take"] = function()
					Clockwork.kernel:RunCommand( "CharTakeCustomClass", player:Name() );
				end;
			end;
		end;
	end;
end;