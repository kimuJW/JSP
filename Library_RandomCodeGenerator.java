package function;
import java.util.Random;

import java.util.Random;

public class RandomCodeGenerator {
    public static void main(String[] args) {
        String randomCode = generateRandomCode(12);
        System.out.println(randomCode);
    }

    public static String generateRandomCode(int length) {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder sb = new StringBuilder(length);
        Random random = new Random();

        for (int i = 0; i < length; i++) {
            int index = random.nextInt(characters.length());
            sb.append(characters.charAt(index));
        }

        return sb.toString();
    }
}