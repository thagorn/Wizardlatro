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
local booster_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "boosters")
for _, file in ipairs(booster_src) do
    if string.find(file, "%.lua$") then
        assert(SMODS.load_file("boosters/" .. file))()
    end
end

-- Editions
local edition_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "editions")
for _, file in ipairs(edition_src) do
    if string.find(file, "%.lua$") then
        assert(SMODS.load_file("editions/" .. file))()
    end
end

-- Enhancements
local enhancement_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "enhancements")
for _, file in ipairs(enhancement_src) do
    if string.find(file, "%.lua$") then
        assert(SMODS.load_file("enhancements/" .. file))()
    end
end

-- Tarots
local tarot_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "tarots")
for _, file in ipairs(tarot_src) do
    if string.find(file, "%.lua$") then
        assert(SMODS.load_file("tarots/" .. file))()
    end
end

-- Suits
local suit_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "suits")
for _, file in ipairs(suit_src) do
    if string.find(file, "%.lua$") then
        assert(SMODS.load_file("suits/" .. file))()
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

