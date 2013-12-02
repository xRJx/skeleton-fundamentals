local PLUGIN = PLUGIN;

PLUGIN.voices = Clockwork.kernel:NewLibrary("GeneralVoices");

PLUGIN.voices.stored = {
	generalVoices = {}
};

-- A function to add a vortigaunt voice.
function PLUGIN.voices:AddGeneralVoice(faction, command, phrase, sound, female, menu)
	PLUGIN.voices.stored.generalVoices[#PLUGIN.voices.stored.generalVoices + 1] = {
		command = command,
		faction = faction,
		phrase = phrase,
		female = female,
		sound = sound,
		menu = menu
	};
end;

PLUGIN.voices:AddGeneralVoice("Example", "Accept Charge", "Accept the charge.", "vo/npc/vortigaunt/acceptcharge.wav");

if (CLIENT) then
	table.sort(PLUGIN.voices.stored.generalVoices, function(a, b) return a.command < b.command; end);
	
	for k, v in pairs(PLUGIN.voices.stored.generalVoices) do
		Clockwork.directory:AddCode("General", [[
			<div class="auraInfoTitle">]]..string.upper(v.command)..[[</div>
			<div class="auraInfoText">]]..v.phrase..[[</div>
		]], true);
	end;
end;