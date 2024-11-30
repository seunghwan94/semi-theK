package servlet.user;

import at.favre.lib.crypto.bcrypt.BCrypt;

public class PassWord {
	public static void main(String[] args) {
		String password = "1234";
        String password2 = "12345";


        String crypt = BCrypt.withDefaults().hashToString(8, password.toCharArray());
        System.out.println(crypt);
        BCrypt.Result result = BCrypt.verifyer().verify(crypt.toCharArray(),crypt);
        System.out.println(result.verified);
	}
}
