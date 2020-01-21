print("Loading water test!")
-- test

function waterlevelmin200()
    SetOceanWaterLevel(-200, true)
    AddPlayerChat("CLIENT RECIEVED")
end
AddRemoteEvent("waterlevelmin200", waterlevelmin200)

function waterlevelmin1000()
    SetOceanWaterLevel(1000, true)
    AddPlayerChat("CLIENT RECIEVED")
end
AddRemoteEvent("waterlevelmin1000", waterlevelmin1000)

function waterlevelmin5000()
    SetOceanWaterLevel(5000, true)
    AddPlayerChat("CLIENT RECIEVED")
end
AddRemoteEvent("waterlevelmin5000", waterlevelmin5000)

function waterlevelmin10000()
    SetOceanWaterLevel(10000, true)
    AddPlayerChat("CLIENT RECIEVED")
end
AddRemoteEvent("waterlevelmin10000", waterlevelmin10000)

function waterlevelmin0()
    SetOceanWaterLevel(0, true)
    AddPlayerChat("CLIENT RECIEVED")
end
AddRemoteEvent("waterlevelmin0", waterlevelmin0)
