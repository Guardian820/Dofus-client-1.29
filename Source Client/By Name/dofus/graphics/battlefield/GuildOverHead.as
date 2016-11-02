// Action script...

// [Initial MovieClip Action of sprite 20825]
#initclip 90
if (!dofus.graphics.battlefield.GuildOverHead)
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
    var _loc1 = (_global.dofus.graphics.battlefield.GuildOverHead = function (sText, sSpriteName, oEmblem, sFile, nFrame, nPvpGain)
    {
        super();
        this.initialize();
        this.draw(sText, sSpriteName, oEmblem, sFile, nFrame, nPvpGain);
    }).prototype;
    _loc1.initialize = function ()
    {
        super.initialize();
        this.createTextField("_txtGuildName", 30, 0, -2 + dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER, 0, 0);
        this.createTextField("_txtSpriteName", 40, 0, 13 + dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER, 0, 0);
    };
    _loc1.draw = function (sGuildName, sSpriteName, oEmblem, sFile, nFrame, nPvpGain)
    {
        var _loc8 = sFile != undefined && nFrame != undefined;
        if (nPvpGain == undefined)
        {
            nPvpGain = 0;
        } // end if
        this._txtGuildName.embedFonts = true;
        this._txtGuildName.autoSize = "left";
        this._txtGuildName.text = sGuildName;
        this._txtGuildName.selectable = false;
        this._txtGuildName.setTextFormat(dofus.graphics.battlefield.AbstractTextOverHead.TEXT_SMALL_FORMAT);
        this._txtSpriteName.embedFonts = true;
        this._txtSpriteName.autoSize = "left";
        this._txtSpriteName.text = sSpriteName;
        this._txtSpriteName.selectable = false;
        this._txtSpriteName.setTextFormat(dofus.graphics.battlefield.AbstractTextOverHead.TEXT_FORMAT);
        var _loc9 = Math.ceil(30 + dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER * 2);
        var _loc10 = Math.ceil(Math.max(this._txtGuildName.textWidth, this._txtSpriteName.textWidth) + dofus.graphics.battlefield.AbstractTextOverHead.WIDTH_SPACER * 4) + 30;
        this._txtGuildName._x = this._txtSpriteName._x = -_loc10 / 2 + 30 + dofus.graphics.battlefield.AbstractTextOverHead.WIDTH_SPACER * 2;
        this.drawBackground(_loc10, _loc9, dofus.graphics.battlefield.AbstractTextOverHead.BACKGROUND_COLOR);
        this.attachMovie("Emblem", "_eEmblem", 100, {_x: Math.ceil(-_loc10 / 2) + dofus.graphics.battlefield.AbstractTextOverHead.WIDTH_SPACER, _y: dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER, _height: 30, _width: 30, data: oEmblem, shadow: true});
        if (_loc8)
        {
            this.drawGfx(sFile, nFrame);
            this.addPvpGfxEffect(nPvpGain, nFrame);
        } // end if
    };
    ASSetPropFlags(_loc1, null, 1);
} // end if
#endinitclip
