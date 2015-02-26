$(document).ready(function() {


  $('input[type="submit"]').click(function(e) {
    ($('input[type="checkbox"]')).each(function() {
      /*
      ** Require user to select a priority.
      */
      if (!$(this).is(':checked') && $(this).val() == "Prioritize SSBN over ICBM") {
        var name = $(this).attr('name');
        $('input[type="checkbox"]').each(function() {
          if ($(this).attr('name') == name && $(this).val() == "Prioritize ICBM over SSBN" 
            && !$(this).is(':checked')) {
            e.preventDefault();
            var friendlyName = "";
            switch (name) {
              case "initial_survey[groupOneSuggestions][]":
                friendlyName = "2200/2200";
                break;
              case "initial_survey[groupTwoSuggestions][]":
                friendlyName = "1550/1550";
                break;
              case "initial_survey[groupThreeSuggestions][]":
                friendlyName = "1000/1000";
                break;
              case "initial_survey[groupFourSuggestions][]":
                friendlyName = "500/500";
                break;
              case "initial_survey[groupFiveSuggestions][]":
                friendlyName = "300/300";
                break;
              default:
                friendlyName = "";
            }
            swal({
              title: "Sorry!",
              text: "Please select a priority (SSBN or ICBM) for " + friendlyName + ".",
              timer: 8000,
              type: "error"
            });
          }
        });
      }

      /*
      ** Require user to select a triad, dyad, or monad
      */
      if (!$(this).is(':checked') && $(this).val() == "Consist of a triad (three delivery systems)") {
        var name = $(this).attr('name');
        $('input[type="checkbox"]').each(function() {
          if ($(this).attr('name') == name && $(this).val() == "Consist of a dyad (two delivery systems)" 
            && !$(this).is(':checked')) {
            $('input[type="checkbox"]').each(function() {
              if ($(this).attr('name') == name && $(this).val() == "Consist of a monad (one delivery system)" 
                && !$(this).is(':checked')) {
                  e.preventDefault();
                  var friendlyName = "";
                  switch (name) {
                    case "initial_survey[groupOneSuggestions][]":
                      friendlyName = "2200/2200";
                      break;
                    case "initial_survey[groupTwoSuggestions][]":
                      friendlyName = "1550/1550";
                      break;
                    case "initial_survey[groupThreeSuggestions][]":
                      friendlyName = "1000/1000";
                      break;
                    case "initial_survey[groupFourSuggestions][]":
                      friendlyName = "500/500";
                      break;
                    case "initial_survey[groupFiveSuggestions][]":
                      friendlyName = "300/300";
                      break;
                    default:
                      friendlyName = "";
                  }
                  swal({
                    title: "Sorry!",
                    text: "Please select the number of legs (triad, dyad, or monad) for " + friendlyName + ".",
                    timer: 8000,
                    type: "error"
                  });
                }
              });
          }
        });
      }
    });
  });

  // Whenever a checkbox is changed, do the following...
  $('input[type="checkbox"]').change(function() {

    /*
    ** If PRIORITIZE SSBN OVER ICBM is checked and the other option is checked,
    ** unselect the other option and give the user an alert box.
    */
    if ($(this).val() == "Prioritize SSBN over ICBM") { 
      var clickedName = $(this).attr('name');
      $('input[type="checkbox"]').each(function() {
        // If the checkboxes are in the same group...
        if ($(this).attr('name') == clickedName) {
          // ... and if PRIORITIZE ICBM OVER SSBN is also checked...
          if ($(this).is(':checked') && $(this).val() == "Prioritize ICBM over SSBN") {
            // then give them an error
            swal({
              title: "Sorry!",
              text: "You can't prioritize both ICBM and SSBN.",
              timer: 4000,
              type: "error"
            });
            // and uncheck it for them
            $(this).attr('checked', false);
          }
        }
      });
    }


    /*
    ** If PRIORITIZE ICBM OVER SSBN is checked and the other option is checked,
    ** unselect the other option and give the user an alert box.
    */
    if ($(this).val() == "Prioritize ICBM over SSBN") { 
      var clickedName = $(this).attr('name');
      $('input[type="checkbox"]').each(function() {
        // If the checkboxes are in the same group...
        if ($(this).attr('name') == clickedName) {
          // ... and if PRIORITIZE ICBM OVER SSBN is also checked...
          if ($(this).is(':checked') && $(this).val() == "Prioritize SSBN over ICBM") {
            // then give them an error
            swal({
              title: "Sorry!",
              text: "You can't prioritize both ICBM and SSBN.",
              timer: 4000,
              type: "error"
            });
            // and uncheck it for them.
            $(this).attr('checked', false);
          }
        }
      });
    }

    /*
    ** If CONSIST OF A TRIAD is checked,
    ** automatically select all three legs.
    */
    if ($(this).val() == "Consist of a triad (three delivery systems)") {
      var clickedName = $(this).attr('name');
      $('input[type="checkbox"]').each(function() {
        // If the checkboxes are in the same group...
        if ($(this).attr('name') == clickedName) {
          // ...and if multiple legs are selected...
          if (($(this).val() == "Consist of a dyad (two delivery systems)" && $(this).is(':checked')) ||
          ($(this).val() == "Consist of a monad (one delivery system)" && $(this).is(':checked'))) {
            // uncheck the leg for them
            $(this).attr('checked', false);
            // and give them an error.
            swal({
              title: "Sorry!",
              text: "You can only make one selection among Triad, Dyad, and Monad.",
              timer: 4000,
              type: "error"
            });
          }
          if ($(this).val() == "Retain SSBN" || $(this).val() == "Retain ICBM" || $(this).val() == "Retain bombers") {
            // also, automatically select all three delivery systems.
            $(this).attr('checked', true);
          }
        }
      });
    }

    /*
    ** If CONSIST OF A DYAD is checked,
    ** uncheck other legs and ensure that only two delivery systems are recommended.
    */
    if ($(this).val() == "Consist of a dyad (two delivery systems)" && $(this).is(':checked')) {
      var clickedName = $(this).attr('name');
      var checkedRetain = 0;
      $('input[type="checkbox"]').each(function() {
        // If the checkboxes are in the same group
        if ($(this).attr('name') == clickedName) {
          if (($(this).val() == "Consist of a monad (one delivery system)" && $(this).is(':checked')) ||
          ($(this).val() == "Consist of a triad (three delivery systems)" && $(this).is(':checked'))) {
            // uncheck the other delivery systems
            $(this).attr('checked', false);
            // and give them an error.
            swal({
              title: "Sorry!",
              text: "You can only make one selection among Triad, Dyad, and Monad.",
              timer: 4000,
              type: "error"
            });
          }
          // Count the number of checked delivery systems.
          if ($(this).val() == "Retain SSBN" || $(this).val() == "Retain ICBM" || $(this).val() == "Retain bombers") {
            if ($(this).is(':checked')) {
              checkedRetain++;
            }
          }
        }
      });
      // If 3 options are checked...
      if (checkedRetain == 3) {
        $('input[type="checkbox"]').each(function() {
          // uncheck all of them
          if ($(this).val() == "Retain SSBN" || $(this).val() == "Retain ICBM" || $(this).val() == "Retain bombers") {
            $(this).attr('checked', false);
          }
        });
        // and give the user an error.
        swal({
          title: "Sorry!",
          text: "You can only select two \"retain\" options. Please reselect your choices.",
          timer: 4000,
          type: "error"
        });
      }
    }

    /*
    ** If CONSIST OF A MONAD is checked,
    ** uncheck other legs and ensure that only one delivery systems are recommended.
    */
    if ($(this).val() == "Consist of a monad (one delivery system)" && $(this).is(':checked')) {
      var clickedName = $(this).attr('name');
      var checkedRetain = 0;
      $('input[type="checkbox"]').each(function() {
        // If the checkboxes are in the same group
        if ($(this).attr('name') == clickedName) {
          if (($(this).val() == "Consist of a dyad (two delivery systems)" && $(this).is(':checked')) ||
          ($(this).val() == "Consist of a triad (three delivery systems)" && $(this).is(':checked'))) {
            // uncheck the other delivery systems
            $(this).attr('checked', false);
            // and give the user an error.
            swal({
              title: "Sorry!",
              text: "You can only make one selection among Triad, Dyad, and Monad.",
              timer: 4000,
              type: "error"
            });
        }

        if ($(this).val() == "Retain SSBN" || $(this).val() == "Retain ICBM" || $(this).val() == "Retain bombers") {
          // Count the number of selected "retain" options.
          if ($(this).is(':checked') && $(this).attr('name') == clickedName) {
            checkedRetain++;
          }
        }
      }
    });

    // If 2 or more retain options are selected.
    if (checkedRetain >= 2) {
      $('input[type="checkbox"]').each(function() {
        if ($(this).val() == "Retain SSBN" || $(this).val() == "Retain ICBM" || $(this).val() == "Retain bombers") {
          if ($(this).attr('name') == clickedName) {
            // uncheck extraneous options.
            $(this).attr('checked', false);
          }
        }
      });
      // and give the user an error.
      swal({
        title: "Sorry!",
        text: "You can only select one \"retain\" options. Please reselect your choices.",
        timer: 4000,
        type: "error"
      });
    }
  }

  /*
  ** If CONSIST OF A MONAD is checked,
  ** uncheck other legs and ensure that only one delivery systems are recommended.
  */
  if (($(this).val() == "Retain SSBN" || $(this).val() == "Retain ICBM" || $(this).val() == "Retain bombers") && $(this).is(':checked')) {
    var clickedName = $(this).attr('name');
    var checkedDyad = false;
    var checkedMonad = false;
    var checkedRetain = 0;
    $('input[type="checkbox"]').each(function() {
      // If dyad is checked, mark this in a variable.
      if ($(this).val() == "Consist of a dyad (two delivery systems)" && $(this).is(':checked')  && $(this).attr('name') == clickedName) {
        checkedDyad = true;
      }

      // If monad is checked, mark this in a variable.
      if ($(this).val() == "Consist of a monad (one delivery system)" && $(this).is(':checked')  && $(this).attr('name') == clickedName) {
        checkedMonad = true;
      }

      // If the checkboxes are in the same group
      if ($(this).attr('name') == clickedName) {
        if ($(this).val() == "Retain ICBM" || $(this).val() == "Retain bombers" || $(this).val() == "Retain SSBN") {
          // Check all three "retain options"
          if ($(this).is(':checked')) {
            checkedRetain++;
          }
        }
      }
    });

    // If three are checked and dyad is also checked.
    if (checkedRetain == 3 && checkedDyad) {
      $('input[type="checkbox"]').each(function() {
        if ($(this).val() == "Retain SSBN" || $(this).val() == "Retain ICBM" || $(this).val() == "Retain bombers") {
          if ($(this).attr('name') == clickedName) {
            // uncheck the options
            $(this).attr('checked', false);
          }
        }
      });
      // and give the user an error.
      swal({
        title: "Sorry!",
        text: "You can only select two \"retain\" options. Please reselect your choices.",
        timer: 4000,
        type: "error"
      });
    }

    if (checkedRetain >= 2 && checkedMonad) {
      $('input[type="checkbox"]').each(function() {
        if ($(this).val() == "Retain SSBN" || $(this).val() == "Retain ICBM" || $(this).val() == "Retain bombers") {
          if ($(this).attr('name') == clickedName) {
            // uncheck the options
            $(this).attr('checked', false);
          }
        }
      });
      // and give the user an error.
      swal({
        title: "Sorry!",
        text: "You can only select one \"retain\" options. Please reselect your choices.",
        timer: 4000,
        type: "error"
      });
    }
  }

  });
});