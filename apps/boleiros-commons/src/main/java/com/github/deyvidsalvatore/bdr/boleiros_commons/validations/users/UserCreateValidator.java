package com.github.deyvidsalvatore.bdr.boleiros_commons.validations.users;

import com.github.deyvidsalvatore.bdr.boleiros_commons.dtos.requests.UserRequest;
import com.github.deyvidsalvatore.bdr.boleiros_commons.validations.Validator;
import org.springframework.stereotype.Component;

@Component
public class UserCreateValidator extends Validator<UserRequest> {

    public void validate(UserRequest user) {
        clear();

        rule(user.fullName() != null && !user.fullName().isBlank(),
                "Full name is required");

        rule(user.email() != null && !user.email().isBlank(),
                "Email is required");

        rule(isValidEmail(user.email()),
                "Email is invalid");

        rule(isValidPassword(user.password()),
                "Password must have 6–16 characters, at least 2 numbers, 1 uppercase letter, 2 letters total and 1 special symbol");

        validateAndThrow();
    }
}
