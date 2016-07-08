$(document).ready(function(){
	$("#btnMensajeVolver").click(function(event){
		event.preventDefault();
		window.history.back();
	});
	
	//$(".mascara-decimal").maskMoney();
	
	$(".mascara-decimal").maskMoney({prefix:'AR$ ', allowNegative: true, thousands:',', decimal:'.', affixesStay: false});
});