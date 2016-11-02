// Action script...

// [Initial MovieClip Action of sprite 20634]
#initclip 155
if (!dofus.graphics.battlefield.TextOverHead)
{
    if (!dofus)
    {
        _global.dofus = new Object();
    } // end if
    if (!dofus.graphics)
    {
        _global.dofus.graphics = new Object();
    } // end if
    if (!dofus.graphics.battlefield)
    {
        _global.dofus.graphics.battlefield = new Object();
    } // end if
    var _loc1 = (_global.dofus.graphics.battlefield.TextOverHead = function (sText, sFile, nColor, nFrame, nPvpGain)
    {
        super();
        this.initialize();
        this.draw(sText, sFile, nColor, nFrame, nPvpGain);
    }).prototype;
    _loc1.initialize = function ()
    {
        super.initialize();
        this.createTextField("_txtText", 30, 0, -3 + dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER, 0, 0);
        this._txtText.embedFonts = true;
    };
    _loc1.draw = function (sText, sFile, nColor, nFrame, nPvpGain)
    {
        var _loc7 = sFile != undefined && nFrame != undefined;
        if (nPvpGain == undefined)
        {
            nPvpGain = 0;
        } // end if
        this._txtText.autoSize = "center";
        this._txtText.text = sText;
        this._txtText.selectable = false;
        this._txtText.setTextFormat(dofus.graphics.battlefield.AbstractTextOverHead.TEXT_FORMAT);
        if (nColor != undefined)
        {
            this._txtText.textColor = nColor;
        } // end if
        var _loc8 = Math.ceil(this._txtText.textHeight + dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER * 2);
        var _loc9 = Math.ceil(this._txtText.textWidth + dofus.graphics.battlefield.AbstractTextOverHead.WIDTH_SPACER * 2);
        this.drawBackground(_loc9, _loc8, dofus.graphics.battlefield.AbstractTextOverHead.BACKGROUND_COLOR);
        if (_loc7)
        {
            this.drawGfx(sFile, nFrame);
            this.addPvpGfxEffect(nPvpGain, nFrame);
        } // end if
    };
    ASSetPropFlags(_loc1, null, 1);
} // end if
#endinitclip
