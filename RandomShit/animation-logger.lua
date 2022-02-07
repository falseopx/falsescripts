local anims = {}
local settings = getgenv().settings or {
    log_duration = 10;
    print_anims = true;
    write_to_file = true;
    clearconsole = true;
    clearingtime = 5;
}
rconsolename("false's animation grabber ~ grabbing animations..")
rconsoleprint("~{ welcome! i'll be grabbing every animation played for ".. tostring(settings.log_duration) .." seconds.. }~\n")
function addanim(name, id)
    if anims[name] ~= nil then return; end
    anims[name] = id;
    rconsoleprint('@@YELLOW@@') rconsoleprint('\t[*] ') rconsoleprint('@@WHITE@@')
    rconsoleprint("added animation '".. name .." with ID ".. tostring(id) .. "'\n")
end

function grabanims()
    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
         for i,v in pairs(game.Players.LocalPlayer.Character.Humanoid:GetPlayingAnimationTracks()) do
             addanim(v.Name, v.Animation.AnimationId)
         end
    end
end

for i = 1, settings.log_duration do
    wait(1)
    grabanims()
end
rconsolename("false's animation grabber ~ finished")
rconsoleprint("done, animations should be logged to file or printed shortly\n")
if settings.write_to_file then
    writefile("animations.txt", game.HttpService:JSONEncode(anims))
end
if settings.print_anims then
    for i,v in pairs(anims) do
      rconsoleprint('@@YELLOW@@') rconsoleprint('\t[i] ') rconsoleprint('@@WHITE@@')
      rconsoleprint("name: ".. i .." | id: ".. v .."\n")
    end
end
if settings.clearconsole then
    rconsoleprint('@@YELLOW@@') rconsoleprint('[!] ') rconsoleprint('@@WHITE@@')
    rconsoleprint("console will be clearing in ".. tostring(settings.clearingtime) .." seconds!\n")
    wait(settings.clearingtime)
    rconsoleclear()
end
