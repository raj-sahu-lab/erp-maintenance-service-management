function isProgressBar() {
    var prm = Sys.WebForms.PageRequestManager.getInstance();

    prm.add_initializeRequest(InitializeRequest);
    prm.add_endRequest(EndRequest);
    var postBackElement;
    function InitializeRequest(sender, args) {

        if (prm.get_isInAsyncPostBack())
            args.set_cancel(true);
        postBackElement = args.get_postBackElement();
        if (postBackElement.id == 'Button1')
            $get('UpdateProgress1').style.display = 'block';
    }

    function EndRequest(sender, args) {
        if (postBackElement.id == 'Button1')
            $get('UpdateProgress1').style.display = 'none';
    }

}


function NewDoc() {
    jQuery(document).ready(function () {
        $("#Gridview1").tablesorter({ debug: false, widgets: ['zebra'], sortList: [[0, 0]] });
    });
}
