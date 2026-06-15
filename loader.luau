local config = getgenv().Config 
local placeId = game.PlaceId
local selected;
local volt_str = 'Volt/games/'

local gameList = {
    [126642046443487] = volt_str .. 'reincarnated.luau',
    [97598239454123] = volt_str .. 'gag2.luau'
}


local function loadstr(path)
    local url = 'https://api.github.com/repos/Karshtakavaar/Projects/contents/' .. path .. '?ref=main' 

    local response = request({
        Url = url, 
        Method = 'GET',
        Headers = {
            ['Authorization'] = 'token ' .. config.Token, 
            ['Accept'] = 'application/vnd.github.v3.raw',
            ['User-Agent'] = 'LuaScript'
        }
    })

    if response.Success then 
        return loadstring(response.Body)()
    else 
        error(response.StatusCode .. ' : ' .. response.StatusMessage)
    end
end



for _, v in next, gameList do 
    if _ == placeId then 
        print(_ .. ' hi')
    end
end


config.Library = loadstr(volt_str .. 'shared/interface_new.lua')

loadstr(selected)