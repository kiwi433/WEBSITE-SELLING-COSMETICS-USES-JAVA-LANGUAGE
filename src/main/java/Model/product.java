package Model;

public class product {
	private String id;
	private String name;
	private String description;
	private String image;
	private String price;
	private int quantity;
private String category;
	public product() {
		super();
		// TODO Auto-generated constructor stub
	}

	public product(String id, String name, String description, String image, String price,int quantity,String category) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.image = image;
		this.price = price;
		this.quantity=quantity;
		this.category=category;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	
	@Override
	public String toString() {
		return "product [id=" + id + ", name=" + name + ", description=" + description + ", image=" + image + ", price="
				+ price +",quantity="+quantity+ ",category"+category+"]";
	}

}