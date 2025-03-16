local function getexecutor()
    local executor = (function()
        if getgenv().identifyexecutor then
            return getgenv().identifyexecutor()
        end
        return "Unknown"
    end)()
    
    local function getIdentity()
        local id
        local connection = game:GetService("LogService").MessageOut:Connect(function(message)
            local split = message:split(" ")
            id = tonumber(split[#split])
        end)
        
        printidentity()
        task.wait()
        connection:Disconnect()
        
        return id or 0
    end
    
    return executor, getIdentity()
end

local executor, id = getexecutor()
local gameid = game.PlaceId
local gameName = game:GetService("MarketplaceService"):GetProductInfo(gameid).Name

local supportedgames = {
    [76455837887178] = "Dig it",
}

if supportedgames[gameid] then
    if string.find(gameName:lower(), "dig it") then
        if id > 6 then --good executor
            loadstring(game:HttpGet("https://stane.pages.dev/assets/scripts/digit/WaveLepre.lua"))()
        elseif id < 6 then --shitty executor
            loadstring(game:HttpGet("https://stane.pages.dev/assets/scripts/digit/SolaraLepre.lua"))()
        end
    else
        print("Loading Infinite Yield")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end
end

