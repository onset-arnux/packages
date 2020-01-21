print("Loading water test!")
-- test
function waterlevelmin200()
    SetOceanWaterLevel(-200, true)
end
AddEvent("waterlevelmin200", waterlevelmin200)

function waterlevelmin1000()
    SetOceanWaterLevel(1000, true)
end
AddEvent("waterlevelmin1000", waterlevelmin1000)

function waterlevelmin5000()
    SetOceanWaterLevel(5000, true)
end
AddEvent("waterlevelmin5000", waterlevelmin5000)

function waterlevelmin10000()
    SetOceanWaterLevel(10000, true)
end
AddEvent("waterlevelmin10000", waterlevelmin10000)

function waterlevelmin0()
    SetOceanWaterLevel(0, true)
end
AddEvent("waterlevelmin0", waterlevelmin0)
