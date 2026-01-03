package com.github.deyvidsalvatore.bdr.boleiros_commons.mappers.users;

import com.github.deyvidsalvatore.bdr.boleiros_commons.dtos.requests.UserRequest;
import com.github.deyvidsalvatore.bdr.boleiros_commons.dtos.responses.UserResponse;
import com.github.deyvidsalvatore.bdr.boleiros_commons.models.users.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class UserMapper {

    @Autowired
    private PasswordEncoder passwordEncoder;

    public User convertRequestToUser(UserRequest request) {
        User user = new User();
        user.setFullName(request.fullName());
        user.setEmail(request.email());
        user.setPasswordHash(passwordEncoder.encode(request.password()));
        user.setEducationLevel(request.educationLevel());
        user.setProfilePictureUrl(
                request.profilePictureUrl().isEmpty() ? "default.png" : request.profilePictureUrl()
        );
        return user;
    }

    public UserResponse convertUserToResponse(User user) {
        return new UserResponse(
                user.getFullName(),
                user.getEmail(),
                user.getEducationLevel(),
                user.getProfilePictureUrl(),
                user.isActive(),
                user.getCreatedAt(),
                user.getUpdatedAt()
        );
    }
}
