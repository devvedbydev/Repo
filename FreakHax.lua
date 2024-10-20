-- Obfuscation loader
-- Credits: Dear Moonsec V3

local dev = "freaky" -- DEMO
if dev == "freaky" then
    warn("Freaks only!!! (doesnt support shit pc's)")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/devvedbydev/Repo/refs/heads/main/Loader.lua"))() -- Requires AwesomeSauce
    loadstring(game:HttpGet("https://raw.githubusercontent.com/devvedbydev/Repo/refs/heads/main/AwesomeSauce.lua"))() -- Loads Env 4 Loader
    setfenv(1, getfenv(require))  -- Overriding require to load our stuff
    getfenv().game = nil -- Removing old environment
    -- New env is loaded with more unc, old is removed to improve performance
else
    print("dev is no longer freaky </3") -- Gibberish
end
