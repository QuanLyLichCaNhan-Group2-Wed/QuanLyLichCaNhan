package dao;

public interface UserDao {
	public boolean Login(String username, String password);
	public boolean CheckUser(String username, String password);
	public boolean CheckUserExists(String username);
	public String getFullName(String username);
	public int getId(String username);
	public String getPassword(String username);
	public boolean checkBlock(String username);
}
