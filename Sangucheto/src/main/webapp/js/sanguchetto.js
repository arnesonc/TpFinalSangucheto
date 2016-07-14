$(document).ready(function(){
	$("#btnMensajeVolver").click(function(event){
		event.preventDefault();
		window.history.back();
	});
	
	$(".mascara-decimal").maskMoney({prefix:'AR$ ', allowNegative: false, thousands:',', decimal:'.', affixesStay: false});
	
//	$("#btnGuardarStockIngrediente").click(function(e){
//		e.preventDefault();
//		enviarFormulario($("#frmAgregarCantidad"), $("txtPrecioAgregarIngrediente"));
//	});
//	
//	$("#btnNuevoIngrediente").click(function(e){
//		e.preventDefault();
//		enviarFormulario($("#frmNuevoIngrediente"), $("txtnuevoIngrediente"));
//	});
});

//function enviarFormulario(frmForm, txtPrecio){
//	var precio = txtPrecio.val();
//	if(precio < 0){
//		alert("El precio no puede ser menor que cero.");
//		txtPrecio.focus();
//		return false;
//	}else{
//		frmForm.submit();
//	}
//}
