WLT = SMODS.current_mod

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

-- Jokers
local joker_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "jokers")
for _, file in ipairs(joker_src) do
    if string.find(file, "%.lua$") then
        assert(SMODS.load_file("jokers/" .. file))()
    end
end

-- Boosters
local joker_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "boosters")
for _, file in ipairs(joker_src) do
    if string.find(file, "%.lua$") then
        assert(SMODS.load_file("boosters/" .. file))()
    end
end

-- Editions
local joker_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "editions")
for _, file in ipairs(joker_src) do
    if string.find(file, "%.lua$") then
        assert(SMODS.load_file("editions/" .. file))()
    end
end

-- Enhancements
local joker_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "enhancements")
for _, file in ipairs(joker_src) do
    if string.find(file, "%.lua$") then
        assert(SMODS.load_file("enhancements/" .. file))()
    end
end

-- Tarots
local joker_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "tarots")
for _, file in ipairs(joker_src) do
    if string.find(file, "%.lua$") then
        assert(SMODS.load_file("tarots/" .. file))()
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

