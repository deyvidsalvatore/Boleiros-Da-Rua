package com.github.deyvidsalvatore.bdr.boleiros_commons.dtos.requests;

public record UserRequest(
        String fullName,
        String email,
        String password,
        String educationLevel,
        String profilePictureUrl
) {
}
