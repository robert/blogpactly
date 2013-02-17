jQuery ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()
  $("[rel=tooltip-show]").tooltip({ trigger: "manual" }).tooltip("show",)