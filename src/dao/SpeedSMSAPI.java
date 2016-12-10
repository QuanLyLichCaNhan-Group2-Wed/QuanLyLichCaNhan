package dao;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.xml.bind.DatatypeConverter;
public class SpeedSMSAPI {
	public static final String API_URL = "http://api.speedsms.vn/index.php";
	protected String mAccessToken;
	
	
	

	public SpeedSMSAPI(String accessToken) {
		// TODO Auto-generated constructor stub
		this.mAccessToken = accessToken;
		}


	/**
	 * Get user information
	 * @param: none
	 * @return: json string
	* */
	public String getUserInfo() throws IOException {
		URL url = new URL(API_URL + "/user/info"); 
		HttpURLConnection conn = (HttpURLConnection)url.openConnection();
		conn.setRequestMethod("GET");
		String userCredentials = mAccessToken + ":x";
		String basicAuth = "Basic " + DatatypeConverter.printBase64Binary(userCredentials.getBytes());
		conn.setRequestProperty ("Authorization", basicAuth);
		
		BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		String inputLine = "";
		StringBuffer buffer = new StringBuffer();

		while ((inputLine = in.readLine()) != null) {
			buffer.append(inputLine);
		}
		in.close();
		return buffer.toString();
	}
	
	public String sendSMS(String json) throws IOException {
		URL url = new URL(API_URL + "/sms/send"); 
		HttpURLConnection conn = (HttpURLConnection)url.openConnection();
		conn.setRequestMethod("POST");
		String userCredentials = mAccessToken + ":x";
		String basicAuth = "Basic " + DatatypeConverter.printBase64Binary(userCredentials.getBytes());
		conn.setRequestProperty ("Authorization", basicAuth);
		conn.setRequestProperty("Content-Type", "application/json");
		
		conn.setDoOutput(true);
		DataOutputStream wr = new DataOutputStream(conn.getOutputStream());
		wr.writeBytes(json);
		wr.flush();
		wr.close();
		
		BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		String inputLine = "";
		StringBuffer buffer = new StringBuffer();

		while ((inputLine = in.readLine()) != null) {
			buffer.append(inputLine);
		}
		in.close();
		return buffer.toString();		
	}
	
	public String getStatus(int tranId) throws IOException {
		URL url = new URL(API_URL + "/sms/status/" + tranId); 
		HttpURLConnection conn = (HttpURLConnection)url.openConnection();
		conn.setRequestMethod("GET");
		String userCredentials = mAccessToken + ":x";
		String basicAuth = "Basic " + DatatypeConverter.printBase64Binary(userCredentials.getBytes());
		conn.setRequestProperty ("Authorization", basicAuth);
		
		BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		String inputLine = "";
		StringBuffer buffer = new StringBuffer();

		while ((inputLine = in.readLine()) != null) {
			buffer.append(inputLine);
		}
		in.close();
		return buffer.toString();
	}

	
}