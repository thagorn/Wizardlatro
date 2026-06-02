WLT = SMODS.current_mod

WLT.MAGIC = {
    mana = 0,
    max_mana = 5,
    mana_text = nil,
}

-- Jokers
local joker_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "jokers")
for _, file in ipairs(joker_src) do
    if string.find(file, "%.lua$") then
        assert(SMODS.load_file("jokers/" .. file))()
    end
end

-- Decks
local deck_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "decks")
for _, file in ipairs(deck_src) do
    if string.find(file, "%.lua$") then
        assert(SMODS.load_file("decks/" .. file))()
    end
end

-- Connections
local connection_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "connections")
for _, file in ipairs(connection_src) do
    if string.find(file, "%.lua$") then
        assert(SMODS.load_file("connections/" .. file))()
    end
end
