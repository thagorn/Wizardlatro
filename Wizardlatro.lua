WLT = SMODS.current_mod

WLT.MAGIC = {
    play_mana = 0,
    cur_mana = 5,
    max_mana = 5,
    play_mana_text = nil,
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

-- UI
local ui_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "ui")
for _, file in ipairs(ui_src) do
    if string.find(file, "%.lua$") then
        assert(SMODS.load_file("ui/" .. file))()
    end
end

-- Functions
local function_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "functions")
for _, file in ipairs(function_src) do
    if string.find(file, "%.lua$") then
        assert(SMODS.load_file("functions/" .. file))()
    end
end

-- Hooks
local hook_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "hooks")
for _, file in ipairs(hook_src) do
    if string.find(file, "%.lua$") then
        assert(SMODS.load_file("hooks/" .. file))()
    end
end
