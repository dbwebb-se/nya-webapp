(function () {
    'use strict';

    // Add shared header and footer as a toolbar.
//    $("[data-role='header']").toolbar().enhanceWithin();
//    $("[data-role='footer']").toolbar().enhanceWithin();
    $("#header").toolbar();
    $("#footer").toolbar();

    // Add shared panel as a panel.
    //$("#menu").panel();
    $("#menu").panel().enhanceWithin();
})();
