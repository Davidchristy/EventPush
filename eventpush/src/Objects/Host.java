package Objects;
public class Host {

	private String username;
	private boolean partner;

	public Host() {

		this.username = null;
		this.partner = false;

	}

	public Host(String username, boolean partner) {
		this.username = username;
		this.partner = partner;
	}

	public String getUsername() {
		return this.username;
	}

	public boolean getPartner() {
		return this.partner;
	}

	private void setPartner(boolean isPartner) {
		this.partner = isPartner;

	}

	private void setUsername(String username) {
		this.username = username;
	}

}
