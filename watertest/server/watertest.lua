print("Loading water test!")
-- test
function waterlevelmin200(player)
    CallRemoteEvent(player, "waterlevelmin200")
    AddPlayerChat(player, "Set to 200")
end
AddCommand("200", waterlevelmin200)

function waterlevelmin1000(player)
    CallRemoteEvent(player, "waterlevelmin1000")
    AddPlayerChat(player, "Set to 1000")
end
AddCommand("1000", waterlevelmin1000)

function waterlevelmin5000(player)
    CallRemoteEvent(player, "waterlevelmin5000")
    AddPlayerChat(player, "Set to 5000")
end
AddCommand("5000", waterlevelmin5000)

function waterlevelmin10000(player)
    CallRemoteEvent(player, "waterlevelmin10000")
    AddPlayerChat(player, "Set to 10000")
end
AddCommand("10000", waterlevelmin10000)

function waterlevelmin0(player)
    CallRemoteEvent(player, "waterlevelmin0")
    AddPlayerChat(player, "Set to 0")
end
AddCommand("0", waterlevelmin0)
