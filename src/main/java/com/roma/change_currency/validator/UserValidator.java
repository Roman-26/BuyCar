package com.roma.change_currency.validator;

import com.roma.change_currency.dto.UserDTO;
import com.roma.change_currency.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class UserValidator implements ConstraintValidator<RegistrationValid,UserDTO> {

    @Autowired
    private UserRepository userRepository;

    @Override
    public void initialize(RegistrationValid constraintAnnotation) {

    }

    @Override
    public boolean isValid(UserDTO userDTO, ConstraintValidatorContext constraintValidatorContext) {
        boolean isOk = true;

        if (userDTO.getEmail().isEmpty() ||
                userDTO.getUsername().isEmpty() ||
                userDTO.getPassword().isEmpty()) {
            userDTO.setInvalidEmail(userDTO.getEmail().isEmpty() ? "Email cannot be empty!" : "");
            userDTO.setInvalidUsername(userDTO.getUsername().isEmpty() ? "Username cannot be empty!" : "");
            userDTO.setInvalidPassword(userDTO.getPassword().isEmpty() ? "Password cannot be empty!" : "");
            isOk = false;
        }
        if (!userDTO.getPassword().equals(userDTO.getRepeatPassword())) {
            userDTO.setPasswordsDoNotMatch("Passwords do not match!");
            isOk = false;
        }
        if (userRepository.existsUserByUsernameOrEmail(userDTO.getUsername(), userDTO.getEmail())) {
            userDTO.setAlreadyExistsError("User with this username or email already exists!");
            isOk = false;
        }
        return isOk;
    }
}
