$(document).ready(function(){$('input[type="checkbox"]').change(function(){if("Prioritize SSBN over ICBM"==$(this).val()){var t=$(this).attr("name");$('input[type="checkbox"]').each(function(){$(this).attr("name")==t&&$(this).is(":checked")&&"Prioritize ICBM over SSBN"==$(this).val()&&(swal({title:"Sorry!",text:"You can't prioritize both ICBM and SSBN.",timer:4e3,type:"error"}),$(this).attr("checked",!1))})}if("Prioritize ICBM over SSBN"==$(this).val()){var t=$(this).attr("name");$('input[type="checkbox"]').each(function(){$(this).attr("name")==t&&$(this).is(":checked")&&"Prioritize SSBN over ICBM"==$(this).val()&&(swal({title:"Sorry!",text:"You can't prioritize both ICBM and SSBN.",timer:4e3,type:"error"}),$(this).attr("checked",!1))})}if("Consist of a triad (three delivery systems)"==$(this).val()){var t=$(this).attr("name");$('input[type="checkbox"]').each(function(){$(this).attr("name")==t&&(("Consist of a dyad (two delivery systems)"==$(this).val()&&$(this).is(":checked")||"Consist of a monad (one delivery system)"==$(this).val()&&$(this).is(":checked"))&&($(this).attr("checked",!1),swal({title:"Sorry!",text:"You can only make one selection among Triad, Dyad, and Monad.",timer:4e3,type:"error"})),("Retain SSBN"==$(this).val()||"Retain ICBM"==$(this).val()||"Retain bombers"==$(this).val())&&$(this).attr("checked",!0))})}if("Consist of a dyad (two delivery systems)"==$(this).val()&&$(this).is(":checked")){var t=$(this).attr("name"),e=0;$('input[type="checkbox"]').each(function(){$(this).attr("name")==t&&(("Consist of a monad (one delivery system)"==$(this).val()&&$(this).is(":checked")||"Consist of a triad (three delivery systems)"==$(this).val()&&$(this).is(":checked"))&&($(this).attr("checked",!1),swal({title:"Sorry!",text:"You can only make one selection among Triad, Dyad, and Monad.",timer:4e3,type:"error"})),("Retain SSBN"==$(this).val()||"Retain ICBM"==$(this).val()||"Retain bombers"==$(this).val())&&$(this).is(":checked")&&e++)}),3==e&&($('input[type="checkbox"]').each(function(){("Retain SSBN"==$(this).val()||"Retain ICBM"==$(this).val()||"Retain bombers"==$(this).val())&&$(this).attr("checked",!1)}),swal({title:"Sorry!",text:'You can only select two "retain" options. Please reselect your choices.',timer:4e3,type:"error"}))}if("Consist of a monad (one delivery system)"==$(this).val()&&$(this).is(":checked")){var t=$(this).attr("name"),e=0;$('input[type="checkbox"]').each(function(){$(this).attr("name")==t&&(("Consist of a dyad (two delivery systems)"==$(this).val()&&$(this).is(":checked")||"Consist of a triad (three delivery systems)"==$(this).val()&&$(this).is(":checked"))&&($(this).attr("checked",!1),swal({title:"Sorry!",text:"You can only make one selection among Triad, Dyad, and Monad.",timer:4e3,type:"error"})),("Retain SSBN"==$(this).val()||"Retain ICBM"==$(this).val()||"Retain bombers"==$(this).val())&&$(this).is(":checked")&&$(this).attr("name")==t&&e++)}),e>=2&&($('input[type="checkbox"]').each(function(){("Retain SSBN"==$(this).val()||"Retain ICBM"==$(this).val()||"Retain bombers"==$(this).val())&&$(this).attr("name")==t&&$(this).attr("checked",!1)}),swal({title:"Sorry!",text:'You can only select one "retain" options. Please reselect your choices.',timer:4e3,type:"error"}))}if(("Retain SSBN"==$(this).val()||"Retain ICBM"==$(this).val()||"Retain bombers"==$(this).val())&&$(this).is(":checked")){var t=$(this).attr("name"),i=!1,a=!1,e=0;$('input[type="checkbox"]').each(function(){"Consist of a dyad (two delivery systems)"==$(this).val()&&$(this).is(":checked")&&$(this).attr("name")==t&&(i=!0),"Consist of a monad (one delivery system)"==$(this).val()&&$(this).is(":checked")&&$(this).attr("name")==t&&(a=!0),$(this).attr("name")==t&&("Retain ICBM"==$(this).val()||"Retain bombers"==$(this).val()||"Retain SSBN"==$(this).val())&&$(this).is(":checked")&&e++}),3==e&&i&&($('input[type="checkbox"]').each(function(){("Retain SSBN"==$(this).val()||"Retain ICBM"==$(this).val()||"Retain bombers"==$(this).val())&&$(this).attr("name")==t&&$(this).attr("checked",!1)}),swal({title:"Sorry!",text:'You can only select two "retain" options. Please reselect your choices.',timer:4e3,type:"error"})),e>=2&&a&&($('input[type="checkbox"]').each(function(){("Retain SSBN"==$(this).val()||"Retain ICBM"==$(this).val()||"Retain bombers"==$(this).val())&&$(this).attr("name")==t&&$(this).attr("checked",!1)}),swal({title:"Sorry!",text:'You can only select one "retain" options. Please reselect your choices.',timer:4e3,type:"error"}))}})});