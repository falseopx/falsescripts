local Codes = {
  "unusualbias",
  "POG",
  "BLOXY",
  "Bandites",
  "EPRIKA",
  "FLAMINGO",
  "JOHN",
  "KITTEN",
  "PET",
  "ANNA",
  "F00LISH",
  "CBROX",
  "POKE",
  "ROLVE"
}
local RedeemEvent = game:GetService("ReplicatedStorage").Redeem
for _, event in pairs(Codes) do
  wait(0.5)
  RedeemEvent:InvokeServer(event)
end
