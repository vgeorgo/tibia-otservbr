local house = {
  builtItems = {
    {position = Position(1014, 1021, 7), groundId = 9022, itemId = 1027}
  },
	burntItems = {
    {position = Position(1014, 1021, 7), itemId = nil}
  }
}

local testhouse = GlobalEvent("testhouse")

function testhouse.onStartup(interval)
  Spdlog.info(string.format("CUSTOM (test_house) - Loading custom houses by JSON"))

	if house.burntItems then
		local item
    for i = 1, #house.burntItems do
			item = Tile(house.burntItems[i].position):getItemById(house.burntItems[i].itemId)
			if item then
				item:remove()
			end
		end
	end

  if house.builtItems then
		local tile, ground, tileConfig
    for i = 1, #house.builtItems do
      tileConfig = house.builtItems[i]
			tile = Tile(tileConfig.position)
      ground = tile:getGround();

      if not tile or not ground then
        Spdlog.info(string.format("CUSTOM (test_house) - Failed to create tile %s, ground: %s", tile, ground))
      else
        ground:transform(tileConfig.groundId)
        Game.createItem(tileConfig.itemId, 1, tileConfig.position)
      end
		end
	end

	return true
end

testhouse:register()
