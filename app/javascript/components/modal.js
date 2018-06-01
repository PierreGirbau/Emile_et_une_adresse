function modalShow () {
  $(document).ready(function(){
      // Show the Modal on load
    $("#modal-id").modal({backdrop: 'static', keyboard: false});
    $("#modal-id-2").click(function(){
        $("#modal-id").modal("hide");
    });
  });
};

export { modalShow };