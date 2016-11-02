// Action script...

// [onClipEvent of sprite 38 in frame 2]
onClipEvent (construct)
{
    enabled = true;
    html = false;
    multiline = false;
    styleName = "default";
    text = "";
    wordWrap = false;
}

// [Initial MovieClip Action of sprite 39]
#initclip 12
Object.registerClass("Button", ank.gapi.controls.Button);
#endinitclip

// [Action in Frame 1]
stop ();
