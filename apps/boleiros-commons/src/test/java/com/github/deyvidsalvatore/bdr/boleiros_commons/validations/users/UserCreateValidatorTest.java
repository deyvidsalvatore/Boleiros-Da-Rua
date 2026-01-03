package com.github.deyvidsalvatore.bdr.boleiros_commons.validations.users;

import com.github.deyvidsalvatore.bdr.boleiros_commons.dtos.requests.UserRequest;
import com.github.deyvidsalvatore.bdr.boleiros_commons.exceptions.ValidationException;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class UserCreateValidatorTest {

    private UserCreateValidator validator;

    @BeforeEach
    void setUp() {
        validator = new UserCreateValidator();
    }

    @Test
    void shouldPassWhenUserIsValid() {
        UserRequest request = new UserRequest(
                "Deyvid Salvatore",
                "deyvid@email.com",
                "D981@c",
                "College",
                null
        );

        assertDoesNotThrow(() -> validator.validate(request));
    }

    @Test
    void shouldFailWhenEmailIsInvalid() {
        UserRequest request = new UserRequest(
                "Deyvid Salvatore",
                "email-invalido",
                "D981@c",
                "College",
                null
        );

        ValidationException exception =
                assertThrows(ValidationException.class,
                        () -> validator.validate(request));

        assertTrue(exception.getErrors().contains("Email is invalid"));
    }

    @Test
    void shouldFailWhenPasswordIsWeak() {
        UserRequest request = new UserRequest(
                "Deyvid Salvatore",
                "deyvid@email.com",
                "abc123",
                "College",
                null
        );

        ValidationException exception =
                assertThrows(ValidationException.class,
                        () -> validator.validate(request));

        assertTrue(
                exception.getErrors().get(0).contains("Password must have")
        );
    }

    @Test
    void shouldFailWhenFullNameIsBlank() {
        UserRequest request = new UserRequest(
                "",
                "deyvid@email.com",
                "D981@c",
                "College",
                null
        );

        ValidationException exception =
                assertThrows(ValidationException.class,
                        () -> validator.validate(request));

        assertTrue(exception.getErrors().contains("Full name is required"));
    }

    @Test
    void shouldReturnMultipleErrorsWhenMoreThanOneRuleFails() {
        UserRequest request = new UserRequest(
                "",
                "email-invalido",
                "123",
                "College",
                null
        );

        ValidationException exception =
                assertThrows(ValidationException.class,
                        () -> validator.validate(request));

        assertEquals(3, exception.getErrors().size());
    }

    @Test
    void shouldFailWhenEmailIsNull() {
        UserRequest request = new UserRequest(
                "Deyvid Salvatore",
                null,
                "D981@c",
                "College",
                null
        );

        ValidationException exception =
                assertThrows(ValidationException.class,
                        () -> validator.validate(request));

        assertTrue(exception.getErrors().contains("Email is required"));
    }

    @Test
    void shouldFailWhenEmailIsBlank() {
        UserRequest request = new UserRequest(
                "Deyvid Salvatore",
                "   ",
                "D981@c",
                "College",
                null
        );

        ValidationException exception =
                assertThrows(ValidationException.class,
                        () -> validator.validate(request));

        assertTrue(exception.getErrors().contains("Email is required"));
    }

    @Test
    void shouldFailWhenPasswordIsNull() {
        UserRequest request = new UserRequest(
                "Deyvid Salvatore",
                "deyvid@email.com",
                null,
                "College",
                null
        );

        ValidationException exception =
                assertThrows(ValidationException.class,
                        () -> validator.validate(request));

        assertTrue(
                exception.getErrors().get(0).contains("Password must have")
        );
    }

    @Test
    void shouldFailWhenPasswordIsTooShort() {
        UserRequest request = new UserRequest(
                "Deyvid Salvatore",
                "deyvid@email.com",
                "D9@c",
                "College",
                null
        );

        ValidationException exception =
                assertThrows(ValidationException.class,
                        () -> validator.validate(request));

        assertTrue(exception.getErrors().get(0).contains("Password must have"));
    }

    @Test
    void shouldFailWhenPasswordIsTooLong() {
        UserRequest request = new UserRequest(
                "Deyvid Salvatore",
                "deyvid@email.com",
                "D981@cD981@cD981@cX",
                "College",
                null
        );

        ValidationException exception =
                assertThrows(ValidationException.class,
                        () -> validator.validate(request));

        assertTrue(exception.getErrors().get(0).contains("Password must have"));
    }

    @Test
    void shouldFailWhenPasswordHasLessThanTwoNumbers() {
        UserRequest request = new UserRequest(
                "Deyvid Salvatore",
                "deyvid@email.com",
                "D9@abc",
                "College",
                null
        );

        ValidationException exception =
                assertThrows(ValidationException.class,
                        () -> validator.validate(request));

        assertTrue(exception.getErrors().get(0).contains("Password must have"));
    }

    @Test
    void shouldFailWhenPasswordHasNoUppercaseLetter() {
        UserRequest request = new UserRequest(
                "Deyvid Salvatore",
                "deyvid@email.com",
                "d981@c",
                "College",
                null
        );

        ValidationException exception =
                assertThrows(ValidationException.class,
                        () -> validator.validate(request));

        assertTrue(exception.getErrors().get(0).contains("Password must have"));
    }

    @Test
    void shouldFailWhenPasswordHasLessThanTwoLetters() {
        UserRequest request = new UserRequest(
                "Deyvid Salvatore",
                "deyvid@email.com",
                "D981@1",
                "College",
                null
        );

        ValidationException exception =
                assertThrows(ValidationException.class,
                        () -> validator.validate(request));

        assertTrue(exception.getErrors().get(0).contains("Password must have"));
    }

    @Test
    void shouldFailWhenPasswordHasNoSpecialSymbol() {
        UserRequest request = new UserRequest(
                "Deyvid Salvatore",
                "deyvid@email.com",
                "D981ac",
                "College",
                null
        );

        ValidationException exception =
                assertThrows(ValidationException.class,
                        () -> validator.validate(request));

        assertTrue(exception.getErrors().get(0).contains("Password must have"));
    }

    @Test
    void shouldFailWhenFullNameIsNull() {
        UserRequest request = new UserRequest(
                null,
                "deyvid@email.com",
                "D981@c",
                "College",
                null
        );

        ValidationException exception =
                assertThrows(ValidationException.class,
                        () -> validator.validate(request));

        assertTrue(exception.getErrors().contains("Full name is required"));
    }

    @Test
    void shouldPassWhenEmailIsValidFormat() {
        UserRequest request = new UserRequest(
                "Deyvid Salvatore",
                "user.name+test123@email-domain.com",
                "D981@c",
                "College",
                null
        );

        assertDoesNotThrow(() -> validator.validate(request));
    }

    @Test
    void shouldPassWhenPasswordHasExactly6Characters() {
        UserRequest request = new UserRequest(
                "Deyvid Salvatore",
                "deyvid@email.com",
                "D9@1aB",
                "College",
                null
        );

        assertDoesNotThrow(() -> validator.validate(request));
    }

    @Test
    void shouldPassWhenPasswordHasExactly16Characters() {
        UserRequest request = new UserRequest(
                "Deyvid Salvatore",
                "deyvid@email.com",
                "D98@abc1EFgh2!X",
                "College",
                null
        );

        assertDoesNotThrow(() -> validator.validate(request));
    }

    @Test
    void shouldPassWhenPasswordHasExactlyTwoNumbers() {
        UserRequest request = new UserRequest(
                "Deyvid Salvatore",
                "deyvid@email.com",
                "D9@a1b",
                "College",
                null
        );

        assertDoesNotThrow(() -> validator.validate(request));
    }

    @Test
    void shouldPassWhenPasswordHasExactlyOneUppercaseLetter() {
        UserRequest request = new UserRequest(
                "Deyvid Salvatore",
                "deyvid@email.com",
                "D9@a1b",
                "College",
                null
        );

        assertDoesNotThrow(() -> validator.validate(request));
    }

    @Test
    void shouldPassWhenPasswordHasExactlyTwoLetters() {
        UserRequest request = new UserRequest(
                "Deyvid Salvatore",
                "deyvid@email.com",
                "D9@1c2",
                "College",
                null
        );

        assertDoesNotThrow(() -> validator.validate(request));
    }

    @Test
    void shouldPassWhenPasswordHasExactlyOneSpecialSymbol() {
        UserRequest request = new UserRequest(
                "Deyvid Salvatore",
                "deyvid@email.com",
                "D9@a1b",
                "College",
                null
        );

        assertDoesNotThrow(() -> validator.validate(request));
    }

    @Test
    void shouldNotKeepErrorsBetweenValidations() {
        UserRequest invalidRequest = new UserRequest(
                "",
                "email-invalido",
                "123",
                "College",
                null
        );

        assertThrows(ValidationException.class,
                () -> validator.validate(invalidRequest));

        UserRequest validRequest = new UserRequest(
                "Deyvid Salvatore",
                "deyvid@email.com",
                "D981@c",
                "College",
                null
        );

        assertDoesNotThrow(() -> validator.validate(validRequest));
    }

}