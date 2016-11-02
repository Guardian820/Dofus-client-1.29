// Action script...

// [Initial MovieClip Action of sprite 20872]
#initclip 137
if (!dofus.aks.Mount)
{
    if (!dofus)
    {
        _global.dofus = new Object();
    } // end if
    if (!dofus.aks)
    {
        _global.dofus.aks = new Object();
    } // end if
    var _loc1 = (_global.dofus.aks.Mount = function (oAKS, oAPI)
    {
        super.initialize(oAKS, oAPI);
    }).prototype;
    _loc1.rename = function (sName)
    {
        this.aks.send("Rn" + sName, true);
    };
    _loc1.kill = function ()
    {
        this.aks.send("Rf");
    };
    _loc1.setXP = function (nValue)
    {
        this.aks.send("Rx" + nValue, true);
    };
    _loc1.ride = function ()
    {
        this.aks.send("Rr", false);
    };
    _loc1.data = function (nMountID, sTime)
    {
        this.aks.send("Rd" + nMountID + "|" + sTime, true);
    };
    _loc1.parkMountData = function (nSpriteID)
    {
        this.aks.send("Rp" + nSpriteID, true);
    };
    _loc1.removeObjectInPark = function (nCellNum)
    {
        this.aks.send("Ro" + nCellNum, true);
    };
    _loc1.mountParkSell = function (nPrice)
    {
        this.aks.send("Rs" + nPrice, true);
    };
    _loc1.mountParkBuy = function (nPrice)
    {
        this.aks.send("Rb" + nPrice, true);
    };
    _loc1.leave = function ()
    {
        this.aks.send("Rv");
    };
    _loc1.castrate = function ()
    {
        this.aks.send("Rc");
    };
    _loc1.onEquip = function (sExtraData)
    {
        var _loc3 = sExtraData.charAt(0);
        switch (_loc3)
        {
            case "+":
            {
                this.api.datacenter.Player.mount = this.createMount(sExtraData.substr(1));
                break;
            } 
            case "-":
            {
                this.unequipMount();
                break;
            } 
            case "E":
            {
                this.equipError(sExtraData.charAt(1));
                break;
            } 
        } // End of switch
    };
    _loc1.onXP = function (sExtraData)
    {
        var _loc3 = Number(sExtraData);
        if (!_global.isNaN(_loc3))
        {
            this.api.datacenter.Player.mountXPPercent = _loc3;
        } // end if
    };
    _loc1.onName = function (sExtraData)
    {
        this.api.datacenter.Player.mount.name = sExtraData;
    };
    _loc1.onData = function (sExtraData)
    {
        var _loc3 = this.createMount(sExtraData);
        this.api.ui.loadUIComponent("MountViewer", "MountViewer", {mount: _loc3});
    };
    _loc1.onMountPark = function (sExtraData)
    {
        var _loc3 = sExtraData.split(";");
        var _loc4 = Number(_loc3[0]);
        var _loc5 = Number(_loc3[1]);
        var _loc6 = Number(_loc3[2]);
        var _loc7 = Number(_loc3[3]);
        var _loc8 = _loc3[4];
        var _loc9 = _loc3[5];
        var _loc10 = this.api.kernel.CharactersManager.createGuildEmblem(_loc9);
        this.api.datacenter.Map.mountPark = new dofus.datacenter.MountPark(_loc4, _loc5, _loc6, _loc7, _loc8, _loc10);
    };
    _loc1.onRidingState = function (sExtraData)
    {
        var _loc3 = sExtraData.charAt(0);
        switch (_loc3)
        {
            case "+":
            {
                this.api.datacenter.Player.isRiding = true;
                break;
            } 
            case "-":
            {
                this.api.datacenter.Player.isRiding = false;
                break;
            } 
        } // End of switch
    };
    _loc1.onMountParkBuy = function (sExtraData)
    {
        var _loc3 = sExtraData.split("|");
        this.api.ui.loadUIComponent("MountParkSale", "MountParkSale", {defaultPrice: Number(_loc3[1])});
    };
    _loc1.onLeave = function ()
    {
        this.api.ui.unloadUIComponent("MountParkSale");
    };
    _loc1.equipError = function (errorType)
    {
        switch (errorType)
        {
            case "-":
            {
                var _loc3 = this.api.lang.getText("MOUNT_ERROR_INVENTORY_NOT_EMPTY");
                break;
            } 
            case "+":
            {
                _loc3 = this.api.lang.getText("MOUNT_ERROR_ALREADY_HAVE_ONE");
                break;
            } 
            case "r":
            {
                _loc3 = this.api.lang.getText("MOUNT_ERROR_RIDE");
                break;
            } 
        } // End of switch
        this.api.kernel.showMessage(undefined, _loc3, "ERROR_CHAT");
    };
    _loc1.unequipMount = function ()
    {
        this.api.datacenter.Player.mount = undefined;
    };
    _loc1.createMount = function (sParams)
    {
        var _loc3 = sParams.split(":");
        var _loc4 = Number(_loc3[1]);
        var _loc5 = new dofus.datacenter.Mount(_loc4, undefined);
        _loc5.ID = _loc3[0];
        _loc5.ancestors = _loc3[2].split(",");
        var _loc6 = _loc3[3].split(",");
        _loc5.capacities = new ank.utils.ExtendedArray();
        var _loc7 = 0;
        
        while (++_loc7, _loc7 < _loc6.length)
        {
            var _loc8 = Number(_loc6[_loc7]);
            if (_loc8 != 0 && !_global.isNaN(_loc8))
            {
                _loc5.capacities.push({label: this.api.lang.getMountCapacity(_loc8).n, data: _loc8});
            } // end if
        } // end while
        _loc5.name = _loc3[4] == "" ? (this.api.lang.getText("NO_NAME")) : (_loc3[4]);
        _loc5.sex = Number(_loc3[5]);
        var _loc9 = _loc3[6].split(",");
        _loc5.xp = Number(_loc9[0]);
        _loc5.xpMin = Number(_loc9[1]);
        _loc5.xpMax = Number(_loc9[2]);
        _loc5.level = Number(_loc3[7]);
        _loc5.mountable = Number(_loc3[8]);
        _loc5.podsMax = Number(_loc3[9]);
        _loc5.wild = Number(_loc3[10]);
        var _loc10 = _loc3[11].split(",");
        _loc5.stamina = Number(_loc10[0]);
        _loc5.staminaMax = Number(_loc10[1]);
        var _loc11 = _loc3[12].split(",");
        _loc5.maturity = Number(_loc11[0]);
        _loc5.maturityMax = Number(_loc11[1]);
        var _loc12 = _loc3[13].split(",");
        _loc5.energy = Number(_loc12[0]);
        _loc5.energyMax = Number(_loc12[1]);
        var _loc13 = _loc3[14].split(",");
        _loc5.serenity = Number(_loc13[0]);
        _loc5.serenityMin = Number(_loc13[1]);
        _loc5.serenityMax = Number(_loc13[2]);
        var _loc14 = _loc3[15].split(",");
        _loc5.love = Number(_loc14[0]);
        _loc5.loveMax = Number(_loc14[1]);
        _loc5.fecondation = Number(_loc3[16]);
        _loc5.fecondable = Number(_loc3[17]);
        _loc5.setEffects(_loc3[18]);
        var _loc15 = _loc3[19].split(",");
        _loc5.tired = Number(_loc15[0]);
        _loc5.tiredMax = Number(_loc15[1]);
        var _loc16 = _loc3[20].split(",");
        _loc5.reprod = Number(_loc16[0]);
        _loc5.reprodMax = Number(_loc16[1]);
        return (_loc5);
    };
    ASSetPropFlags(_loc1, null, 1);
} // end if
#endinitclip
