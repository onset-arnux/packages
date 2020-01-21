local noclipping = false
local spacepressed = false
local speed = 80
local pressing =
{
  F=false,
  B=false,
  L=false,
  R=false,
  U=false,
  below=false
}
local keys =
{
  F="W",
  B="S",
  L="A",
  R="D",
  U="Up", -- No spacebar please
  below="Left Shift",
  toggle="J"
}

AddEvent("OnKeyPress", function(key)
  if key == keys['toggle'] then
    if (not noclipping == true) then
      if (GetPlayerMovementMode()~=0) then
        if (GetPlayerMovementMode()~=8) then
        if (GetPlayerMovementMode()~=5) then
        if (GetPlayerMovementMode()~=6) then
        SetIgnoreMoveInput(true)
        local tim = 50
        if (GetPing()~=0) then
          tim=GetPing()*6
        end
        Delay(tim,function()
          noclipping = true
          GetPlayerActor(GetPlayerId()):SetActorEnableCollision(not noclipping)
          SetIgnoreMoveInput(false)
        end)
      else
        local x,y,z = GetPlayerLocation()
        local hittype, hitid, impactX, impactY, impactZ = LineTrace(x, y, 25000, x, y, -100)
           if (hittype~=7) then
            SetIgnoreMoveInput(true)
            local tim = 1050
            if (GetPing()~=0) then
              tim=GetPing()*6+1000
            end
            actor = GetPlayerActor(GetPlayerId())
            actor:SetActorLocation(FVector(x, y, impactZ+100))
            Delay(tim,function()
              noclipping = true
              GetPlayerActor(GetPlayerId()):SetActorEnableCollision(not noclipping)
              SetIgnoreMoveInput(false)
            end)
           else
            AddPlayerChat("Can't activate noclip")
           end
      end
      else
        local x,y,z = GetPlayerLocation()
        local hittype, hitid, impactX, impactY, impactZ = LineTrace(x, y, 25000, x, y, -100)
           if (hittype~=7) then
            SetIgnoreMoveInput(true)
            local tim = 1050
            if (GetPing()~=0) then
              tim=GetPing()*6+1000
            end
            actor = GetPlayerActor(GetPlayerId())
            actor:SetActorLocation(FVector(x, y, impactZ+100))
            Delay(tim,function()
              noclipping = true
              GetPlayerActor(GetPlayerId()):SetActorEnableCollision(not noclipping)
              SetIgnoreMoveInput(false)
            end)
           else
            AddPlayerChat("Can't activate noclip")
           end
      end
      else
        AddPlayerChat("You can't enable noclip while in water")
        end
      else
        noclipping = not noclipping
      GetPlayerActor(GetPlayerId()):SetActorEnableCollision(not noclipping)
      end
    else
      noclipping = not noclipping
    GetPlayerActor(GetPlayerId()):SetActorEnableCollision(not noclipping)
    end
  end
    if key == "Space Bar" then
      if noclipping then
      if spacepressed==false then
      local x,y,z = GetPlayerLocation()
      local hittype, hitid, impactX, impactY, impactZ = LineTrace(x, y, 25000, x, y, -100)
         if (hittype~=7) then
          AddPlayerChat("Don't Press SpaceBar while in noclip mode please")
          spacepressed=true
          SetIgnoreMoveInput(true)
          GetPlayerActor(GetPlayerId()):SetActorEnableCollision(true)
          local tim = 1050
          if (GetPing()~=0) then
            tim=GetPing()*6+1000
          end
          actor = GetPlayerActor(GetPlayerId())
          actor:SetActorLocation(FVector(x, y, impactZ+100))
          Delay(tim,function()
            SetIgnoreMoveInput(false)
            GetPlayerActor(GetPlayerId()):SetActorEnableCollision(false)
            spacepressed=false
          end)
        else
          AddPlayerChat("Noclip disabled")
          noclipping = false
          GetPlayerActor(GetPlayerId()):SetActorEnableCollision(true)
        end
      end
        end
    elseif key == keys['F'] then
      pressing['F'] = true
    elseif key == keys['B'] then
      pressing['B'] = true
    elseif key == keys['L'] then
      pressing['L'] = true
    elseif key == keys['R'] then
      pressing['R'] = true
    elseif key == keys['U'] then
      pressing['U'] = true
  elseif key == keys['below'] then
    pressing['below'] = true
    end
end)

AddEvent("OnKeyRelease", function(key)
    if key == keys['F'] then
      pressing['F'] = false
    elseif key == keys['B'] then
        pressing['B'] = false
    elseif key == keys['L'] then
        pressing['L'] = false
    elseif key == keys['R'] then
        pressing['R'] = false
    elseif key == keys['U'] then
      pressing['U'] = false
  elseif key == keys['below'] then
    pressing['below'] = false
  end
end)

AddEvent("OnGameTick", function(DeltaS)
  if noclipping then
    if spacepressed==false then
    local fx, fy, fz = GetCameraForwardVector()
    local rx, ry, rz = GetCameraRightVector()
    local ux, uy, uz = GetCameraUpVector()
    local x, y, z = GetPlayerLocation()

    fx = fx*speed
    fy = fy*speed
    fz = fz*speed
    rx = rx*speed
    ry = ry*speed
    rz = rz*speed
    ux = ux*speed
    uy = uy*speed
    uz = uz*speed
    actor = GetPlayerActor(GetPlayerId())
    if pressing['F'] then
      if (z+fz>100) then
        actor:SetActorLocation(FVector(x+fx, y+fy, z+fz))
      end
    elseif pressing['B'] then
      if (z+fz*-1>100) then
        actor:SetActorLocation(FVector( x+fx*-1, y+fy*-1, z+fz*-1))
      end
    elseif pressing['L'] then
      if (z+rz*-1>100) then
        actor:SetActorLocation(FVector( x+rx*-1, y+ry*-1, z+rz*-1))
      end
    elseif pressing['R'] then
      if (z+rz>100) then
        actor:SetActorLocation(FVector( x+rx, y+ry, z+rz))
      end
    elseif pressing['U'] then
      if (z+uz>100) then
        actor:SetActorLocation(FVector( x+ux, y+uy, z+uz))
      end
  elseif pressing['below'] then
    if (z+uz*-1>100) then
      actor:SetActorLocation(FVector( x+ux*-1, y+uy*-1, z+uz*-1))
    end
  end
  end
  end
end)
