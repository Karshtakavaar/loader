local token = getgenv().Token
local select = getgenv().Select 
local menu = getgenv().Menu 

local function load(path)
    local url = 'https://api.github.com/repos/Karshtakavaar/Projects/contents/' .. path .. '?ref=main' 

    local response = request({
        Url = url, 
        Method = 'GET',
        Headers = {
            ['Authorization'] = 'token ' .. token, 
            ['Accept'] = 'application/vnd.github.v3.raw',
            ['User-Agent'] = 'LuaScript'
        }
    })

    if response.Success then 
        return loadstring(response.Body)()
    else 
        error(response.StatusCode .. ': ' .. response.StatusMessage)
    end
end

local volt_str = 'Volt/'

local gameList = {
    Reincarnated = {id = 126642046443487, path = volt_str .. 'games/reincarnated.luau'} -- for now
}
local menuList = {
    Modern = volt_str .. 'shared/interface_new.lua',
    -- Old = volt_str .. 'shared/interface_old.lua'
}

local selected = gameList[select]
if selected.id ~= game.PlaceId then error('Invalid Game') end 

local selectedMenu = menuList[menu]
if selectedMenu == nil then error('Invalid Menu') end 

getgenv().Library = selectedMenu

load(selected.path)