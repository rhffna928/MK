package com.project.member.service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class EncryptPwd {
    private String pwd;

    public EncryptPwd(String pwd) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("SHA-256");

        md.update(pwd.getBytes());

        StringBuilder builder = new StringBuilder();

        for (byte b: md.digest()) {
            builder.append(String.format("%02x", b));
        }
        this.pwd = builder.toString();
    }

    public String getPwd() {
        return pwd;
    }

}
