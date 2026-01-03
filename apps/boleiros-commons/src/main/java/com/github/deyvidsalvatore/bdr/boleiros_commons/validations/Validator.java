package com.github.deyvidsalvatore.bdr.boleiros_commons.validations;

import com.github.deyvidsalvatore.bdr.boleiros_commons.exceptions.ValidationException;

import java.util.ArrayList;
import java.util.List;

public abstract class Validator<T> {

    private final List<String> errors = new ArrayList<>();

    protected void rule(boolean condition, String message) {
        if (!condition) {
            errors.add(message);
        }
    }

    protected void clear() {
        errors.clear();
    }

    protected boolean isValidEmail(String email) {
        if (email == null || email.isBlank()) {
            return false;
        }

        return email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$");
    }

    protected boolean isValidPassword(String password) {
        if (password == null) {
            return false;
        }

        int length = password.length();

        if (length < 6 || length > 16) {
            return false;
        }

        long numbers = password.chars().filter(Character::isDigit).count();
        long upperCase = password.chars().filter(Character::isUpperCase).count();
        long letters = password.chars().filter(Character::isLetter).count();
        long symbols = password.chars()
                .filter(c -> !Character.isLetterOrDigit(c))
                .count();

        return numbers >= 2
                && upperCase >= 1
                && letters >= 2
                && symbols >= 1;
    }


    public void validateAndThrow() {
        if (!errors.isEmpty()) {
            throw new ValidationException(errors);
        }
    }
}
