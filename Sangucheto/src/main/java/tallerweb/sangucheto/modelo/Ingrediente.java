package tallerweb.sangucheto.modelo;

public class Ingrediente {

	private String nombre;
	private Double precio;
	private TipoIngrediente tipo;

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Double getPrecio() {
		return precio;
	}

	public void setPrecio(Double precio) {
		this.precio = precio;
	}

	public TipoIngrediente getTipo() {
		return tipo;
	}

	public void setTipo(TipoIngrediente tipo) {
		this.tipo = tipo;
	}

	@Override
	public int hashCode() {
		return Integer.valueOf(nombre.charAt(0));
	}

	@Override
	public boolean equals(Object obj) {
		if (this.getNombre().equalsIgnoreCase(((Ingrediente) obj).getNombre())) {
			return true;
		}
		return false;
	}
}
