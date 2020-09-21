-- Sets up the global table and parses settings

local setup = {}
local util = scripts.util
local metatables = scripts.metatables

function setup.on_init()
	global.cache = global.cache or {}
	global.distrEvents = global.distrEvents or {}
	global.settings = {}

	for player_index,_ in pairs(game.players) do
		setup.createPlayerCache(player_index)
	end
end

setup.on_configuration_changed = setup.on_init

function setup.on_player_created(event)
	setup.createPlayerCache(event.player_index)

	-- local player = game.players[event.player_index]
	-- player.print({"message.usage"}, {r=1, g=0.85, b=0})
end

function setup.createPlayerCache(index)
	global.cache[index] = global.cache[index] or {}
	global.cache[index].items = global.cache[index].items or {}
	global.cache[index].markers = global.cache[index].markers or {}
	metatables.use(global.cache[index].markers, "entityAsIndex")
	global.cache[index].entities = global.cache[index].entities or {}
	metatables.use(global.cache[index].entities, "entityAsIndex")
end

function setup.on_load()
	metatables.refresh(global)
end

return setup
