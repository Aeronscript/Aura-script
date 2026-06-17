-- main.lua
print("=== CHARGEMENT DU SYSTEME ===")

local BaseUrl = "https://raw.githubusercontent.com/Aeronscript/Aura-script/refs/heads/main/"

-- 1. Charger l'interface
local success1, err1 = pcall(function()
    loadstring(game:HttpGet(BaseUrl .. "gui.lua"))()
end)

if not success1 then
    warn("Erreur GUI: " .. tostring(err1))
    return
end

-- 2. Charger les effets et la logique
local success2, err2 = pcall(function()
    loadstring(game:HttpGet(BaseUrl .. "effects.lua"))()
end)

if not success2 then
    warn("Erreur Effets: " .. tostring(err2))
    return
end

print("=== SYSTEME CHARGE AVEC SUCCES ===")
