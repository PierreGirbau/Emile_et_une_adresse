function modalShow () {
  $(document).ready(function(){
      // Show the Modal on load
      $("#modal-id").modal("show");
      $("#modal-id-2").click(function(){
          $("#modal-id").modal("hide");
      });
});
};

export { modalShow };

// .label[for=place_type_of_place_1]"
