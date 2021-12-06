/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author kgmez
 */
public class randomPass {
   private String pass="";
   
   
   public String hacerPassword(int cant){
       for(int i=0;i< cant-2;i++){
            pass=pass+ caracterRamdom("abcdefghijklmnopqrstvwxyz");
        }
       String cantRand=caracterRamdom("0123456789");
       pass= inserRandom(pass,cantRand);
       String caracterRand=caracterRamdom("@:-#$%&");
       pass= inserRandom(pass,caracterRand);
       
       return pass;
   }
   
   public String caracterRamdom(String caracter){
       int n=caracter.length();
       int r= (int)(n*Math.random());
       return caracter.substring(r,r+1);
   }
   
   public String inserRandom(String str,String str2){
       int n=str.length();
       int r= (int)(n*Math.random());
       return str.substring(0,r)+str2+str.substring(r);
   }
   public  String convert(String s) {
        try {
            // Create MD5 Hash
            MessageDigest digest = MessageDigest.getInstance("MD5");
            digest.update(s.getBytes());
            byte messageDigest[] = digest.digest();

            // Create Hex String
            StringBuilder hexString = new StringBuilder();
            for (byte b : messageDigest) {
                hexString.append(Integer.toHexString(0xFF & b));
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

}
