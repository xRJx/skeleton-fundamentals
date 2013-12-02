local PLUGIN = PLUGIN;

-- Called when a player's character screen info should be adjusted.
function PLUGIN:PlayerAdjustCharacterScreenInfo(player, character, info)
	if (character.data["customclass"]) then
		info.customClass = character.data["customclass"];
	end;
end;

-- Called when a player's shared variables should be set.
function PLUGIN:PlayerSetSharedVars(player, curTime)
	player:SetSharedVar( "customClass", player:GetCharacterData("customclass", "") );
end;