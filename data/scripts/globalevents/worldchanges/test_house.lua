local house = {
  builtItems = {
    -- GROUND
    {position = Position(1003, 1016, 7), groundId = nil, itemId = 1027},
    {position = Position(1004, 1016, 7), groundId = nil, itemId = 1026},
    {position = Position(1005, 1016, 7), groundId = nil, itemId = 1026},
    {position = Position(1006, 1016, 7), groundId = nil, itemId = 1026},
    {position = Position(1007, 1016, 7), groundId = nil, itemId = 1026},

    {position = Position(1003, 1017, 7), groundId = nil, itemId = 1025},
    {position = Position(1004, 1017, 7), groundId = 9067, itemId = nil},
    {position = Position(1005, 1017, 7), groundId = 9067, itemId = nil},
    {position = Position(1006, 1017, 7), groundId = 9067, itemId = nil},
    {position = Position(1007, 1017, 7), groundId = nil, itemId = 6441},

    {position = Position(1003, 1018, 7), groundId = nil, itemId = 1025},
    {position = Position(1004, 1018, 7), groundId = 9067, itemId = nil},
    {position = Position(1005, 1018, 7), groundId = 9067, itemId = nil},
    {position = Position(1006, 1018, 7), groundId = 9067, itemId = nil},
    {position = Position(1007, 1018, 7), groundId = nil, itemId = 6441},

    {position = Position(1003, 1019, 7), groundId = nil, itemId = 1025},
    {position = Position(1004, 1019, 7), groundId = nil, itemId = 1026},
    {position = Position(1005, 1019, 7), groundId = nil, itemId = 5098},
    {position = Position(1006, 1019, 7), groundId = nil, itemId = 1026},
    {position = Position(1007, 1019, 7), groundId = nil, itemId = 1029},

    -- ROOF
    {position = Position(1003, 1016, 6), groundId = nil, itemId = 5161},
    {position = Position(1004, 1016, 6), groundId = nil, itemId = 5165},
    {position = Position(1005, 1016, 6), groundId = nil, itemId = 5165},
    {position = Position(1006, 1016, 6), groundId = nil, itemId = 5165},
    {position = Position(1007, 1016, 6), groundId = nil, itemId = 5165},
    {position = Position(1008, 1016, 6), groundId = nil, itemId = 5162},

    {position = Position(1003, 1017, 6), groundId = nil, itemId = 5158},
    {position = Position(1004, 1017, 6), groundId = nil, itemId = 5160},
    {position = Position(1005, 1017, 6), groundId = nil, itemId = 5160},
    {position = Position(1006, 1017, 6), groundId = nil, itemId = 5160},
    {position = Position(1007, 1017, 6), groundId = nil, itemId = 5160},
    {position = Position(1008, 1017, 6), groundId = nil, itemId = 5167},

    {position = Position(1003, 1018, 6), groundId = nil, itemId = 5158},
    {position = Position(1004, 1018, 6), groundId = nil, itemId = 5160},
    {position = Position(1005, 1018, 6), groundId = nil, itemId = 5160},
    {position = Position(1006, 1018, 6), groundId = nil, itemId = 5160},
    {position = Position(1007, 1018, 6), groundId = nil, itemId = 5160},
    {position = Position(1008, 1018, 6), groundId = nil, itemId = 5167},

    {position = Position(1003, 1019, 6), groundId = nil, itemId = 5158},
    {position = Position(1004, 1019, 6), groundId = nil, itemId = 5160},
    {position = Position(1005, 1019, 6), groundId = nil, itemId = 5160},
    {position = Position(1006, 1019, 6), groundId = nil, itemId = 5160},
    {position = Position(1007, 1019, 6), groundId = nil, itemId = 5160},
    {position = Position(1008, 1019, 6), groundId = nil, itemId = 5167},

    {position = Position(1003, 1020, 6), groundId = nil, itemId = 5164},
    {position = Position(1004, 1020, 6), groundId = nil, itemId = 5166},
    {position = Position(1005, 1020, 6), groundId = nil, itemId = 5166},
    {position = Position(1006, 1020, 6), groundId = nil, itemId = 5166},
    {position = Position(1007, 1020, 6), groundId = nil, itemId = 5166},
    {position = Position(1008, 1020, 6), groundId = nil, itemId = 5163}
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
			tile = Tile(tileConfig.position) or Game.createTile(tileConfig.position)

      if not tile then
        Spdlog.info(string.format("CUSTOM (test_house) - Failed to create tile %s", tile))
      else
        ground = tile:getGround();

        if tileConfig.groundId and ground then ground:transform(tileConfig.groundId) end
        if tileConfig.itemId then Game.createItem(tileConfig.itemId, 1, tileConfig.position) end
      end
		end
	end

	return true
end

testhouse:register()
