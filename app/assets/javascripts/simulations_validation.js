$(document).ready(function(){

  if ($('#simulation_icbmBlueLaunch').is(':checked')) {
    $('.icbm-hide').removeClass("hide");
  }
  else {
    $('.icbm-hide').addClass("hide");
  }

  // But regardless, swap it around when someone checks the box.
  $('#simulation_icbmBlueLaunch').change(function() {
    if ($(this).is(':checked')) {
      $('.icbm-hide').removeClass("hide");
    }
    else {
      $('.icbm-hide').addClass("hide");
    }
  });

  // But regardless, swap it around when someone checks the box.

  if ($("#simulation_bombsSurvive").is(':checked')) {
    $('.bombers-hide').removeClass("hide");
  }
  else {
    $('.bombers-hide').addClass("hide");
    $('.bombers-hide > input').val('');
  }

  $('#simulation_bombsSurvive').change(function() {
    if ($(this).is(':checked')) {
      $('.bombers-hide').removeClass("hide");
    }
    else {
      $('.bombers-hide').addClass("hide");
      $('.bombers-hide > input').val('');
    }
  });

   // If number of operational subs is 0, hide the two below fields.
  $('#simulation_subsOperational').change(function(){
    if ($(this).val()==0) {
      $('#simulation_subsSeaRate').val('0');
      $('#simulation_subsTubes').val('0');
      $('.subs-hide').addClass("hide");
    }
    else {
      $('.subs-hide').removeClass("hide");
      $('#simulation_subsSeaRate').val('');
      $('#simulation_subsTubes').val('');
    }
  });

  $('#simulation_icbmMax').change(function(){
    if ($(this).val()==0) {
      $('#simulation_icbmMirv').val('1.0');
      $('.mirv-hide').addClass("hide");
    }
    else {
      $('#simulation_icbmMirv').val('');
      $('.mirv-hide').removeClass("hide");
    }
  });

  // Ensure MIRV * maximum number of ICBM does not exceed blue preinventory
  $('#simulation_icbmMirv').change(function(){
    if ($('#simulation_blueInventory').val != "" && $('#simulation_icbmMax').val != "") {
      if (($(this).val() * $('#simulation_icbmMax').val()) > $('#simulation_blueInventory').val()) {
        $(this).val('');
        swal({
              title: "Sorry!",
              text: "MIRV ratio times maximum number of ICBMs should not exceed blue preinventory.",
              timer: 4000,
              type: "error"
            });
      }
    }
  });

  // Ensure MIRV * maximum number of ICBM does not exceed blue preinventory
  $('#simulation_icbmMax').change(function(){
    if ($('#simulation_icbmMirv').val != "" && $('#simulation_blueInventory').val != "") {
      if (($(this).val() * $('#simulation_icbmMirv').val()) > $('#simulation_blueInventory').val()) {
        $(this).val('');
        swal({
              title: "Sorry!",
              text: "MIRV ratio times maximum number of ICBMs should not exceed blue preinventory.",
              timer: 4000,
              type: "error"
            });
      }
    }
  });

  // Ensure MIRV * maximum number of ICBM does not exceed blue preinventory
  $('#simulation_blueInventory').change(function(){
    if ($('#simulation_icbmMirv').val != "" && $('#simulation_icbmMax').val != "") {
      if (($('#simulation_icbmMax').val() * $('#simulation_icbmMirv').val()) > $(this).val()) {
        $(this).val('');
        swal({
              title: "Sorry!",
              text: "MIRV ratio times maximum number of ICBMs should not exceed blue preinventory.",
              timer: 4000,
              type: "error"
            });
      }
    }
  });

  // Prevent red inventory deficit spending.
  // Ensure MIRV * maximum number of ICBM does not exceed blue preinventory
  //parseInt()
  $('#simulation_redRatio').change(function(){
    if ($('#simulation_redRatio').val() != "" && $('#simulation_icbmMax').val() != "" && $('#simulation_redBases').val() != "" && $('#simulation_redInventory').val() != "") {
      if ($('#simulation_icbmBlueLaunch').is(':checked')) {
        if ((parseInt($('#simulation_redRatio').val()) * parseInt($('#simulation_icbmMax').val()) + (.1 * parseInt($('#simulation_icbmMax').val())) + parseInt($('#simulation_redBases').val())) > parseInt($('#simulation_redInventory').val())) {
          $(this).val('');
          swal({
              title: "Sorry!",
              text: "No attack deficit spending.",
              timer: 4000,
              type: "error"
            });
        }
      }
      else {
        if ((parseInt($('#simulation_redRatio').val()) * parseInt($('#simulation_icbmMax').val()) + parseInt($('#simulation_redBases').val())) > parseInt($('#simulation_redInventory').val())) {
          $(this).val('');
          swal({
              title: "Sorry!",
              text: "No attack deficit spending.",
              timer: 4000,
              type: "error"
            });
        }
      }
    }
  });

$('#simulation_icbmMax').change(function(){
    if ($('#simulation_redRatio').val() != "" && $('#simulation_icbmMax').val() != "" && $('#simulation_redBases').val() != "" && $('#simulation_redInventory').val() != "") {
      if ($('#simulation_icbmBlueLaunch').is(':checked')) {
        if ((parseInt($('#simulation_redRatio').val()) * parseInt($('#simulation_icbmMax').val()) + (.1 * parseInt($('#simulation_icbmMax').val())) + parseInt($('#simulation_redBases').val())) > parseInt($('#simulation_redInventory').val())) {
          $(this).val('');
          swal({
              title: "Sorry!",
              text: "No attack deficit spending.",
              timer: 4000,
              type: "error"
            });
        }
      }
      else {
        if ((parseInt($('#simulation_redRatio').val()) * parseInt($('#simulation_icbmMax').val()) + parseInt($('#simulation_redBases').val())) > parseInt($('#simulation_redInventory').val())) {
          $(this).val('');
          swal({
              title: "Sorry!",
              text: "No attack deficit spending.",
              timer: 4000,
              type: "error"
            });
        }
      }
    }
  });

$('#simulation_redInventory').change(function(){
    if ($('#simulation_redRatio').val() != "" && $('#simulation_icbmMax').val() != "" && $('#simulation_redBases').val() != "" && $('#simulation_redInventory').val() != "") {
      if ($('#simulation_icbmBlueLaunch').is(':checked')) {
        if ((parseInt($('#simulation_redRatio').val()) * parseInt($('#simulation_icbmMax').val()) + (.1 * parseInt($('#simulation_icbmMax').val())) + parseInt($('#simulation_redBases').val())) > parseInt($('#simulation_redInventory').val())) {
          $(this).val('');
          swal({
              title: "Sorry!",
              text: "No attack deficit spending.",
              timer: 4000,
              type: "error"
            });
        }
      }
      else {
        if ((parseInt($('#simulation_redRatio').val()) * parseInt($('#simulation_icbmMax').val()) + parseInt($('#simulation_redBases').val())) > parseInt($('#simulation_redInventory').val())) {
          $(this).val('');
          swal({
              title: "Sorry!",
              text: "No attack deficit spending.",
              timer: 4000,
              type: "error"
            });
        }
      }
    }
  });

$('#simulation_redBases').change(function(){
    if ($('#simulation_redRatio').val() != "" && $('#simulation_icbmMax').val() != "" && $('#simulation_redBases').val() != "" && $('#simulation_redInventory').val() != "") {
      if ($('#simulation_icbmBlueLaunch').is(':checked')) {
        if ((parseInt($('#simulation_redRatio').val()) * parseInt($('#simulation_icbmMax').val()) + (.1 * parseInt($('#simulation_icbmMax').val())) + parseInt($('#simulation_redBases').val())) > parseInt($('#simulation_redInventory').val())) {
          $(this).val('');
          swal({
              title: "Sorry!",
              text: "No attack deficit spending.",
              timer: 4000,
              type: "error"
            });
        }
      }
      else {
        if ((parseInt($('#simulation_redRatio').val()) * parseInt($('#simulation_icbmMax').val()) + parseInt($('#simulation_redBases').val())) > parseInt($('#simulation_redInventory').val())) {
          $(this).val('');
          swal({
              title: "Sorry!",
              text: "No attack deficit spending.",
              timer: 4000,
              type: "error"
            });
        }
      }
    }
  });

  $("input").change(function() {
    if ($('#simulation_blueInventory').val() != "" && $('#simulation_icbmMax').val() != "" 
      && $('#simulation_bombsPostStrike').val() != "") {
      
      //if ($("#simulation_bombsPercentage").val() == "") {
        var bombsPercentage = 1;
      //}
      //else {
        var bombsPercentage = parseInt($("#simulation_bombsPercentage").val());
      //}
      if ($("#simulation_icbmMirv").val() == "") {
        var icbmMirv = 1;
      }
      else {
        var icbmMirv = parseInt($("#simulation_icbmMirv").val());
      }

      if ((parseInt($("#simulation_blueInventory").val()) 
        - (parseInt($("#simulation_icbmMax").val()) * icbmMirv) - 
        (parseInt($("#simulation_bombsPostStrike").val()) * bombsPercentage)) < 0) {
        $(this).val('');
        swal({
            title: "Sorry!",
            text: "No navy subs deficit spending.",
            timer: 4000,
            type: "error"
          });
      }
      
    }

    if ($('#simulation_blueInventory').val() != "" && $('#simulation_icbmMax').val() != "" 
      && $('#simulation_bombsPostStrike').val() != "") {
      if ((parseInt($('#simulation_icbmMax').val()) + parseInt($('#simulation_bombsPostStrike').val())) > parseInt($('#simulation_blueInventory').val())) {
        $(this).val('');
        swal({
            title: "Sorry!",
            text: "No navy subs deficit spending.",
            timer: 4000,
            type: "error"
          });
      }
    }

    if (parseInt($('#simulation_subsSeaRate').val()) > 1 || parseInt($('#simulation_subsSeaRate').val()) < 0) {
      $('#simulation_subsSeaRate').val('');
      swal({
            title: "Sorry!",
            text: "Please enter a value between 0 and 1.",
            timer: 4000,
            type: "error"
          });
    }

    if (parseInt($('#simulation_redPk').val()) > 1 || parseInt($('#simulation_redPk').val()) < 0) {
      $('#simulation_redPk').val('');
      swal({
            title: "Sorry!",
            text: "Please enter a value between 0 and 1.",
            timer: 4000,
            type: "error"
          });
    }

    if (parseInt($('#simulation_bombsPercentage').val()) > 1 || parseInt($('#simulation_bombsPercentage').val()) < 0) {
      $('#simulation_bombsPercentage').val('');
      swal({
            title: "Sorry!",
            text: "Please enter a value between 0 and 1.",
            timer: 4000,
            type: "error"
          });
    }
  });

});