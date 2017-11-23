$(document).ready();


function login() {


	$("#login").on( "click", function() {
	  var semail = $("#email").val();
		var spass = $("#password").val();
    
    $.ajax({
      url: "/inicio/create",
      params: {correo:  "jose"},
      success: function(data) {
        var datos = jQuery.parseJSON(data);
        console.log(datos.exito);
        if(datos.exito == true){
          location.href='/dashboard';
        }
        else{
          $("#resultado").text(datos.msg);
        }
      },
      failure: function() {
        $("#resultado").text("Error Servidor no conectado");
      }
    });


	});
}





