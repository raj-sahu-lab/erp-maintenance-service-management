 function OpenModelPopup()
    {
        //document.getElementById('tdMyPhoto').innerHTML = '';
        document.getElementById ('ModalPopupDiv').style.visibility='visible';
        document.getElementById ('ModalPopupDiv').style.display='';
        document.getElementById ('ModalPopupDiv').style.top= Math.round ((document.documentElement.clientHeight/2)+ document.documentElement.scrollTop)-100 + 'px';
        document.getElementById ('ModalPopupDiv').style.left='400px';
        
        document.getElementById ('MaskedDiv').style.display='';
        document.getElementById ('MaskedDiv').style.visibility='visible';
        document.getElementById ('MaskedDiv').style.top='0px';
        document.getElementById ('MaskedDiv').style.left='0px';
        document.getElementById ('MaskedDiv').style.width=  document.documentElement.clientWidth + 'px';
        document.getElementById ('MaskedDiv').style.height= document.documentElement.clientHeight+ 'px';
    }
    function CloseModelPopup()
    {
        document.getElementById ('MaskedDiv').style.display='none';
        document.getElementById('ModalPopupDiv').style.display = 'none';
    }