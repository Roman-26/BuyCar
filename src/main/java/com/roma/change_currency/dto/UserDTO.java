package com.roma.change_currency.dto;

import com.roma.change_currency.validator.RegistrationValid;
import org.springframework.validation.annotation.Validated;

@Validated
@RegistrationValid
public class UserDTO {
    private String username;
    private String email;
    private String password;
    private String repeatPassword;

    // errors
    private String alreadyExistsError;
    private String invalidEmail;
    private String invalidUsername;
    private String invalidPassword;
    private String passwordsDoNotMatch;

    public UserDTO() {
    }

    public String getAlreadyExistsError() {
        return alreadyExistsError;
    }

    public void setAlreadyExistsError(String alreadyExistsError) {
        this.alreadyExistsError = alreadyExistsError;
    }

    public String getInvalidEmail() {
        return invalidEmail;
    }

    public void setInvalidEmail(String invalidEmail) {
        this.invalidEmail = invalidEmail;
    }

    public String getInvalidUsername() {
        return invalidUsername;
    }

    public void setInvalidUsername(String invalidUsername) {
        this.invalidUsername = invalidUsername;
    }

    public String getInvalidPassword() {
        return invalidPassword;
    }

    public void setInvalidPassword(String invalidPassword) {
        this.invalidPassword = invalidPassword;
    }

    public String getPasswordsDoNotMatch() {
        return passwordsDoNotMatch;
    }

    public void setPasswordsDoNotMatch(String passwordsDoNotMatch) {
        this.passwordsDoNotMatch = passwordsDoNotMatch;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRepeatPassword() {
        return repeatPassword;
    }

    public void setRepeatPassword(String repeatPassword) {
        this.repeatPassword = repeatPassword;
    }

    @Override
    public String toString() {
        return "UserDTO{" +
                "username='" + username + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", repeatPassword='" + repeatPassword + '\'' +
                '}';
    }
}
