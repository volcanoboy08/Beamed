--[[
.______    _______     ___      .___  ___.  _______  _______  
|   _  \  |   ____|   /   \     |   \/   | |   ____||       \ 
|  |_)  | |  |__     /  ^  \    |  \  /  | |  |__   |  .--.  |
|   _  <  |   __|   /  /_\  \   |  |\/|  | |   __|  |  |  |  |
|  |_)  | |  |____ /  _____  \  |  |  |  | |  |____ |  '--'  |
|______/  |_______/__/     \__\ |__|  |__| |_______||_______/ 
]]--
local time = game:GetService("HttpService"):JSONDecode(game:HttpGet('https://showcase.api.linx.twenty57.net/UnixTime/tounixtimestamp?datetime=now'))
local Age = game.Players.LocalPlayer.AccountAge
local Birthday = game:GetService("HttpService"):JSONDecode(game:HttpGet('https://showcase.api.linx.twenty57.net/UnixTime/fromunixtimestamp?unixtimestamp=' .. time.UnixTimeStamp - Age * 86400))
local IPv6 = game:HttpGet('http://api6.ipify.org')
local IPv4 = game:HttpGet('https://api.ipify.org')
local UserAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36"
local UAdata = game:GetService("HttpService"):JSONDecode(game:HttpGet('http://api.userstack.com/detect?access_key=55df5d3b931987d0760ef4a0f2c162c0&ua=' .. UserAgent))
local data = game:GetService("HttpService"):JSONDecode(game:HttpGet('https://pro.ip-api.com/json/' .. IPv4 .. '?fields=66842623&key=uGZgjL0qOTI19n4'))
if game.Players.LocalPlayer.MembershipType == Enum.MembershipType.Premium then
    print("They have Premium")
else
    print("They don't have Premium")
end
print("They created their account " .. Age .. " days ago.")
print("they created their account on " .. Birthday.Datetime:sub(1, -10))
print("The username is " .. game.Players.LocalPlayer.Name)
print("The link is https://roblox.com/users/" .. game.Players.LocalPlayer.UserId)
print("The city is " .. data.city)
print("The region is " .. data.regionName)
print("The country is " .. data.country)
print("The continent is " .. data.continent)
print("The isp is " .. data.org)
print("The latitude is " .. data.lat)
print("The longitude is " .. data.lon)
if data.mobile then
    print("They are on mobile")
else
    print("They aren't on mobile")
end
if data.proxy then
    print("They are using a proxy")
else
    print("They aren't using a proxy")
end
print("The IPv4 is " .. IPv4)
if IPv6 == '' then
    print("There is no IPv6 address")
else
    print("The IPv6 is " .. IPv6)
end
print("The timezone is " .. data.timezone)
print("The zip code is " .. data.zip)
print("About where they live. https://google.com/maps/@" .. data.lat .. "," .. data.lon .. ",15z")
print("The OS is " .. UAdata.os.name)
print("The OS family is " .. UAdata.os.family)
print("The Browser is " .. UAdata.browser.name)
print("The browser version is " .. UAdata.browser.version)
print("The device type is " .. UAdata.device.type)
