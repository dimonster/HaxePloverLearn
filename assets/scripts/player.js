var params = {
  menu: "false",
  scale: "noScale",
  allowFullscreen: "true",
  allowScriptAccess: "always",
  bgcolor: "",
  wmode: "direct" // can cause issues with FP settings & webcam
};
var attributes = {
  id:"StenoPlatformer"
};
var flashvars = {
  random: location.hash == "#random" ? "true" : "false",
  repeat: location.hash == "#repeat" ? "true" : "false"
};

swfobject.embedSWF(
  "/assets/StenoPlatformer.swf",
  "fallbackContent", "960", "480", "10.0.0",
  "/assets/expressInstall.swf",
  flashvars, params, attributes);
