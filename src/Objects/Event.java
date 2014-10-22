package Objects;
public class Event {

	private int day;
	private int month;
	private int year;
	private String name;
	private Host host;
	private String description;

	public Event(int day, int month, int year, String name, Host host,
			String description) {

		this.day = day;
		this.month = month;
		this.year = year;
		this.name = name;
		this.host = host;
		this.description = description;

	}

	public int getDay() {
		return day;
	}

	public int getMonth() {
		return month;
	}

	public int getYear() {
		return year;
	}

	public String getEventName() {
		return name;
	}

	public Host getHost() {
		return host;
	}

	public String getDescription() {
		return description;
	}

	private void setHost(Host host) {
		this.host = host;
	}

	private void setName(String name) {
		this.name = name;
	}
}
